resource "aws_apigatewayv2_api" "api" {

  name          = var.api_name
  protocol_type = "HTTP"

  cors_configuration {

    allow_origins = [
      "*"
    ]

    allow_methods = [
      "GET",
      "POST",
      "OPTIONS"
    ]

    allow_headers = [
      "content-type"
    ]

    max_age = 300
  }

  tags = var.tags
}

# Create an integration for each Lambda route to connect API Gateway to the Lambda functions
resource "aws_apigatewayv2_integration" "lambda_integration" {
  for_each = var.lambda_routes

  api_id = aws_apigatewayv2_api.api.id

  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = each.value.lambda_invoke_arn
  payload_format_version = "2.0"
}

# Grant API Gateway permission to invoke the Lambda functions to ensure the integration works correctly
resource "aws_apigatewayv2_route" "lambda_route" {
  for_each = var.lambda_routes

  api_id = aws_apigatewayv2_api.api.id

  route_key = each.value.route_key
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration[each.key].id}"
}

# Create a stage for the API to deploy the routes and integrations, allowing the API to be accessible
resource "aws_apigatewayv2_stage" "dev" {
  api_id = aws_apigatewayv2_api.api.id

  name        = "dev"
  auto_deploy = true

  tags = var.tags
}

# Grant API Gateway permission to invoke the Lambda functions to ensure the integration works correctly
resource "aws_lambda_permission" "lambda_permission" {
  for_each = var.lambda_routes

  statement_id = "AllowExecutionFromAPIGateway-${each.key}"

  action        = "lambda:InvokeFunction"
  function_name = each.value.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}