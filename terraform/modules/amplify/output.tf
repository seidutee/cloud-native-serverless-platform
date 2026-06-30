output "app_id" {
  value = aws_amplify_app.awesome_app.id
}

output "default_domain" {
  value = aws_amplify_app.awesome_app.default_domain
}

output "amplify_url" {
  value = "https://main.${aws_amplify_app.awesome_app.default_domain}"
}