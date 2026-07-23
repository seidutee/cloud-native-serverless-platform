module "lambda" {

  source = "../../modules/lambda"

  lambda_role_arn = module.iam.lambda_role_arn

  table_name = module.dynamodb.table_name

  lambda_bucket = module.s3_artifacts.bucket_name

  get_lambda_function_name = "get_item.zip"
  put_lambda_function_name = "put_item.zip"
}