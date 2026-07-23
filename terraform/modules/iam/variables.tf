variable "table_arn" {
  type = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda functions"
  type        = string

}

variable "iam_policy_name" {
  description = "The name of the IAM policy for DynamoDB access"
  type        = string
}
