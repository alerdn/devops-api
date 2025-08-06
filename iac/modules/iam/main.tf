resource "aws_iam_openid_connect_provider" "oidc" {
  url = var.oidc_url

  client_id_list = var.oidc_client_id_list

  tags = var.tags
}

resource "aws_iam_role" "ecr-role" {
  name = "ecr-role-${terraform.workspace}"

  assume_role_policy = var.ecr_role_assume_policy

  tags = var.tags
}

resource "aws_iam_role_policy" "ecr-policy" {
  name = "ecr-app-permissions-${terraform.workspace}"
  role = aws_iam_role.ecr-role.id

  policy = var.ecr_role_policy
}

resource "aws_iam_role" "app-runner-role" {
  name = "app-runner-role-${terraform.workspace}"
  assume_role_policy = var.app_runner_role_assume_policy
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "app-runner-attachment" {
  role       = aws_iam_role.app-runner-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
