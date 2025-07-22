data "aws_s3_bucket" "bucket" {
    bucket = "devops-api-bucket-iac-${terraform.workspace}"
}