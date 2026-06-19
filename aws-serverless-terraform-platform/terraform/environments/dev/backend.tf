# terraform {
#   backend "s3" {
#     bucket         = "awesome-app-tf-state"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#   }
# }