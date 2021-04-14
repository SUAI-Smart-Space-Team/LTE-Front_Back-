FROM python
ENV NODE_ENV=production
RUN apt-get update 
RUN apt -y --force-yes install nodejs npm
#RUN apt -y --force-yes install docker-ce
WORKDIR /LTE-Front_Back-
RUN docker pull nikitallo/db:latest
RUN docker run —name mybd -it nikitallo/db:latest
RUN docker exec -it mybd mysql -uroot -p1234 -e "CREATE DATABASE mybd"
COPY ["myBD.sql",  "./"]
RUN docker exec -i mybd mysql -uroot -p1234 mybd < myDB.sql


COPY ["package.json", "package-lock.json*", "./"]
COPY ["./views", "config.js", "database.js", "./"]
COPY . .

CMD [ "node", "server.js 127.0.0.1 500002 50001" ]
