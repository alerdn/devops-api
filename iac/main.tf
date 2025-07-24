module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name

  tags = {
    Iac     = true
    Context = terraform.workspace
  }
}

module "cdn" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_website_domain_name
  price_class        = var.cdn_price_class

  tags = {
    Iac     = true
    Context = terraform.workspace
  }

  depends_on = [
    module.s3
  ]
}
