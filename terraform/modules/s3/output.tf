output "bucket_name" {

  description = "Lambda artifacts bucket name."

  value = aws_s3_bucket.lambda_artifacts.bucket
}

output "bucket_arn" {

  description = "Lambda artifacts bucket ARN."

  value = aws_s3_bucket.lambda_artifacts.arn
}