resource "aws_amplify_app" "awesome_app" {

  name         = var.app_name
  repository   = var.repository_url
  access_token = var.github_token

  enable_branch_auto_build = true

  environment_variables = {
  GET_API  = "${var.api_gateway_url}/students"
  POST_API = "${var.api_gateway_url}/students"
}

  build_spec = <<EOF
version: 1

frontend:

  phases:

    preBuild:

      commands:
        - echo "Generating frontend configuration..."

        - |
          cat > frontend/config.js <<EOT
          window.APP_CONFIG = {
            API_URL: "$API_URL"
          };
          EOT

    build:

      commands:
        - echo "Static frontend ready"

  artifacts:

    baseDirectory: frontend

    files:
      - '**/*'

  cache:

    paths: []
EOF

  tags = var.tags
}

resource "aws_amplify_branch" "production" {

  app_id      = aws_amplify_app.awesome_app.id
  branch_name = "main"

  framework = "Web"

  stage = "PRODUCTION"

  enable_auto_build = true
}