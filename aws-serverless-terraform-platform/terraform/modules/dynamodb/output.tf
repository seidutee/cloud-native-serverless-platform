output "table_name" {
  value = aws_dynamodb_table.awesome_db.name
}

output "table_arn" {
  value = aws_dynamodb_table.awesome_db.arn
}