FROM python
ENV NODE_ENV=production
RUN apt-get update 
RUN apt -y --force-yes install nodejs npm
#RUN apt -y --force-yes install docker-ce
RUN docker pull nikitallo/db:latest
RUN docker run —name myDB -it nikitallo/db:latest
RUN docker exec -it myDB mysql -uroot -prootroot -e "CREATE DATABASE myDB"
RUN docker exec -i myDB mysql -uroot -prootroot myDB < myDB.sql
WORKDIR /LTE-Front_Back-

COPY ["package.json", "package-lock.json*", "./"]
COPY ["./views", "config.js", "database.js", "./"]
COPY . .

CMD [ "node", "server.js 127.0.0.1 500002 50001" ]
