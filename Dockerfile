FROM python
ENV NODE_ENV=production
RUN apt-get update
RUN apt -y --force-yes install nodejs npm

WORKDIR /WHN-Front-Back

COPY ["package.json",  "./"]
COPY ["./views", "config.js", "database.js", "./"]
COPY . .

RUN npm install
CMD [ "node", "server.js 127.0.0.1 500002" ]
