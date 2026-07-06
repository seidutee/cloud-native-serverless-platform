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
        - sed -i "s|__GET_API__|$GET_API|g" frontend/config.js
        - sed -i "s|__POST_API__|$POST_API|g" frontend/config.js
        - echo "Frontend configuration generated."
 
    build:
      commands:
        - echo "Building static frontend..."
       
  artifacts:
    baseDirectory: frontend
    files:
      - "**/*"
 
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



 
 