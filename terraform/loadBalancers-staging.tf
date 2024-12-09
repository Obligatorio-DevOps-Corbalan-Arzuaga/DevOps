# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-staging
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "products-service-staging-alb" {
  name = "products-service-staging-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.staging_sg.id]
  subnets            = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "products-service-staging-alb"
  }
}

resource "aws_lb_target_group" "products-service-staging-tg" {
  name        = "products-service-staging-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.staging_vpc.id
  target_type = "ip"

  health_check {
    path                = "/products"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "products-service-staging-tg"
  }
}

resource "aws_lb_listener" "http_listener_products_staging" {
  load_balancer_arn = aws_lb.products-service-staging-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products-service-staging-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_products_staging" {
  listener_arn = aws_lb_listener.http_listener_products_staging.arn
  priority     = 150

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products-service-staging-tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}



# ----------------------------------------------------------------------------------------------------------------------------
#                                          PAYMENTS-staging
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "payments-service-staging-alb" {
  name = "payments-service-staging-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.staging_sg.id]
  subnets            = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "payments-service-staging-alb"
  }
}

resource "aws_lb_target_group" "payments-service-staging-tg" {
  name        = "payments-service-staging-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.staging_vpc.id
  target_type = "ip"

  health_check {
    path                = "/payments"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "payments-service-staging-tg"
  }
}

resource "aws_lb_listener" "http_listener_payments_staging" {
  load_balancer_arn = aws_lb.payments-service-staging-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments-service-staging-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_payments_staging" {
  listener_arn = aws_lb_listener.http_listener_payments_staging.arn
  priority     = 150

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments-service-staging-tg.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          SHIPPING-staging
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "shipping-service-staging-alb" {
  name = "shipping-service-staging-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.staging_sg.id]
  subnets            = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "shipping-service-staging-alb"
  }
}

resource "aws_lb_target_group" "shipping-service-staging-tg" {
  name        = "shipping-service-staging-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.staging_vpc.id
  target_type = "ip"

  health_check {
    path                = "/shipping"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "shipping-service-staging-tg"
  }
}

resource "aws_lb_listener" "http_listener_shipping_staging" {
  load_balancer_arn = aws_lb.shipping-service-staging-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping-service-staging-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_shipping_staging" {
  listener_arn = aws_lb_listener.http_listener_shipping_staging.arn
  priority     = 150

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping-service-staging-tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          ORDERS-staging
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "orders-service-staging-alb" {
  name = "orders-service-staging-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.staging_sg.id]
  subnets            = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "orders-service-staging-alb"
  }
}

resource "aws_lb_target_group" "orders-service-staging-tg" {
  name        = "orders-service-staging-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.staging_vpc.id
  target_type = "ip"

   health_check {
    path                = "/orders"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "orders-service-staging-tg"
  }
}

resource "aws_lb_listener" "http_listener_orders_staging" {
  load_balancer_arn = aws_lb.orders-service-staging-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders-service-staging-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_orders_staging" {
  listener_arn = aws_lb_listener.http_listener_orders_staging.arn
  priority     = 150

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders-service-staging-tg.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}