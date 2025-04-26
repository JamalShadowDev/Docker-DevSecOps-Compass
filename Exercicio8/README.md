# Criando um compose file para rodar uma aplicação com banco de dados
Utilize Docker Compose para configurar uma aplicação com um banco de
dados PostgreSQL, use para isso o projeto pgadmin.

## 1. Clonando/criando repositórios
Você pode criar os arquivos para sua aplicação manualmente ou clonar um repositório com um projeto já pronto. Para facilitar, utilizei como base os arquivos de um projeto existente, que estão disponíveis neste repositório do GitHub: [postgresql-pgadmin](https://github.com/docker/awesome-compose/tree/master/postgresql-pgadmin).

## 2. Suba os containers
Para iniciar os serviços definidos no compose.yml, execute o seguinte comando no terminal:
```bash
docker-compose up -d
```

## 3. Verificação
Após subir os containers, acesse a interface do pgAdmin no navegador:

http://localhost:5050

Utilize o e-mail e senha definidos no arquivo .env para fazer login.

<img src="pgadmin.png"></img>
<img src="pgadmin1.png"></img>