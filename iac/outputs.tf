output "bucket_domain_name" {
  value       = data.aws_s3_bucket.bucket.bucket_domain_name
  sensitive   = false
  description = "The domain name of the S3 bucket"
}

output "bucket_region" {
    value = data.aws_s3_bucket.bucket.bucket_region
    sensitive = false
    description = "The region where the S3 bucket is located"
}