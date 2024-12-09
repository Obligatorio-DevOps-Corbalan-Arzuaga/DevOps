
# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-DEV
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "products-service-dev" {
    name                               = "products-service-dev"
    cluster                            = aws_ecs_cluster.develop-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.products-dev-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
        security_groups = [aws_security_group.dev_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.products-service-dev-tg.arn
      container_name   = "products-service-dev-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.products-dev-task,
        aws_lb_listener.http_listener_products_dev,
        aws_lb_target_group.products-service-dev-tg,
    ]
}

resource "aws_ecs_task_definition" "products-dev-task" {
    family                   = "products-dev-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "products-service-dev-container"
        image     = var.docker_images["products-service-dev"]
       
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
                awslogs-group         = "/ecs/products-dev-task"
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
#                                          SHIPPING-DEV
# ----------------------------------------------------------------------------------------------------------------------------




resource "aws_ecs_service" "shipping-service-dev" {
    name                               = "shipping-service-dev"
    cluster                            = aws_ecs_cluster.develop-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.shipping-dev-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
        security_groups = [aws_security_group.dev_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.shipping-service-dev-tg.arn
      container_name   = "shipping-service-dev-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.shipping-dev-task,
        aws_lb_listener.http_listener_products_dev,
        aws_lb_target_group.shipping-service-dev-tg,
    ]
}

resource "aws_ecs_task_definition" "shipping-dev-task" {
    family                   = "shipping-dev-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "shipping-service-dev-container"
        image     = var.docker_images["shipping-service-dev"]
       
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
                awslogs-group         = "/ecs/shipping-dev-task"
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
#                                          PAYMENTS-DEV
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "payments-service-dev" {
    name                               = "payments-service-dev"
    cluster                            = aws_ecs_cluster.develop-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.payments-dev-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
        security_groups = [aws_security_group.dev_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.payments-service-dev-tg.arn
      container_name   = "payments-service-dev-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.payments-dev-task,
        aws_lb_listener.http_listener_products_dev,
        aws_lb_target_group.payments-service-dev-tg,
    ]
}

resource "aws_ecs_task_definition" "payments-dev-task" {
    family                   = "payments-dev-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "payments-service-dev-container"
        image     = var.docker_images["payments-service-dev"]
       
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
                awslogs-group         = "/ecs/payments-dev-task"
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
#                                          ORDERS-DEV
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "orders-service-dev" {
    name                               = "orders-service-dev"
    cluster                            = aws_ecs_cluster.develop-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.orders-dev-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
        security_groups = [aws_security_group.dev_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.orders-service-dev-tg.arn
      container_name   = "orders-service-dev-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.orders-dev-task,
        aws_lb_listener.http_listener_products_dev,
        aws_lb_target_group.orders-service-dev-tg,
    ]
}

resource "aws_ecs_task_definition" "orders-dev-task" {
    family                   = "orders-dev-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "orders-service-dev-container"
        image     = var.docker_images["orders-service-dev"]
       
        environment = [
            {
                name = "APP_ARGS"
                value = "http://${aws_lb.payments-service-dev-alb.dns_name}:80 http://${aws_lb.shipping-service-dev-alb.dns_name}:80 http://${aws_lb.products-service-dev-alb.dns_name}:80"
            }
        ]
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
                awslogs-group         = "/ecs/orders-dev-task"
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