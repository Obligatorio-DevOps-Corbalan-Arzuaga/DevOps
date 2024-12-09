
# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "products-service-prod" {
    name                               = "products-service-prod"
    cluster                            = aws_ecs_cluster.production-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.products-prod-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
        security_groups = [aws_security_group.prod_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.products-service-prod-tg.arn
      container_name   = "products-service-prod-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.products-prod-task,
        aws_lb_listener.http_listener_products_prod,
        aws_lb_target_group.products-service-prod-tg,
    ]
}

resource "aws_ecs_task_definition" "products-prod-task" {
    family                   = "products-prod-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "products-service-prod-container"
        image     = var.docker_images["products-service-prod"]
       
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
                awslogs-group         = "/ecs/products-prod-task"
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
#                                          SHIPPING-PROD
# ----------------------------------------------------------------------------------------------------------------------------




resource "aws_ecs_service" "shipping-service-prod" {
    name                               = "shipping-service-prod"
    cluster                            = aws_ecs_cluster.production-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.shipping-prod-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
        security_groups = [aws_security_group.prod_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.shipping-service-prod-tg.arn
      container_name   = "shipping-service-prod-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.shipping-prod-task,
        aws_lb_listener.http_listener_products_prod,
        aws_lb_target_group.shipping-service-prod-tg,
    ]
}

resource "aws_ecs_task_definition" "shipping-prod-task" {
    family                   = "shipping-prod-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "shipping-service-prod-container"
        image     = var.docker_images["shipping-service-prod"]
       
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
                awslogs-group         = "/ecs/shipping-prod-task"
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
#                                          PAYMENTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "payments-service-prod" {
    name                               = "payments-service-prod"
    cluster                            = aws_ecs_cluster.production-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.payments-prod-task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    force_new_deployment = true

    network_configuration {
        subnets         = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
        security_groups = [aws_security_group.prod_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.payments-service-prod-tg.arn
      container_name   = "payments-service-prod-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.payments-prod-task,
        aws_lb_listener.http_listener_products_prod,
        aws_lb_target_group.payments-service-prod-tg,
    ]
}

resource "aws_ecs_task_definition" "payments-prod-task" {
    family                   = "payments-prod-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "payments-service-prod-container"
        image     = var.docker_images["payments-service-prod"]
       
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
                awslogs-group         = "/ecs/payments-prod-task"
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
#                                          ORDERS-PROD
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_service" "orders-service-prod" {
    name                               = "orders-service-prod"
    cluster                            = aws_ecs_cluster.production-ecs-cluster.arn
    task_definition                    = aws_ecs_task_definition.orders-prod-task.arn
    desired_count                      = 1
    deployment_minimum_healthy_percent = 100
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"

    network_configuration {
        subnets         = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
        security_groups = [aws_security_group.prod_sg.id]
        assign_public_ip = true
    }

    load_balancer {
      target_group_arn = aws_lb_target_group.orders-service-prod-tg.arn
      container_name   = "orders-service-prod-container"
      container_port   = 80
    }

    depends_on = [
        aws_ecs_task_definition.orders-prod-task,
        aws_lb_listener.http_listener_products_prod,
        aws_lb_target_group.orders-service-prod-tg,
    ]
}

resource "aws_ecs_task_definition" "orders-prod-task" {
    family                   = "orders-prod-task" // El nombre de la task cambia segun el proyecto y su ambiente
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = var.rol_lab
    task_role_arn            = var.rol_lab

    container_definitions = jsonencode([{
        name      = "orders-service-prod-container"
        image     = var.docker_images["orders-service-prod"]
       
        environment = [
            {
                name = "APP_ARGS"
                value = "http://${aws_lb.payments-service-prod-alb.dns_name}:8080 http://${aws_lb.shipping-service-prod-alb.dns_name}:8080 http://${aws_lb.products-service-prod-alb.dns_name}:8080"
            }
        ]
        essential = true
        portMappings = [{

            containerPort = 8080
            hostPort      = 8080
        }]
        logConfiguration = {
            logDriver = "awslogs"
            options   = {
                awslogs-create-group  = "true"
                awslogs-group         = "/ecs/orders-prod-task"
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