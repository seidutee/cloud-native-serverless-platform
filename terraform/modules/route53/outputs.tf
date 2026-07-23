output "hosted_zone_id" {
  value = aws_route53_zone.awesome_app.zone_id
}

output "name_servers" {
  value = aws_route53_zone.awesome_app.name_servers
}

output "certificate_arn" {
  value = aws_acm_certificate.amplify_certificate.arn
}