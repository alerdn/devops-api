variable "s3_bucket_name" {
  type        = string
  description = "Nome do bucket S3"
}

variable "tags" {
  type        = map(string)
  description = "Tags a serem aplicadas ao recurso S3"
  default     = {}
}
