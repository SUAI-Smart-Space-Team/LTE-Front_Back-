FROM node:12.18.1
ENV NODE_ENV=production
RUN apt-get update && apt install nodejs
RUN npm install --productio

WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]

COPY . .

CMD [ "node", "server.js" ]
