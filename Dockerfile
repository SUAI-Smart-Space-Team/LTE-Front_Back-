FROM node:12.18.1
ENV NODE_ENV=production
RUN apt-get update && apt install nodejs npm
RUN npm install --productio
RUN apt install -y docker-ce

WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]

COPY . .

CMD [ "node", "server.js" ]
