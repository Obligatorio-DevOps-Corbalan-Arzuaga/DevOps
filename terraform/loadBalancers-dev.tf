# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-dev
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "products-service-dev-alb" {
  name = "products-service-dev-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_sg.id]
  subnets            = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "products-service-dev-alb"
  }
}

resource "aws_lb_target_group" "products-service-dev-tg" {
  name        = "products-service-dev-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.dev_vpc.id
  target_type = "ip"

  health_check {
    path                = "/products"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

}

resource "aws_lb_listener" "http_listener_products_dev" {
  load_balancer_arn = aws_lb.products-service-dev-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products-service-dev-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_products_dev" {
  listener_arn = aws_lb_listener.http_listener_products_dev.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products-service-dev-tg.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          PAYMENTS-dev
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "payments-service-dev-alb" {
  name = "payments-service-dev-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_sg.id]
  subnets            = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "payments-service-dev-alb"
  }
}

resource "aws_lb_target_group" "payments-service-dev-tg" {
  name        = "payments-service-dev-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.dev_vpc.id
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
    Name = "payments-service-dev-tg"
  }
}

resource "aws_lb_listener" "http_listener_payments_dev" {
  load_balancer_arn = aws_lb.payments-service-dev-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments-service-dev-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_payments_dev" {
  listener_arn = aws_lb_listener.http_listener_payments_dev.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments-service-dev-tg.arn
  }
  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          SHIPPING-dev
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "shipping-service-dev-alb" {
  name = "shipping-service-dev-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_sg.id]
  subnets            = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "shipping-service-dev-alb"
  }
}

resource "aws_lb_target_group" "shipping-service-dev-tg" {
  name        = "shipping-service-dev-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.dev_vpc.id
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
    Name = "shipping-service-dev-tg"
  }
}

resource "aws_lb_listener" "http_listener_shipping_dev" {
  load_balancer_arn = aws_lb.shipping-service-dev-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping-service-dev-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_shipping_dev" {
  listener_arn = aws_lb_listener.http_listener_shipping_dev.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping-service-dev-tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          ORDERS-dev
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "orders-service-dev-alb" {
  name = "orders-service-dev-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_sg.id]
  subnets            = [aws_subnet.dev_public_subnet_1.id, aws_subnet.dev_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "orders-service-dev-alb"
  }
}

resource "aws_lb_target_group" "orders-service-dev-tg" {
  name        = "orders-service-dev-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id = aws_vpc.dev_vpc.id
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
    Name = "orders-service-dev-tg"
  }
}

resource "aws_lb_listener" "http_listener_orders_dev" {
  load_balancer_arn = aws_lb.orders-service-dev-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders-service-dev-tg.arn
  }
}

resource "aws_lb_listener_rule" "http_listener_rule_orders_dev" {
  listener_arn = aws_lb_listener.http_listener_orders_dev.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders-service-dev-tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}