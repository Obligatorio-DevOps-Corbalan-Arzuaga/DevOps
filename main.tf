variable "projects" {
  description = "Lista de proyectos"
  type        = list(string)
  default     = ["shipping-service", "orders-service", "products-service", "payment-service"]
}

variable "environments" {
  description = "Lista de ambientes"
  type        = list(string)
  default     = ["develop", "staging", "preprod"]
}

# VPC
resource "aws_vpc" "main_vpc" {
  for_each = toset(var.environments)

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${each.value}-vpc"
  }
}

# Subnets
resource "aws_subnet" "public_subnet_1" {
  for_each = toset(var.environments)

  vpc_id                  = aws_vpc.main_vpc[each.value].id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${each.value}-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  for_each = toset(var.environments)

  vpc_id                  = aws_vpc.main_vpc[each.value].id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "${each.value}-subnet-2"
  }
}

# Secutiry groups (por proyecto)
resource "aws_security_group" "main_sg" {
  for_each = toset(var.projects)

  name        = "${each.value}-sg"
  description = "Security group para ${each.value}"
  vpc_id      = aws_vpc.main_vpc[each.value].id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${each.value}-sg"
  }
}

resource "aws_ecs_task_definition" "task" {
  for_each = toset(var.projects)

  family                   = "${each.value}-${terraform.workspace}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::634518649880:role/LabRole"
  task_role_arn            = "arn:aws:iam::634518649880:role/LabRole"

  container_definitions = jsonencode([{
    name      = "${each.value}-${terraform.workspace}-container"
    image     = "stacksimplify/nginxapp1:latest"
    essential = true
    portMappings = [{
      protocol      = "tcp"
      containerPort = 80
      hostPort      = 80
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options   = {
        awslogs-create-group  = "true"
        awslogs-group         = "/ecs/${each.value}-${terraform.workspace}-task"
        awslogs-region        = "us-east-1"
        awslogs-stream-prefix = "ecs"
      }
    }
  }])

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}

locals {
  task_definitions = {
    for p in var.projects : 
    p => aws_ecs_task_definition.task["${p}-${terraform.workspace}"].arn
  }
}

resource "aws_ecs_service" "main" {
  for_each = toset(var.projects)

  name                               = "${each.value}-${terraform.workspace}-service"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = local.task_definitions[each.value]
  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  force_new_deployment               = true

  network_configuration {
    subnets         = [aws_subnet.public_subnet_1[each.value].id, aws_subnet.public_subnet_2[each.value].id]
    security_groups = [aws_security_group.main_sg[each.value].id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "${each.value}-${terraform.workspace}-container"
    container_port   = 80
  }

  depends_on = [
    aws_ecs_task_definition.task[each.value],
    aws_lb_listener.http_listener,
    aws_lb_target_group.ecs_tg,
  ]
}