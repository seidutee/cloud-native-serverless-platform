variable "domain_name" {
  description = "Custom domain name"
  type        = string
}

variable "amplify_app_id" {
  description = "Amplify App ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}