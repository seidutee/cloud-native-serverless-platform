module "s3_artifacts" {

  source = "../../modules/s3"

  bucket_name = var.lambda_artifacts_bucket_name

  tags = {

    Environment = "dev"

    Project = "awesome-app"

    ManagedBy = "Terraform"
  }
}