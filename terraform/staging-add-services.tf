
# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-STAGING
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "products-service-staging" {
    name                               = "products-service-staging"
    cluster                            = aws_ecs_cluster.staging-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.products-staging-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 100
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
        security_groups = [aws_security_group.staging_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.products-service-staging-tg.arn
      container_name   = "products-service-staging-container"
      container_port   = 8080
    }

    depends_on = [
        aws_ecs_task_definition.products-staging-task,
        aws_lb_listener.http_listener_products_staging,
        aws_lb_target_group.products-service-staging-tg,
    ]
}

resource "aws_ecs_task_definition" "products-staging-task" {
    family                   = "products-staging-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "products-service-staging-container"
        image     = var.docker_images["products-service-staging"]
       
        # environment = [
        #     {
        #         name  = ""
        #         value = ""
        #     }
        # ]
        essential = true
        portMappings = [{
            protocol      = "tcp"
            containerPort = 8080
            hostPort      = 8080
        }]
        logConfiguration = {
            logDriver = "awslogs"
            options   = {
                awslogs-create-group  = "true"
                awslogs-group         = "/ecs/products-staging-task"
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


# ----------------------------------------------------------------------------------------------------------------------------
#                                          SHIPPING-staging
# ----------------------------------------------------------------------------------------------------------------------------




resource "aws_ecs_service" "shipping-service-staging" {
    name                               = "shipping-service-staging"
    cluster                            = aws_ecs_cluster.staging-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.shipping-staging-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 100
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
        security_groups = [aws_security_group.staging_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.shipping-service-staging-tg.arn
      container_name   = "shipping-service-staging-container"
      container_port   = 8080
    }

    depends_on = [
        aws_ecs_task_definition.shipping-staging-task,
        aws_lb_listener.http_listener_products_staging,
        aws_lb_target_group.products-service-staging-tg,
    ]
}

resource "aws_ecs_task_definition" "shipping-staging-task" {
    family                   = "shipping-staging-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "shipping-service-staging-container"
        image     = var.docker_images["shipping-service-staging"]
       
        # environment = [
        #     {
        #         name  = ""
        #         value = ""
        #     }
        # ]
        essential = true
        portMappings = [{
            protocol      = "tcp"
            containerPort = 8080
            hostPort      = 8080
        }]
        logConfiguration = {
            logDriver = "awslogs"
            options   = {
                awslogs-create-group  = "true"
                awslogs-group         = "/ecs/shipping-staging-task"
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



# ----------------------------------------------------------------------------------------------------------------------------
#                                          PAYMENTS-staging
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "payments-service-staging" {
    name                               = "payments-service-staging"
    cluster                            = aws_ecs_cluster.staging-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.payments-staging-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 100
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
        security_groups = [aws_security_group.staging_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.payments-service-staging-tg.arn
      container_name   = "payments-service-staging-container"
      container_port   = 8080
    }

    depends_on = [
        aws_ecs_task_definition.payments-staging-task,
        aws_lb_listener.http_listener_products_staging,
        aws_lb_target_group.products-service-staging-tg,
    ]
}

resource "aws_ecs_task_definition" "payments-staging-task" {
    family                   = "payments-staging-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "payments-service-staging-container"
        image     = var.docker_images["payments-service-staging"]
       
        # environment = [
        #     {
        #         name  = ""
        #         value = ""
        #     }
        # ]
        essential = true
        portMappings = [{
            protocol      = "tcp"
            containerPort = 8080
            hostPort      = 8080
        }]
        logConfiguration = {
            logDriver = "awslogs"
            options   = {
                awslogs-create-group  = "true"
                awslogs-group         = "/ecs/payments-staging-task"
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

# ----------------------------------------------------------------------------------------------------------------------------
#                                          ORDERS-staging
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "orders-service-staging" {
    name                               = "orders-service-staging"
    cluster                            = aws_ecs_cluster.staging-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.orders-staging-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 100
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
        security_groups = [aws_security_group.staging_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.orders-service-staging-tg.arn
      container_name   = "orders-service-staging-container"
      container_port   = 8080
    }

    depends_on = [
        aws_ecs_task_definition.orders-staging-task,
        aws_lb_listener.http_listener_products_staging,
        aws_lb_target_group.products-service-staging-tg,
    ]
}

resource "aws_ecs_task_definition" "orders-staging-task" {
    family                   = "orders-staging-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "orders-service-staging-container"
        image     = var.docker_images["orders-service-staging"]
       
        # environment = [
        #     {
        #         name  = ""
        #         value = ""
        #     }
        # ]
        essential = true
        portMappings = [{
            protocol      = "tcp"
            containerPort = 8080
            hostPort      = 8080
        }]
        logConfiguration = {
            logDriver = "awslogs"
            options   = {
                awslogs-create-group  = "true"
                awslogs-group         = "/ecs/orders-staging-task"
                awslogs-region        = "us-east-1"
                awslogs-stream-prefix = "ecs"
            }
        }
    }])

    depends_on = [
        
        aws_lb.payments-service-prod-alb,
        aws_lb.shipping-service-prod-alb,
        aws_lb.products-service-prod-alb
      ]

    runtime_platform {
        cpu_architecture        = "X86_64"
        operating_system_family = "LINUX"
    }
}