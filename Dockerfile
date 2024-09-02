# Use a imagem oficial do Node.js como base
FROM node:18 AS build

# Crie o diretório da aplicação
WORKDIR /app

# Copie o package.json e o package-lock.json
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante do código da aplicação
COPY . .

# Compile o código TypeScript para JavaScript
RUN npm run build

# Use uma imagem base mais leve para a execução
FROM node:18-slim

# Crie o diretório da aplicação
WORKDIR /app

# Copie apenas os arquivos necessários da etapa de build
COPY --from=build /app/dist /app/dist
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/package*.json /app/

# Exponha a porta que a aplicação usará
EXPOSE 9000

# Comando para iniciar a aplicação
CMD ["node", "dist/main"]
