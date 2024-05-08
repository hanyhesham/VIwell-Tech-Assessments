resource "aws_ecr_repository" "countries" {
  name                 = "countries"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}