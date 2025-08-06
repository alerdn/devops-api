output "ecr-role-arn" {
  value = aws_iam_role.ecr-role.arn
  sensitive = false
  description = "ARN da função ECR"
}
