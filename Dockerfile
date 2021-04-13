FROM node:12.18.1
ENV NODE_ENV=production
RUN apt-get update && apt install nodejs npm
RUN apt install -y docker-ce

WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]
COPY ["./views", "config.js", "database.js", "./"]
COPY . .

CMD [ "node", "server.js" ]
