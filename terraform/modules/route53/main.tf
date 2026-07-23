resource "aws_route53_zone" "awesome_app" {

  name = var.domain_name

  tags = var.tags
}

#
# ACM Certificate
#
resource "aws_acm_certificate" "amplify_certificate" {

  domain_name = var.domain_name

  subject_alternative_names = [
    "www.${var.domain_name}"
  ]

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

#
# DNS Validation Records
#
resource "aws_route53_record" "certificate_validation" {

  for_each = {
    for dvo in aws_acm_certificate.amplify_certificate.domain_validation_options :

    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.awesome_app.zone_id

  name = each.value.name

  type = each.value.type

  ttl = 60

  records = [
    each.value.record
  ]
}

#
# Validate ACM
#
resource "aws_acm_certificate_validation" "amplify_certificate" {

  certificate_arn = aws_acm_certificate.amplify_certificate.arn

  validation_record_fqdns = [
    for record in aws_route53_record.certificate_validation :
    record.fqdn
  ]
}

#
# Connect Domain to Amplify
#
resource "aws_amplify_domain_association" "awesome_app" {

  app_id = var.amplify_app_id

  domain_name = var.domain_name

  wait_for_verification = true

  sub_domain {

    branch_name = "main"

    prefix = ""

  }

  sub_domain {

    branch_name = "main"

    prefix = "www"

  }

  depends_on = [
    aws_acm_certificate_validation.amplify_certificate
  ]
}