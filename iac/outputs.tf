output "s3_bucket_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "Nome do domínio do bucket S3"
}

output "cdn_domain_name" {
  value       = module.cdn.cdn_domain_name
  sensitive   = false
  description = "Nome de domínio do CloudFront"
}