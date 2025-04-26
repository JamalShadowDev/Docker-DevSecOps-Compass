# Use a imagem base do Python
FROM python:alpine

# Criação de um usuário não-root
RUN adduser --disabled-password myuser

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo requirements.txt para dentro do container
COPY requirements.txt /app/

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o diretório de trabalho no container
COPY . /app/

# Alterar para o usuário não-root
USER myuser

# Exponha a porta em que a aplicação Flask será executada
EXPOSE 5000

# Comando para rodar a aplicação Flask
CMD ["python", "app.py"]