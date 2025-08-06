resource "aws_iam_openid_connect_provider" "oidc" {
  url = var.oidc_url

  client_id_list = var.oidc_client_id_list

  tags = var.tags
}

resource "aws_iam_role" "ecr-role" {
  name = "ecr-role-${terraform.workspace}"

  assume_role_policy = var.ecr_role_assume_policy
}

resource "aws_iam_role_policy" "ecr-policy" {
  name = "ecr-app-permissions-${terraform.workspace}"
  role = aws_iam_role.ecr-role.id

  policy = var.ecr_role_policy
}
