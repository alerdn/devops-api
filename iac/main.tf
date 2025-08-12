# module "s3" {
#   source         = "./modules/s3"
#   s3_bucket_name = var.s3_bucket_name

#   tags = {
#     Iac     = true
#     Context = terraform.workspace
#   }
# }

# module "cdn" {
#   source             = "./modules/cloudfront"
#   origin_id          = module.s3.bucket_id
#   bucket_domain_name = module.s3.bucket_website_domain_name
#   price_class        = var.cdn_price_class

#   tags = {
#     Iac     = true
#     Context = terraform.workspace
#   }

#   depends_on = [
#     module.s3
#   ]
# }

module "iam" {
  source = "./modules/iam"

  oidc_url = "https://token.actions.githubusercontent.com"
  oidc_client_id_list = [
    "sts.amazonaws.com"
  ]

  ecr_role_assume_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Principal" : {
          "Federated" : "arn:aws:iam::286885992381:oidc-provider/token.actions.githubusercontent.com"
        },
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : [
              "sts.amazonaws.com"
            ]
          },
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : [
              "repo:alerdn/devops-api:ref:refs/heads/master"
            ]
          }
        }
      }
    ]
  })

  ecr_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect   = "Allow",
        Action   = "apprunner:*",
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "iam:PassRole",
          "iam:CreateServiceLinkedRole",
        ],
        Resource = "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:ListTagsForResource",
          "ecr:DescribeImageScanFindings",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ],
        "Resource" : "*"
      }
    ]
  })

  app_runner_role_assume_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "build.apprunner.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Iac     = true
    Context = terraform.workspace
  }
}

module "ecr-repository-invoice" {
  source = "./modules/ecr"

  ecr_repository_name                   = "invoice-service-js"
  ecr_repository_image_tag_mutability   = "MUTABLE"
  ecr_repository_image_scanning_on_push = true

  tags = {
    Iac     = true
    Context = terraform.workspace
  }
}

module "ecr-repository-order" {
  source = "./modules/ecr"

  ecr_repository_name                   = "order-service-go"
  ecr_repository_image_tag_mutability   = "MUTABLE"
  ecr_repository_image_scanning_on_push = true

  tags = {
    Iac     = true
    Context = terraform.workspace
  }
}
