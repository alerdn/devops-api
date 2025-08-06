resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.ecr_repository_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_repository_image_scanning_on_push
  }

  tags = var.tags
}
