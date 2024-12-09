
resource "aws_ecr_repository" "orders_services_dev" {
  name                 = "orders-services-dev"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "orders-services-dev"
  }
}

resource "aws_ecr_repository" "payments_services_dev" {
  name                 = "payments-services-dev"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "payments-services-dev"
  }
}

resource "aws_ecr_repository" "shipping_services_dev" {
  name                 = "shipping-services-dev"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "shipping-services-dev"
  }
}

resource "aws_ecr_repository" "products_services_dev" {
  name                 = "products-services-dev"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "products-services-dev"
  }
}

resource "aws_ecr_repository" "orders_services_staging" {
  name                 = "orders-services-staging"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "orders-services-staging"
  }
}

resource "aws_ecr_repository" "payments_services_staging" {
  name                 = "payments-services-staging"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "payments-services-staging"
  }
}

resource "aws_ecr_repository" "shipping_services_staging" {
  name                 = "shipping-services-staging"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "shipping-services-staging"
  }
}

resource "aws_ecr_repository" "products_services_staging" {
  name                 = "products-services-staging"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "products-services-staging"
  }
}

resource "aws_ecr_repository" "orders_services_prod" {
  name                 = "orders-services-prod"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "orders-services-prod"
  }
}

resource "aws_ecr_repository" "payments_services_prod" {
  name                 = "payments-services-prod"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "payments-services-prod"
  }
}

resource "aws_ecr_repository" "shipping_services_prod" {
  name                 = "shipping-services-prod"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "shipping-services-prod"
  }
}

resource "aws_ecr_repository" "products_services_prod" {
  name                 = "products-services-prod"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "products-services-prod"
  }
}
