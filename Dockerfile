FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]
RUN apt-get update && apt install nodejs
RUN npm install --production

COPY . .

CMD [ "node", "server.js" ]
