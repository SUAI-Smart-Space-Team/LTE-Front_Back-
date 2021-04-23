# WHN-Front-Back

The created API has such functions as:
- Handling interfaces(Can transmit data to specific devices via interfaces)
- Mapping internal and external IP addresses
- Add / Remove devices
- Receiving control commands

These functions are implemented through the user and administrator sites.
- User site – the user can select the ID of the subscriber to whom they want to send the message. Next, the transfer interfaces available to this subscriber are loaded for it. The user selects the desired interface and writes the message they want to send.
- Admin Site-The administrator can add new users or delete users. To add a new user, the administrator will need to enter the external and internal IP addresses and list the interfaces available for this subscriber. After that, a new user is added to the database. To delete a subscriber, you only need to select the ID of the user to delete, and then the selected user is deleted from the database.

The database has a description of all devices, that is, the device ID and interfaces available to this subscriber.

Component communication scheme:

![схема](https://user-images.githubusercontent.com/57037988/115722622-d8e91b00-a387-11eb-95c1-00304c43f1c7.jpg)

## The sequence of commands for deploying this module:

To install the front-back, you need to perform the following operations:
- clone the repository
- sudo apt update
- sudo apt install nodejs
- sudo apt install npm
- sudo npm install express —save
- sudo npm install body-parser —save
- sudo npm install mysql2 —save
- sudo npm install dgram —save

Before starting the container, you need to install the mysql server locally.
- sudo apt install mysql-server
After you have to import a dump of the database, follow these steps:
- sudo mysqladmin create mybd
- mysql -u root -p mybd < TEST.sql
- sudo mysql -u root -p
- CREATE USER 'user'@'localhost' IDENTIFIED BY '1234';
- GRANT ALL PRIVILEGES ON mybd.* TO 'user'@'localhost';
- FLASH PRIVILEGES;


Then you can build a docker image locally, follow these steps:
- sudo docker build . -t app (your name image).
- sudo docker run -d --net host app (your name image).
- sudo docker logs <Id container>
As a result, a docker container will be launched with access to the local database.

### Errors that occurred when running the application on an empty machine:
- The inability to update npm to the current version. As a result, it is not possible to run the "npm init" command to automatically generate all the dependencies available in the package.json and package-lock.json
- When importing the database from the dump, it became necessary to create a new user on the mysql server and add privileges to use the imported database

### Example of operation

Start the program.

The database is empty:

![1](https://user-images.githubusercontent.com/57037988/115724496-aa6c3f80-a389-11eb-9f3b-3f77e8c086fb.jpg)

Next, run the application:

![2](https://user-images.githubusercontent.com/57037988/115724574-bd7f0f80-a389-11eb-9cdb-7a6c6d64798e.jpg)

The user's site has no active users:

![3](https://user-images.githubusercontent.com/57037988/115724648-d091df80-a389-11eb-94c0-fd4a62f20c58.jpg)

Admin home page:

![4](https://user-images.githubusercontent.com/57037988/115724807-f323f880-a389-11eb-88ed-38ad89a22f5c.jpg)

Add a new user:

![5](https://user-images.githubusercontent.com/57037988/115724946-151d7b00-a38a-11eb-88f6-f6ec7ec74cb6.jpg)

There is one user on the user's site that we can send a message to:

![6](https://user-images.githubusercontent.com/57037988/115725069-31211c80-a38a-11eb-99e6-f2294c95fd8e.jpg)

We will send a message to the active user:

![7](https://user-images.githubusercontent.com/57037988/115725141-426a2900-a38a-11eb-8e3a-eccb7821b399.jpg)

It is also possible to remove the user from the admin site:

![8](https://user-images.githubusercontent.com/57037988/115725241-57df5300-a38a-11eb-91af-17ba6cad7e51.jpg)
