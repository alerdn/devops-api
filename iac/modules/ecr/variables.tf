variable "ecr_repository_name" {
  type        = string
  description = "Nome do repositório ECR"
}

variable "ecr_repository_image_tag_mutability" {
  type        = string
  description = "Mutabilidade da tag de imagem do repositório ECR"
}

variable "ecr_repository_image_scanning_on_push" {
  type        = bool
  description = "Configuração de verificação de imagem do repositório ECR"
}

variable "tags" {
  type        = map(string)
  description = "Tags do recurso"
}
