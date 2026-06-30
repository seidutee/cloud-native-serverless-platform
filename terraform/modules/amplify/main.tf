resource "aws_amplify_app" "awesome_app" {

  name         = var.app_name
  repository   = var.repository_url
  access_token = var.github_token

  enable_branch_auto_build = true

  environment_variables = {
    API_URL = var.api_gateway_url
  }

  build_spec = <<EOF
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - echo "Injecting API Gateway URL"
        - sed -i "s|__API_URL__|$API_URL|g" frontend/config.js

    build:
      commands:
        - echo "Static site build complete"

  artifacts:
    baseDirectory: frontend
    files:
      - '**/*'

  cache:
    paths: []
EOF

  tags = var.tags
}

resource "aws_amplify_branch" "main" {

  app_id      = aws_amplify_app.awesome_app.id
  branch_name = "main"

  framework = "Web"
  stage     = "PRODUCTION"

  enable_auto_build = true
}