output "api_id" {
  description = "API Gateway ID"
  value       = aws_apigatewayv2_api.api.id
}

output "api_endpoint" {
  description = "HTTP API endpoint"
  value       = aws_apigatewayv2_api.api.api_endpoint
}

output "stage_invoke_url" {
  description = "Invoke URL for the dev stage"
  value       = "${aws_apigatewayv2_api.api.api_endpoint}/dev"
}

