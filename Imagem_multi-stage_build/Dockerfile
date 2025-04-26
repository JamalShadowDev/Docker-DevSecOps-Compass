# Etapa 1: build da aplicação
FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o gs-ping

# Etapa 2: imagem final enxuta
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/gs-ping .

EXPOSE 8080
CMD ["./gs-ping"]

