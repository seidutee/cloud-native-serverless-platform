module "api_gateway" {

  source = "../../modules/apigateway"

  api_name = "serverless-student-api"

  lambda_routes = {

    getStudentData = {
      route_key            = "GET /students"
      lambda_function_arn  = module.lambda.get_lambda_function_arn
      lambda_invoke_arn    = module.lambda.get_lambda_invoke_arn
      lambda_function_name = module.lambda.get_lambda_function_name
    }

    putStudentData = {
      route_key            = "POST /students"
      lambda_function_arn  = module.lambda.put_lambda_function_arn
      lambda_invoke_arn    = module.lambda.put_lambda_invoke_arn
      lambda_function_name = module.lambda.put_lambda_function_name
    }
  }

  tags = {
    Environment = "dev"
    Project     = "serverless-platform"
    ManagedBy   = "Terraform"
  }
}