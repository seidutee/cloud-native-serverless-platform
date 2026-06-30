output "get_lambda_function_arn" {
  value = aws_lambda_function.get_item.arn
}

output "get_lambda_invoke_arn" {
  value = aws_lambda_function.get_item.invoke_arn
}

output "get_lambda_function_name" {
  value = aws_lambda_function.get_item.function_name
}

output "put_lambda_function_arn" {
  value = aws_lambda_function.put_item.arn
}

output "put_lambda_invoke_arn" {
  value = aws_lambda_function.put_item.invoke_arn
}

output "put_lambda_function_name" {
  value = aws_lambda_function.put_item.function_name
}
