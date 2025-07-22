module "s3" {
  source = "./modules/s3"
  s3_bucket_name = "devops-api-iac"
}