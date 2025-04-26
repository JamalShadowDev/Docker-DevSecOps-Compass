# 🐳 Exercícios Docker 2025

Este repositório reúne uma série de exercícios práticos com Docker, desenvolvidos como parte do **programa de estágio da Compass UOL**. Os exercícios foram propostos para aprofundar os conhecimentos em conteinerização, automação e boas práticas de DevOps.

Os desafios estão organizados por dificuldade e cobrem desde o uso básico de containers até tópicos avançados como multi-stage builds, segurança de imagens, redes personalizadas e Docker Compose.

## 💼 Sobre o Projeto

Este projeto é uma etapa prática do programa de capacitação técnica da Compass UOL, com foco na aplicação de Docker em cenários reais de desenvolvimento e infraestrutura.

Cada pasta contém:

- Código-fonte  
- `Dockerfile` ou `docker-compose.yml`  
- Prints de execução  
- Instruções no próprio `README.md` da pasta  

---

## 🧠 Lista de Exercícios

### 🔹 Fácil

1. [Executando um container básico](./Executando_um_container_básico/README.md)
2. [Criando um container interativo](./Criando_um_container_interativo/README.md)
3. [Listando e removendo containers](./Listando_removendo_containers/README.md)
4. [Criando um Dockerfile para aplicação Python](./Dockerfile_para_app_Python/README.md)

### 🔸 Médio

5. [Utilizando volumes para persistência de dados](./Utilização_de_volumes/README.md)
6. [Construindo imagens com multi-stage build](./Imagem_multi-stage_build/README.md)
7. [Criando uma rede Docker para múltiplos containers](./Rede_Docker/README.md)
8. [Orquestrando aplicação com banco de dados via Docker Compose](./BD_Docker-compose/README.md)

### 🔺 Difícil

9. [Criando imagem personalizada com servidor web](./Imagem_personalizada_servidor_web/README.md)
10. [Executando containers sem privilégios de root](./Privilégios_não_root/README.md)
11. [Analisando vulnerabilidades com Trivy](./Analisando_vulnerabilidades_Trivy/README.md)
12. [Corrigindo vulnerabilidades encontradas](./Corrigindo_vulnerabilidades/README.md)

---

## 🐋 O que é Docker?

**Docker** é uma plataforma que permite empacotar e executar aplicações em ambientes isolados chamados **containers**. Esses containers são leves, portáveis e contêm tudo o que a aplicação precisa para rodar,desde o sistema operacional até as bibliotecas.

### 🚀 Vantagens de usar Docker:

- Consistência entre ambientes (local, homologação, produção).
- Maior controle sobre dependências.
- Agilidade no deploy e rollback de aplicações.
- Facilita o uso de microserviços.

---

## 🧰 Comandos Docker

### 📦 Imagens

```bash
# Listar imagens disponíveis
docker images

# Baixar uma imagem do Docker Hub
docker pull nome-da-imagem

# Remover uma imagem
docker rmi nome-da-imagem

# Listar containers em execução
docker ps

# Listar todos os containers (inclusive os parados)
docker ps -a

# Iniciar um container (modo interativo + terminal)
docker run -it nome-da-imagem

# Iniciar um container com porta mapeada
docker run -d -p 8080:80 nome-da-imagem

# Parar um container
docker stop id-ou-nome-do-container

# Iniciar um container parado
docker start id-ou-nome-do-container

# Remover um container
docker rm id-ou-nome-do-container

# Criar uma imagem a partir de um Dockerfile
docker build -t nome-da-imagem .

# Rodar um container nomeado
docker run --name nome-do-container nome-da-imagem

# Criar uma imagem a partir de um Dockerfile
docker build -t nome-da-imagem .

# Rodar um container nomeado
docker run --name nome-do-container nome-da-imagem

# Criar volume
docker volume create nome-do-volume

# Usar volume ao rodar container
docker run -v nome-do-volume:/caminho/dentro-do-container nome-da-imagem

# Usar bind mount (diretório local no container)
docker run -v $(pwd):/app nome-da-imagem

# Remover todos os containers parados
docker container prune

# Remover todas as imagens não utilizadas
docker image prune

# Remover tudo (containers, volumes, imagens e redes não usados)
docker system prune -a