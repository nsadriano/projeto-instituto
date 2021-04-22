Projeto – Criação de um ambiente de automação com práticas DevOps.
=================================================================

O projeto propõe uma infraestrutura para hospedagem de uma aplicação desenvolvida em Python utilizando o Framework Flask, com Pipeline de Continuos Intgration e Continuos Delivery utilizando o Github integrado ao jenkins e uma Stack de monitoramento do ambiente.

Escopo
======

* Implantação de infraestrutura para suportar o ambiente;
* Desenvolvimento de uma aplicação em Python com Framework Flask usando Docker;
* Implantação de Pipeline para integração e deploy da aplicação em produção;
* Implantação de um ambiente de monitoramento da aplicação.

Workflow de automação
=====================

![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/projeto_challenge.jpeg?raw=true)

Provisionamento do ambiente
===========================

1. Realizar o fork do projeto no Github;

2. Criar uma Key Pair na AWS, salvar no diretório do projeto e alterar no arquivo de variables.tf do Terraform o nome da variável “keyname”;

3. Provisionando a infraestrutura com o Terraform;
 * cd terraform
 * terraform init
 * terraform plan
 * terraform apply

4. Executar a Playbook Ansible para configurar o ambiente e subir a Stack ELK:
 * Alterar o arquivo de inventário informando o IP ou DNS público da instância. 
 * ansible-playbook -i inventory playbook.yaml --private-key [sua_kay_pair_aws]

5. Acessando e configurando o Jenkins: 
 * Ao final do provisionamento da instância com o Ansible, é informado a senha inicial do Jenkins.
 * http://ip_ou_dns_publico:8080

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-install-plugins.png?raw=true)

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-create-user.png?raw=true)

 * Criar credentials para que o pipeline possa realizar o push da imagem para o Docker Hub.
 * * Gerenciar Jenkins > Manage Credentials > jenkins > Global Credentials  > Add credentials

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-credentials.png?raw=true)

 * Instalar plugin Docker Pipeline
 * * Gerenciar Jenkins > Gerenciar Plugins > Disponiveis 
 * * Procurar por Docker Pipeline, selecionar e Install Without restart
 
 * Criar Pipeline
 * * Novo Job > Informar um nome para o seu Pipeline e selecionar Pipeline

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-create-job.png?raw=true)

* * Em Build Triggers > Selecionar GitHub hook trigger for GITScm polling

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-build-trigger.png?raw=true)

* * Em Pipeline:
* * * Alterar Definition para: Pipeline script from SCM
* * * SCM: Git
* * * Repository: Adicionar seu repositório do Git
* * * Branch Specifier: Adicionar a branch do Build

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/jenkins-pipeline-config.png?raw=true)


* Configurar um Webhook no Github
* * Vá até seu repositório, clique em Settings > Webhooks > Add webhook.

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/github-webhook.png?raw=true)

* * * Importante que ao final do endereço seja /github-webhook/
http://ip_ou_dns_publico:8080/github-webhook/

* Acesso ao Kibana
http://ip_ou_dns_publico:5601/

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/kibana-login.png?raw=true)

* * * User: elastic
* * * Pass: changeme

* * Menu lateral > Analytics > Discover > Create index pattern

* * Em Index pattern name: legstash-*

 ![alt text](https://github.com/nsadriano/projeto-instituto/blob/main/images/kibana-index-pattern.png?raw=true)

* * Em time field: @timestamp

* Acesso a aplicação
http://ip_ou_dns_publico

* * Aplicação é executada na porta 80 HTTP








