# Outputs são variáveis que são expostas do módulo

output "bucket_id" {
  value       = data.aws_s3_bucket.bucket.id
  sensitive   = false
  description = "ID do bucket S3"
}

output "bucket_domain_name" {
  value       = data.aws_s3_bucket.bucket.bucket_domain_name
  sensitive   = false
  description = "Nome do domínio do bucket S3"
}

output "bucket_website_domain_name" {
    value = "${data.aws_s3_bucket.bucket.bucket}.s3-website-${data.aws_s3_bucket.bucket.region}.amazonaws.com"
    sensitive = false
    description = "Nome do domínio do site do bucket S3"
}