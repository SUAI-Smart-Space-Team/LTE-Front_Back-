FROM python
ENV NODE_ENV=production
RUN apt-get update
RUN apt -y --force-yes install nodejs npm

WORKDIR /WHN-Front-Back
RUN mkdir views 
COPY ./views /WHN-Front-Back/views
COPY ["package.json",  "./"]
#COPY ["./views", "config.js", "database.js", "./"]
COPY ["config.js", "database.js", "./"]
COPY . .

RUN npm install
#CMD [ "node", "server.js 10.228.0.237 500002" ]
CMD [ "node", "server.js" ]

