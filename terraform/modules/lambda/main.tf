resource "aws_lambda_function" "put_item" {

  function_name = "awesome-app-put-item"

  role = var.lambda_role_arn

  handler = "lambda_function.lambda_handler"

  runtime = "python3.12"

  architectures = ["x86_64"]

  timeout = 10

  filename = data.archive_file.put_item.output_path

  source_code_hash = data.archive_file.put_item.output_base64sha256

  environment {

    variables = {

      TABLE_NAME = var.table_name

    }

  }

}

resource "aws_lambda_function" "get_item" {

  function_name = "awesome-app-get-item"

  role = var.lambda_role_arn

  handler = "lambda_function.lambda_handler"

  runtime = "python3.12"

  architectures = ["x86_64"]

  timeout = 10

  filename = data.archive_file.get_item.output_path

  source_code_hash = data.archive_file.get_item.output_base64sha256

  environment {

    variables = {

      TABLE_NAME = var.table_name

    }

  }

}

data "archive_file" "put_item" {

  type = "zip"

  source_file = "${path.root}/../../../backend/put_item/lambda_function.py"

  output_path = "${path.root}/../../../backend/put_item/put_item.zip"

}

data "archive_file" "get_item" {

  type = "zip"

  source_file = "${path.root}/../../../backend/get_item/lambda_function.py"

  output_path = "${path.root}/../../../backend/get_item/get_item.zip"

}