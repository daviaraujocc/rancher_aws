# Projeto terraform com kubernetes

O projeto a seguir tem como foco fazer a implementação de um ambiente de testes usando a estrutura da AWS.

Tecnologias usadas :

- Terraform
- Docker
- Rancher
- Kubernetes (k8s)
- AWS

# Arquitetura

![image](https://user-images.githubusercontent.com/70732391/117558079-0a343d00-b050-11eb-94d6-3d17e79b474c.png)



O código tem como objetivo a criação de uma estrutura de testes como no exemplo acima, aonde na plataforma da própria AWS iremos montar um ambiente customizado para administração de clusters kubernetes com o uso da ferramenta rancher, aonde irá ser definido de forma automática o seu FQDN integrado ao serviço de DNS Route53 como também dos demais nodes que serão criados sucessivamente a partir do valor da quantidade desejada.

O mesmo irá fazer a instalação automática dos ambientes e requisitos para que ocorra essa comunicação, sendo necessário a configuração manual de cada node.



Fonte de inspiração : https://www.udemy.com/course/devops-mao-na-massa-docker-kubernetes-rancher/
