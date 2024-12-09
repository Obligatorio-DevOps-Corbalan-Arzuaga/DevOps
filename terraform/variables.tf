variable "rol_lab" {
  description = "Rol de aws academy "
  type        = string
  default     = "arn:aws:iam::634518649880:role/LabRole"
}

variable "docker_images" {
  description = "Map de las ultimas imagenes en docker"
  type        = map(string)
  default     = {
    shipping-service-dev = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-dev:68b5af0678aa41dbd935243f327201209fe05af6"
    shipping-service-staging = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-staging:323eca684d3c69057c3a72091623b26b52fa1096"
    shipping-service-prod = "634518649880.dkr.ecr.us-east-1.amazonaws.com/shipping-service-prod:e8adc20a44bb5dd7d8dcde3b150b1f2240cc5733"
    orders-service-dev = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-dev:f33693d6318beb775f67a9aacdeb9d4f98904108"
    orders-service-staging = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-staging:d82a30c42fa6a177111b580b71a69b4f0946ddad"
    orders-service-prod = "634518649880.dkr.ecr.us-east-1.amazonaws.com/orders-service-prod:9964fc3c70bcddac438ee75a361a452d15875cd6"
    payments-service-dev= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-dev:8ce8196ecc9cd2a4af42d849d6cf76a4ee442baa"
    payments-service-staging= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-staging:0a31d6e049a3563db91c1b48ae839c99088b8412"
    payments-service-prod= "634518649880.dkr.ecr.us-east-1.amazonaws.com/payments-service-prod:a0fb1a7122ff42980420485a16b0f8551597e9b4"
    products-service-dev= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-dev:a3ffe3ed9e5b7d29afc58e1019f79cc4a0ec9801"
    products-service-staging= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-staging:e8b2520850f219c57b869cf621b59b9f0b0b7103"
    products-service-prod= "634518649880.dkr.ecr.us-east-1.amazonaws.com/products-service-prod:d4019665f7014ca621e7903deddf8c51a8d96550"
  }
}
