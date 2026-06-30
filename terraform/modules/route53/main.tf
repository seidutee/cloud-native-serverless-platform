resource "aws_route53_zone" "awesomeapp" {
  name = var.domain_name

  tags = {
    Project = "awesome-app"
  }
}