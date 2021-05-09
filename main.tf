#definição da região

provider "aws" {
  region = var.regionName
}


#definição pares de chaves aws, caso possua alguma na aws basta referenciar o nome da mesma 

resource "aws_key_pair" "chave" {
  key_name   = var.keyName
  public_key = var.publicKey
}
