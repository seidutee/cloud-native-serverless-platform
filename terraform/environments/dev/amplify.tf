module "amplify" {

  source = "../../modules/amplify"

  app_name       = "awesome-app"
  repository_url = var.github_repository_url
  github_token   = var.github_token

  api_gateway_url = module.api_gateway.api_endpoint

  tags = {
    Environment = "dev"
    Project     = "awesome-app"
    ManagedBy   = "Terraform"
  }
}