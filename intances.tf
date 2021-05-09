#definição instância rancher

resource "aws_instance" "rancher" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instanceType_rancher
  key_name      = var.keyName

  security_groups = [aws_security_group.rancher.name]

  tags = {
    Name = "rancher"
  }

  #volume root rancher

  root_block_device {
    volume_size = var.instanceSize_rancher
    volume_type = var.instanceVolType_rancher

  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }


  #provisioner para cópia do script e execução do mesmo
  provisioner "file" {

    source      = "scripts/install-rancher.sh"
    destination = "/tmp/install-rancher.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install-rancher.sh",
      "sudo /bin/bash /tmp/install-rancher.sh",
    ]
    
  }


}







#definição cluster para k8s

resource "aws_instance" "k8s" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instanceType_k8s
  key_name      = var.keyName
  count         = var.qntNodes_k8s
  depends_on    = [aws_instance.rancher, ]

  security_groups = [aws_security_group.rancher.name]

  tags = {
    Name = "k8s ${count.index}"
  }

  #volume root k8s

  root_block_device {
    volume_size = var.instanceSize_k8s
    volume_type = var.instanceVolType_k8s

  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "scripts/install-docker.sh"
    destination = "/tmp/install-docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install-docker.sh",
      "sudo /bin/bash /tmp/install-docker.sh",
    ]

    #As vezes o script retorna um erro de código 6 quando alguma dependencia não é executada normalmente através do script de instalação (install-docker.sh), porém a plataforma é instalado normalmente.
    #Com isso coloquei essa opção para evitar com que falhas mínimas sem importância possam afetar o processo como todo.

    on_failure = continue
  }




}