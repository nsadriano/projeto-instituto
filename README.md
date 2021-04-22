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
Executar a Playbook Ansible para configurar o ambiente e subir a Stack ELK;
Alterar o arquivo de inventário informando o IP ou DNS público da instância. Ao final do provisionando da infra, o terraform informa o DNS público da EC2. 
#ansible-playbook -i inventory playbook.yaml --private-key [sua_kay_pair_aws]
Acesso ao Kibana
http://ip_ou_dns_publico:5601/
Acesse o Jenkins para criar o Pipeline. Necessário acessar a instância via SSH para pegar a senha inicial do Jenkins que fica localizada em: /var/lib/jenkins/secrets/initialAdminPassword
http://ip_ou_dns_publico:8080
Criar uma credentials para que o Pipeline possa realizar login no Dockerhub e adicionar a credentials no arquivo Jenkinsfile que encontra-se na raiz do projeto.
Instalar plugin Docker Pipeline
GitHub hook trigger for GITScm polling
Pipeline script from SCM
Configurar um Webhook no Github para que o mesmo acione automaticamente a Pipeline Jenkins ao realizar um Push na Branch informada no Pipeline. 
No Github vá até seu repositório, clique em Settings > Webhooks > Add webhook.
http://ip_ou_dns_publico:8080/github-webhook/
Testar o Pipeline executando “Construir agora” no Jenkins
Acesso a aplicação
http://ip_ou_dns_publico
Aplicação é executada na porta 80 HTTP


