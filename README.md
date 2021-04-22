# WHN-Front-Back

The created API has such functions as:
- Handling interfaces(Can transmit data to specific devices via interfaces)
- Mapping internal and external IP addresses
- Add / Remove devices
- Receiving control commands
These functions are implemented through the user and administrator sites.
User site – the user can select the ID of the subscriber to whom they want to send the message. Next, the transfer interfaces available to this subscriber are loaded for it. The user selects the desired interface and writes the message they want to send.
Admin Site-The administrator can add new users or delete users. To add a new user, the administrator will need to enter the external and internal IP addresses and list the interfaces available for this subscriber. After that, a new user is added to the database. To delete a subscriber, you only need to select the ID of the user to delete, and then the selected user is deleted from the database.
The database has a description of all devices, that is, the device ID and interfaces available to this subscriber.
