variable "domain_name" {
  description = "The domain name for the Route53 hosted zone"
  type        = string

}

variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string

}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda functions"
  type        = string

}

variable "iam_policy_name" {
  description = "The name of the IAM policy for DynamoDB access"
  type        = string
}

variable "get_lambda_function_name" {
  description = "The name of the Lambda function for GET requests"
  type        = string
}

variable "put_lambda_function_name" {
  description = "The name of the Lambda function for PUT requests"
  type        = string
}

variable "github_repository_url" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}

