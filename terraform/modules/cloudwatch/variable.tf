variable "lambda_function_names" {
  description = "List of Lambda function names"
  type        = list(string)
}

variable "apigateway_name" {
  description = "API Gateway name"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}