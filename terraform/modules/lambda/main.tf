resource "aws_lambda_function" "put_item" {
 
  function_name = "awesome-app-put-item"
 
  role = var.lambda_role_arn
 
  handler = "putStudentData.lambda_handler"
 
  runtime = "python3.12"
 
  architectures = ["x86_64"]
 
  timeout = 10
 
  filename = var.put_lambda_function_name
 
  source_code_hash =var.put_lambda_function_name
 
  environment {
 
    variables = {
 
      TABLE_NAME = var.table_name
 
    }
 
  }
 
}
 
resource "aws_lambda_function" "get_item" {
 
  function_name = "awesome-app-get-item"
 
  role = var.lambda_role_arn
 
  handler = "getStudentData.lambda_handler"
 
  runtime = "python3.12"
 
  architectures = ["x86_64"]
 
  timeout = 10
 
  filename = var.get_lambda_function_name
 
  source_code_hash = var.get_lambda_function_name
 
  environment {
 
    variables = {
 
      TABLE_NAME = var.table_name
 
    }
 
  }
 
}
 
