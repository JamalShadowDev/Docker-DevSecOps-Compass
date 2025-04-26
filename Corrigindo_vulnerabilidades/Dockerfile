# Usar imagem base mais enxuta (Alpine)
FROM python:3.9-alpine

# Criar usuário não-root para a aplicação
RUN adduser -D appuser

# Definir diretório de trabalho
WORKDIR /app

# Copiar apenas os arquivos necessários
COPY requirements.txt /app/

# Instalar as dependências
RUN apk update && apk add --no-cache sqlite-libs=3.48.0-r1
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação
COPY app.py /app/

# Definir o usuário para rodar a aplicação
USER appuser

# Expor a porta 5000 onde o Flask será executado
EXPOSE 5000

# Rodar a aplicação Flask
CMD ["python", "app.py"]