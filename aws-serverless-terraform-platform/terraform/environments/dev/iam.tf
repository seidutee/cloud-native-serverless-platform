module "iam" {
  source = "../../modules/iam"

  table_arn        = module.dynamodb.table_arn
  lambda_role_name = var.lambda_role_name
  iam_policy_name  = var.iam_policy_name
}