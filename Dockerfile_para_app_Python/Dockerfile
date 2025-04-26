# Use a imagem base do Python
FROM python:3.9-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo requirements.txt para dentro do container
COPY requirements.txt /app/

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o diretório de trabalho no container
COPY . /app/

# Exponha a porta em que a aplicação Flask será executada
EXPOSE 5000

# Comando para rodar a aplicação Flask
CMD ["python", "app.py"]