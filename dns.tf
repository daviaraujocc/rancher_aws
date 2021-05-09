#indica qual zona terá suas informações retornadas

data "aws_route53_zone" "dns" {
  name = var.zoneName
}

#Define o dns principal para o servidor com o rancher instalado

resource "aws_route53_record" "rancherdns" {
  zone_id    = data.aws_route53_zone.dns.zone_id
  name       = "rancher.${data.aws_route53_zone.dns.name}"
  type       = "A"
  ttl        = "300"
  records    = [aws_instance.rancher.public_ip]
  depends_on = [aws_instance.rancher, ]
}

#Define o dns para os nodes criados

resource "aws_route53_record" "k8sdns" {
  zone_id    = data.aws_route53_zone.dns.zone_id
  name       = "app${count.index}.rancher.${data.aws_route53_zone.dns.name}"
  type       = "A"
  ttl        = "300"
  count      = var.qntNodes_k8s
  records    = [aws_instance.k8s[count.index].public_ip]
  depends_on = [aws_instance.k8s, ]
}