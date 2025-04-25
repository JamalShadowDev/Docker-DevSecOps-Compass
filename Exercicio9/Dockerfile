# Use a imagem oficial do Nginx
FROM nginx:alpine3.19

# Copie o arquivo HTML e todos os arquivos estáticos (CSS, JS, Imagens) para o diretório do Nginx
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80