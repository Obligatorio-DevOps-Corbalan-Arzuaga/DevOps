variable "rol_lab" {
  description = "Rol de aws academy "
  type        = string
  default     = "arn:aws:iam::634518649880:role/LabRole"
}

variable "docker_images" {
  description = "Map de las ultimas imagenes en docker"
  type        = map(string)
  default     = {
    shipping-service-dev = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-dev"
    shipping-service-staging = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-staging"
    shipping-service-prod = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-prod"
    orders-service-dev = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-dev"
    orders-service-staging = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-staging"
    orders-service-prod = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-prod"
    payments-service-dev= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-dev"
    payments-service-staging= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-staging"
    payments-service-prod= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-prod"
    products-service-dev= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-dev"
    products-service-staging= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-staging"
    products-service-prod= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-prod"
  }
}
