# LTE-Front_Back-

- In the command line, write the commands to install node js and npm:
  - apt-get update
  - apt install nodejs
  - apt install npm
- Next, you need to create the package files.json and package-lock.json, and initialize the project. To do this, run the following command: npm install
- Download the MySQL-server docker image from DockerHub using the following command: docker pull nikitallo/db: latest
- Create and run a container from an image using the command: docker run-name myDB -it nikitallo/db:latest
- Create a database on the deployed server using the command: docker exec -it myDB mysql-uroot -prootroot-e "CREATE DATABASE myDB"
- Import the database structure from the file "myDB.sql" using the following command: docker exec -i myDB mysql -uroot -prootroot myDB < myDB. sql
- When all the dependencies and databases are installed, you can run the project using the command: "node server.js [arg1] [arg2] [arg3]"
  - arg1 - the Ip address of the machine with ansible;
  - arg2 - the machine port with ansible;
  - arg3 - the terminal device machine port.
