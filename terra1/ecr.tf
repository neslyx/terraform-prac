resource "aws_ecr_repository" "app_repo" {
  name = "ecr-project"
  image_tag_mutability = "MUTABLE"
  force_delete = true
}