variable "project" {
  description = "Indica el nombre del proyecto"
  type        = string
}

variable "docker-image" {
  description = "El tag de la imagen Docker que debe desplegarse"
  type        = string
}

provider "aws" {
  region = "us-east-1"
}

# Se crean los repositorios ECR
resource "aws_ecr_repository" "main_ecr_repo" {
  name                 = "${var.project}-${terraform.workspace}-ecr-repo"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "${var.project}-${terraform.workspace}-ecr-repo"
  }
}

# Se crea la VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${terraform.workspace}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${terraform.workspace}-internet-gateway"
  }
}

# Se crean las subnets, dos por ambiente (con diferentes zonas de disponibilidad para el LB)
resource "aws_subnet" "public_subnet_1" {
  
  vpc_id = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${terraform.workspace}-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "${terraform.workspace}-subnet-2"
  }
}

# Crear route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# Asociar la table a las subnets
resource "aws_route_table_association" "main_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.main.id
}

# Se crean los Security Group, uno por App backend
resource "aws_security_group" "main_sg" {
  name        = "${var.project}-sg"
  description = "Security group para ${var.project}"
  vpc_id = aws_vpc.main_vpc.id

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
    Name = "${var.project}-sg"
  }
}

# Load balancer
resource "aws_lb" "main" {
  name = "${substr(var.project, 0, 10)}-${substr(terraform.workspace, 0, 10)}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "${var.project}-${terraform.workspace}-alb"
  }
}

resource "aws_lb_target_group" "ecs_tg" {
  name        = "${substr(var.project, 0, 10)}-${substr(terraform.workspace, 0, 10)}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_vpc.main_vpc.id
  target_type = "ip"

  tags = {
    Name = "${substr(var.project, 0, 10)}-${substr(terraform.workspace, 0, 10)}-tg"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}

resource "aws_ecs_cluster" "main" {
    name = "${terraform.workspace}-ecs-cluster" // Se utiliza el mismo cluster para todos los proyectos de un mismo ambiente

    setting { // Logs más detallados
        name  = "containerInsights"
        value = "enabled"
    }
}

resource "aws_ecs_task_definition" "task" {
    family                   = "${var.project}-${terraform.workspace}-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = "arn:aws:iam::634518649880:role/LabRole"
    task_role_arn            = "arn:aws:iam::634518649880:role/LabRole"

    container_definitions = jsonencode([{
        name      = "${var.project}-${terraform.workspace}-container"
        image     = "${var.docker-image}"
        #image     = "stacksimplify/nginxapp1:latest"
        # environment = [
        #     {
        #         name  = ""
        #         value = ""
        #     }
        # ]
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
                awslogs-group         = "/ecs/${var.project}-${terraform.workspace}-task"
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

resource "aws_ecs_service" "main" {
    name                               = "${var.project}-${terraform.workspace}-service"
    cluster                            = aws_ecs_cluster.main.id
    task_definition                    = aws_ecs_task_definition.task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
        security_groups = [aws_security_group.main_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.ecs_tg.arn
      container_name   = "${var.project}-${terraform.workspace}-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.task,
        aws_lb_listener.http_listener,
        aws_lb_target_group.ecs_tg,
    ]
}