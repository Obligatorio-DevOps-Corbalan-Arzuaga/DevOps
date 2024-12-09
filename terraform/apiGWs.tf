resource "aws_apigatewayv2_api" "api-gateway-prod" {
  name                       = "api-gateway-prod"
  protocol_type              = "HTTP"

  tags = {
    Name = "prod-api"
  }
}

resource "aws_apigatewayv2_api" "api-gateway-dev" {
  name                       = "api-gateway-dev"
  protocol_type              = "HTTP"

  tags = {
    Name = "dev-api"
  }
}

resource "aws_apigatewayv2_api" "api-gateway-staging" {
  name                       = "api-gateway-staging"
  protocol_type              = "HTTP"

  tags = {
    Name = "staging-api"
  }
}