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

Por fim as integrações finais que acessarem pela regex *.rancher.dominio irão ser redirecionadas de forma aleatória para os nodes que terão alguma aplicação instalada

# Screenshots

![image](https://user-images.githubusercontent.com/70732391/117558917-71a1bb00-b057-11eb-9e69-609ad91120a6.png)

![image](https://user-images.githubusercontent.com/70732391/117558924-867e4e80-b057-11eb-8df2-ed6b78edba5c.png)

![image](https://user-images.githubusercontent.com/70732391/117558933-8e3df300-b057-11eb-814c-458767071ae9.png)




Fonte de inspiração : https://www.udemy.com/course/devops-mao-na-massa-docker-kubernetes-rancher/
