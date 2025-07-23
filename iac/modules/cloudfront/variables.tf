variable "origin_id" {
  type        = string
  description = "ID do origin do CloudFront"
}

variable "bucket_domain_name" {
  type        = string
  description = "Nome do domínio do bucket S3 associado ao CloudFront"
}

variable "price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "Classe de preço do CloudFront (ex: PriceClass_100, PriceClass_200, PriceClass_All)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags a serem aplicadas ao recurso CloudFront"
}
