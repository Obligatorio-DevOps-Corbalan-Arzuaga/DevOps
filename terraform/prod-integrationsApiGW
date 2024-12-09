# ----------------------------------------------------------------------------------------------------------------------------
#                                          PRODUCTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_integration" "prod_get_all_products_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_method = "GET"
  integration_uri    = "http://${aws_lb.products-service-prod-alb.dns_name}:8080/products"
}

resource "aws_apigatewayv2_route" "prod_get_all_products_integration_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "GET /products"
  target = "integrations/${aws_apigatewayv2_integration.prod_get_all_products_integration.id}"
}

resource "aws_apigatewayv2_integration" "prod_get_product_by_id_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_method = "GET"
  integration_uri    = "http://${aws_lb.products-service-prod-alb.dns_name}:8080/products/{id}"
}

resource "aws_apigatewayv2_route" "prod_get_product_by_id_integration_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "GET /products/{id}"
  target = "integrations/${aws_apigatewayv2_integration.prod_get_product_by_id_integration.id}"
}




# ----------------------------------------------------------------------------------------------------------------------------
#                                          SHIPPING-PROD
# ----------------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_integration" "prod_post_shipping_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://${aws_lb.shipping-service-prod-alb.dns_name}:8080/shipping/{id}"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "prod_post_shipping_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "POST /shipping/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.prod_post_shipping_integration.id}"
}



resource "aws_apigatewayv2_integration" "prod_get_shipping_by_id_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_method = "GET"
  integration_uri    = "http://${aws_lb.shipping-service-prod-alb.dns_name}:8080/shipping/{id}"
}

resource "aws_apigatewayv2_route" "prod_get_shipping_by_id_integration_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "GET /shipping/{id}"
  target = "integrations/${aws_apigatewayv2_integration.prod_get_shipping_by_id_integration.id}"
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          PAYMENTS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_integration" "prod_post_payments_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://${aws_lb.payments-service-prod-alb.dns_name}:8080/payments/{id}"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "prod_post_payments_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "POST /payments/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.prod_post_payments_integration.id}"
}


# ----------------------------------------------------------------------------------------------------------------------------
#                                          ORDERS-PROD
# ----------------------------------------------------------------------------------------------------------------------------

resource "aws_apigatewayv2_integration" "prod_post_orders_integration" {
  api_id           = aws_apigatewayv2_api.api-gateway-prod.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://${aws_lb.orders-service-prod-alb.dns_name}:8080/orders/{id}"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "prod_post_orders_route" {
  api_id    = aws_apigatewayv2_api.api-gateway-prod.id
  route_key = "POST /orders/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.prod_post_orders_integration.id}"
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          DESPLIGUE-PROD
# ----------------------------------------------------------------------------------------------------------------------------


resource "aws_apigatewayv2_stage" "prod_api_stage" {
  api_id      = aws_apigatewayv2_api.api-gateway-prod.id
  name        = "prod_api_stage"
  auto_deploy = true
}