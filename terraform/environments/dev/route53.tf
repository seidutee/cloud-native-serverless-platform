module "route53" {

  source = "../../modules/route53"

  domain_name = var.domain_name

  amplify_app_id = module.amplify.app_id

  tags = {

    Environment = "dev"

    Project = "awesome-app"

    ManagedBy = "Terraform"

  }
}