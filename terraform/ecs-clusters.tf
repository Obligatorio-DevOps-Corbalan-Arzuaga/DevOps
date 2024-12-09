# resource "aws_ecs_cluster" "develop-ecs-cluster" {
#   name = "develop-ecs-cluster"
# }
# resource "aws_ecs_cluster" "staging-ecs-cluster" {
#   name = "staging-ecs-cluster"
# }
resource "aws_ecs_cluster" "production-ecs-cluster" {
  name = "production-ecs-cluster"
}