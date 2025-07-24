variable "state_bucket" {
  type        = string
  default     = "devops-api-state-bucket-tf"
  description = "Bucket com o estado"
}

variable "s3_bucket_name" {
  type        = string
  default     = "devops-api-iac"
  description = "Nome do bucket S3 para armazenar os arquivos estáticos."
}

variable "cdn_price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "Classe de preço para a distribuição do CloudFront. Pode ser PriceClass_100, PriceClass_200 ou PriceClass_All."
}
