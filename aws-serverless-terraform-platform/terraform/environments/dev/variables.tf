variable "domain_name" {
  description = "The domain name for the Route53 hosted zone"
  type        = string

}

variable "table_name" {
    description = "The name of the DynamoDB table"
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

