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

###The sequence of commands for deploying this module:

To install the front-back, you need to perform the following operations:
1) clone the repository
2) sudo apt update
3) sudo apt install nodejs
4) sudo apt install npm
5) sudo npm install express —save
6) sudo npm install body-parser —save
7) sudo npm install mysql2 —save
8) sudo npm install dgram —save
