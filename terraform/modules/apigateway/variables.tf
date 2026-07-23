variable "api_name" {
  description = "Name of the API Gateway HTTP API"
  type        = string
}

variable "lambda_routes" {
  description = "Map of Lambda routes and their configurations"

  type = map(object({
    route_key            = string
    lambda_function_arn  = string
    lambda_invoke_arn    = string
    lambda_function_name = string
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
