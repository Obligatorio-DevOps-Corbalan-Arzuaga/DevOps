# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "products-service-prod-alb" {
  name = "products-service-prod-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod_sg.id]
  subnets            = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "products-service-prod-alb"
  }
}

resource "aws_lb_target_group" "products-service-prod-tg" {
  name        = "products-service-prod-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_vpc.prod_vpc.id
  target_type = "ip"

  tags = {
    Name = "products-service-prod-tg"
  }
}

resource "aws_lb_listener" "http_listener_products_prod" {
  load_balancer_arn = aws_lb.products-service-prod-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products-service-prod-tg.arn
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          PAYMENTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "payments-service-prod-alb" {
  name = "payments-service-prod-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod_sg.id]
  subnets            = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "payments-service-prod-alb"
  }
}

resource "aws_lb_target_group" "payments-service-prod-tg" {
  name        = "payments-service-prod-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_vpc.prod_vpc.id
  target_type = "ip"

  tags = {
    Name = "payments-service-prod-tg"
  }
}

resource "aws_lb_listener" "http_listener_payments_prod" {
  load_balancer_arn = aws_lb.payments-service-prod-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments-service-prod-tg.arn
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          SHIPPING-PROD
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "shipping-service-prod-alb" {
  name = "shipping-service-prod-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod_sg.id]
  subnets            = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "shipping-service-prod-alb"
  }
}

resource "aws_lb_target_group" "shipping-service-prod-tg" {
  name        = "shipping-service-prod-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_vpc.prod_vpc.id
  target_type = "ip"

  tags = {
    Name = "shipping-service-prod-tg"
  }
}

resource "aws_lb_listener" "http_listener_shipping_prod" {
  load_balancer_arn = aws_lb.shipping-service-prod-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping-service-prod-tg.arn
  }
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          ORDERS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

# Load balancer
resource "aws_lb" "orders-service-prod-alb" {
  name = "orders-service-prod-alb"
  internal = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod_sg.id]
  subnets            = [aws_subnet.prod_public_subnet_1.id, aws_subnet.prod_public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "orders-service-prod-alb"
  }
}

resource "aws_lb_target_group" "orders-service-prod-tg" {
  name        = "orders-service-prod-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_vpc.prod_vpc.id
  target_type = "ip"

  tags = {
    Name = "orders-service-prod-tg"
  }
}

resource "aws_lb_listener" "http_listener_orders_prod" {
  load_balancer_arn = aws_lb.orders-service-prod-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders-service-prod-tg.arn
  }
}