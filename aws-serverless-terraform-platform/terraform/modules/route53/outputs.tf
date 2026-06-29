output "zone_id" {
  value = aws_route53_zone.awesomeapp.zone_id
}

output "name_servers" {
  value = aws_route53_zone.awesomeapp.name_servers
}