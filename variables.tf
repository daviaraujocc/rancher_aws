
#-------------Instâncias


#quantidade de nodes que serão criadas (k8s) para o cluster

variable "qntNodes_k8s" {
  type    = string
  default = "4"
}

#tipo da instância para os nodes k8s

variable "instanceType_k8s" {
  type    = string
  default = "t2.medium"
}

#tipo da instância para o host do rancher

variable "instanceType_rancher" {
  type    = string
  default = "t2.medium"
}

#tamanho do volume do root para os nodes

variable "instanceSize_k8s" {
  type    = string
  default = "25"
}

#tamanho do volume do root para o rancher

variable "instanceSize_rancher" {
  type    = string
  default = "25"
}

#tipo do volume root para os nodes

variable "instanceVolType_k8s" {
  type    = string
  default = "standard"
}

#tipo do volume root para o rancher

variable "instanceVolType_rancher" {
  type    = string
  default = "standard"
}

#------------------Pares de chave


#Diretorio que vai conter a chave privada para acesso aos servidores, caso tenha uma chave ja criada/importada na AWS.

variable "keyPath" {
  type    = string
  default = "~user/id_rsa"
}

variable "keyName" {
  type = string
  default = "k8s"
}

variable "publicKey" {
  type    = string
  default = "inserir chave publica aqui"
}

#------------------Zona dns

variable "zoneName" {
  type    = string
  default = "dominio.route53.aqui."
}

#-------------------Outros

#Nome da região que será utilizada para provisionar os serviços

variable "regionName" {
  type    = string
  default = "us-east-1"
}