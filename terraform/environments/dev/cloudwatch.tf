module "cloudwatch" {
  source = "../../modules/cloudwatch"

  lambda_function_names = [
    module.lambda.get_lambda_function_name,
    module.lambda.put_lambda_function_name
  ]

  apigateway_name = module.api_gateway.api_id

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}