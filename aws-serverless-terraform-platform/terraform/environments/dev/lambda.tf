module "lambda" {
  source = "../../modules/lambda"

  lambda_role_arn = module.iam.lambda_role_arn

  table_name = module.dynamodb.table_name

  get_lambda_function_name = var.get_lambda_function_name

  put_lambda_function_name = var.put_lambda_function_name
}
