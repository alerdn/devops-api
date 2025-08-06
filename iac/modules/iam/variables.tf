variable "oidc_url" {
  type        = string
  description = "URL do provedor OIDC"
}

variable "oidc_client_id_list" {
  type        = list(string)
  description = "Lista de IDs de cliente OIDC"
}

variable "ecr_role_assume_policy" {
  type        = string
  description = "Política de assunção de função para o ECR"
}

variable "ecr_role_policy" {
  type        = string
  description = "Política de função para o ECR"
}

variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
}
