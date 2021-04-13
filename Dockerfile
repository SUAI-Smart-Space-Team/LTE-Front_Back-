FROM python
ENV NODE_ENV=production
RUN apt-get update 
RUN apt -y --force-yes install nodejs npm
#RUN apt -y --force-yes install docker-ce

WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]
COPY ["./views", "config.js", "database.js", "./"]
COPY . .

CMD [ "node", "server.js 127.0.0.1 500002 50001" ]
