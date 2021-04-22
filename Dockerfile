FROM node:latest
WORKDIR /WHN-Front-Back
RUN mkdir views
COPY ./views /WHN-Front-Back/views
COPY package*.json ./
RUN npm install
COPY ["config.js", "database.js", "./"]
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]
