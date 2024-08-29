##Route53 Zone
#resource "aws_route53_zone" "primary_zone" {
#name = var.zone_name
#}

##Route53 Records
resource "aws_route53_record" "naked_domain" {
  #zone_id = aws_route53_zone.primary_zone.zone_id
  zone_id = var.zone_id
  #name    = var.zone_name
  name = "quick-infra.net"
  type = "A"
  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  #zone_id = aws_route53_zone.primary_zone.zone_id
  zone_id = var.zone_id
  #name    = "${var.sub_domain_1}.${var.zone_name}"
  name = "${var.sub_domain_1}.quick-infra.net"
  type = "A"
  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}