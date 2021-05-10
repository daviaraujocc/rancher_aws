# Projeto terraform com kubernetes (AWS)

# Introdução

O projeto a seguir tem como foco fazer a implementação de um ambiente de testes usando a estrutura da AWS.

A ideia veio do ambiente criado pelo @Jonathan Baraldi na qual ministrou no curso de Devops Kubernetes (link no final da página) que estou estudando no momento.

Meu objetivo é aprimorar o conhecimento que possuo atualmente de terraform e IaC para provisionar todo a arquitetura através desse projeto.

Tecnologias usadas :

- Terraform
- Docker
- Rancher
- Kubernetes (k8s)
- AWS



# Arquitetura

![image](https://user-images.githubusercontent.com/70732391/117558079-0a343d00-b050-11eb-94d6-3d17e79b474c.png)



O código tem como objetivo a criação de uma estrutura de testes como no exemplo acima, aonde na plataforma da própria AWS iremos montar um ambiente customizado em uma VPC padrão  para administração de clusters kubernetes com o uso da ferramenta orquestradora rancher, aonde irá ser definido de forma automática o seu FQDN, integrado ao serviço de DNS Route53, como também dos demais nodes que serão criados sucessivamente a partir do valor da quantidade desejada.

O mesmo irá fazer a instalação automática dos ambientes e requisitos para que ocorra essa comunicação, sendo somente necessário a configuração manual de cada node.

Por fim as requisições no host final que acessarem pela regex *.rancher.dominio irão ser redirecionadas de forma aleatória para um dos nodes baseado no "load balancer" criado no Route53 o que deve eliminar a necessidade de preocupação caso um dos nodes pare de funcionar.

<b>Observação: esse ambiente é destinado a testes, por conta disso todas as portas de todos os hosts são liberadas para o externo por padrão</b>


<b>Variáveis importantes a serem preenchidas :</b>

- qntNodes_k8s : quantidade de nodes que irão compor o cluster ou demais clusters
- keyName : indicar o nome do par de chave criado na AWS
- keyPath : indicar o caminho da chave privada referenciada no pares de chave que você referenciou na variável keyName

<b>Opcional:</b>

- publicKey : chave pública que será utilizada para criar um novo registro de pares de chave na aws, caso você ja possua um deixar esse campo em BRANCO e remover o resource de chaves no main.tf



# Screenshots

![image](https://user-images.githubusercontent.com/70732391/117558917-71a1bb00-b057-11eb-9e69-609ad91120a6.png)

![image](https://user-images.githubusercontent.com/70732391/117558924-867e4e80-b057-11eb-8df2-ed6b78edba5c.png)

![image](https://user-images.githubusercontent.com/70732391/117558933-8e3df300-b057-11eb-814c-458767071ae9.png)




Fonte: https://www.udemy.com/course/devops-mao-na-massa-docker-kubernetes-rancher/
