# Etapa 1: Construção da aplicação
FROM node:18 AS builder

# Configura o diretório de trabalho
WORKDIR /app

# Copia arquivos de dependência e instala dependências
COPY package*.json ./
RUN npm install --force

# Copia o código-fonte da aplicação
COPY . .

# Compila a aplicação
RUN npm run build --force

# Etapa 2: Imagem final para servir o aplicativo
FROM node:20

# Configura o diretório de trabalho
WORKDIR /app

# Instala o servidor de produção
RUN npm install -g serve

# Copia os arquivos compilados da etapa de construção
COPY --from=builder /app/dist ./dist

# Define a porta de exposição
EXPOSE 5000

# Comando para iniciar o servidor
CMD ["serve", "-s", "dist", "-l", "5000"]
