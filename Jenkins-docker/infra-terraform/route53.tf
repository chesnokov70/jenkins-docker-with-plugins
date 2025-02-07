#resource "aws_route53_record" "jenkins" {
#  zone_id = data.aws_route53_zone.main.zone_id
#  name    = "${var.subdomain}.${var.domain_name}"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.jenkins_docker.public_ip]
#}

data "aws_route53_zone" "main" {
  name = var.domain_name
}
