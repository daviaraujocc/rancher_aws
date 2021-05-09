output "instance_public_ipv4_rancher" {
  value = aws_instance.rancher.public_ip
}

output "instance_public_ipv4_k8s" {
  value = aws_instance.k8s[*].public_ip
}

output "rancher_dns" {
  value = aws_route53_record.rancherdns.name
}

output "k8s_dns" {
  value = aws_route53_record.k8sdns[*].name
}