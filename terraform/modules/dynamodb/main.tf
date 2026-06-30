resource "aws_dynamodb_table" "awesome_db" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Project   = "awesome-app"
    ManagedBy = "Terraform"
  }
}