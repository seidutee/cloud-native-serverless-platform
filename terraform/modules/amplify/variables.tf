variable "app_name" {
  type = string
}

variable "repository_url" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "api_gateway_url" {
  description = "API Gateway endpoint"
  type        = string
}