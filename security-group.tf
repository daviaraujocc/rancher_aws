#Define o security group para o ambiente de testes

resource "aws_security_group" "rancher" {
  name        = "rancher-security-group"
  description = "libera para todas as portas"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}