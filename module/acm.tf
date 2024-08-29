##ACM
resource "aws_acm_certificate" "cert_alb" {
  #domain_name = "*.${var.zone_name}"
  domain_name = "*.quick-infra.net"
  #subject_alternative_names = ["${var.zone_name}"]
  subject_alternative_names = ["quick-infra.net"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

##Create cname record for alb on Route53
resource "aws_route53_record" "cert_validation_alb" {
  for_each = {
    for dvo in aws_acm_certificate.cert_alb.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
  ttl             = "300"
  zone_id = var.zone_id
}