/** In this block, we connect the necessary frameworks, drivers for interacting with the database and configuration files.*/
const express = require('express');
const bodyParesr = require('body-parser');
const mysql = require('mysql2/promise');
const config = require('./config'); 
const bd = require('./database'); 
const dgram = require('dgram');

/**  Create sockets for sending data*/
const client = dgram.createSocket('udp4');
const client1 = dgram.createSocket('udp4');


/**  Building an application using the express framework*/
const app = express();
app.set('view engine','ejs');
app.use(bodyParesr.urlencoded({extended: true}));

/**  Initialize the port on which the backend will run*/
const PORT = process.env.PORT || 8080;

/** We define a function that determines the current date and time to write it to the database
	* @function
*/
function getDateTime() {
    var date = new Date();
    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;
    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;
    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;
    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;
    return year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec;
}

/** Determine the main function of the program
	* @namespace Main
*/
async function main(){
	/**  Establishing a connection to the database
		*@memberof Main
	*/
	const conn = await mysql.createConnection(config);
	/**  Define a set of variables that store the data returned by the database
		*@memberof Main
	*/
	let arr = [];
	let arr2 = [];
	let tmp;
	let tmp1;
	let numU = [];
	let IpUser = [];
	let listIdUser = [];
	let deletedIp = [];
	/** Get request to select the user he wants to send a message
		*@method
		*@memberof Main
	*/
	app.get('/', (req,res) => {
		getNumUsers();
		res.render('HomePage',{arr:numU});
	});
	/** Post request to select the user he wants to send a message
		*@method
		*@memberof Main
	*/
	app.post('/',(req,res) => {
		tmp  = req.body.id;
		per();
		res.redirect('/send');
	});	
	/** Function that returns the number of active users in the system
		*@async
		*@method 
		*@memberof Main
	*/
	async function getNumUsers(){
		numU = await bd.numUsers(conn);
		console.log(numU[numU.length-1]);
	}
	/** Function that returns interfaces for a definite user
		*@async
		*@method
		*@memberof Main
	*/
	async function per()
	{
		arr2 =  await bd.getInterfaces(conn,tmp);
		console.log(arr2);
	}
	
	/** Function that writes a log to the database
		* @async
		* @method
		* @param {string} nameInt - Interface name.
		* @param {string} CurMes - Transmitted message.
		*@memberof Main
	*/
	async function writeLog(nameInt,CurMes){// write log in database
		bd.Log(conn,getDateTime(),tmp,nameInt,CurMes);
	}
	
	/** Function that returns the ip address and port of the user. Sending data to this user
		* @async
		* @method
		* @param {string} Interface - Interface name.
		* @param {number} Id - User Id.
		* @param {string} CurMes - Transmitted message.
		*@memberof Main
	*/
	async function getIp(Interface, Id, Mes){
		IpUser = await bd.getIp(conn,Interface,Id);
		console.log(IpUser);
		const mes ={
			inter: Interface,
			mes: Mes
		};
		client.send(JSON.stringify(mes), IpUser[1], IpUser[0], (err) => {
		});
	}
	
	/** Get request to select the inteface and input message to send to user
		* @method
		*@memberof Main
	*/
	app.get('/send', (req,res) =>{
		res.render('HomePage1',{arr:arr2});
	});
	
	/** Post request to select the inteface and input message to send to user
		* @method
		*@memberof Main
	*/
	app.post('/send',(req,res) => {
		arr.push("id:"+tmp +" Interface:"+ req.body.inter +" message:"+req.body.message);
		getIp(req.body.inter,tmp, req.body.message);
		writeLog(req.body.inter, req.body.message);
		arr2 = [];
		res.redirect('/');
	});
	
	/** Get request to display sent messages
		* @method
		*@memberof Main
	*/
	app.get('/list',(req,res) => res.render('ViewList',{arr:arr}));	
	
	/** Get request to the admin home page
		* @method
		*@memberof Main
	*/
	app.get('/admin', (req,res) =>{
		getListId();
		getNumUsers();
		res.render('HomeAdmin');
	});
	
	/** Get request to add a new user
		* @method
		*@memberof Main
	*/
	app.get('/admin/add', (req,res) =>{
		res.render('Add');
	});
	
	/** Post request to add a new user
		* @method
		*@memberof Main
	*/
	app.post('/admin/add', (req,res) =>{
		console.log("id:"+parseInt(numU[numU.length-1], 10)+1 +" ip1:"+ req.body.ip1 +" ip2:"+req.body.ip2+"lora:"+req.body.lora+"lte:"+req.body.lte+"wifi:"+req.body.wifi);
		var l=0;
		var w=0;
		var lo=0;
		if(req.body.lte == 'yes'){
			l=1;
		}
		if(req.body.lora == 'yes'){
			lo=1;
		}
		if(req.body.wifi == 'yes'){
			w=1;
		}
		ADD(lo, l, w, req.body.ip1, req.body.ip2, req.body.port);
		res.redirect('/admin');
	});
	
	/** Function adding a new user to the database
		* @async
		* @method
		* @param {number} lora - Presence of a LoRa interface.
		* @param {number} lte - Presence of a LTE interface.
		* @param {number} wifi - Presence of a Wi-Fi interface.
		* @param {number} ip1 - External user ip address.
		* @param {number} ip2 - Interior user ip address.
		* @param {number} port - User port.
		*@memberof Main
	*/
	async function ADD(lora, lte,wifi, ip1, ip2, port){
		if (numU[numU.length-1] == undefined){
			bd.Add(conn,1, lora, wifi, lte, ip1, ip2, port);
		} else {
			bd.Add(conn,parseInt(numU[numU.length-1], 10)+1, lora, wifi, lte, ip1, ip2, port);
		}
	}
	
	/** Function that returns a list of users in the system 
		* @async
		* @method
		*@memberof Main
	*/
	async function getListId(){
		listIdUser = await bd.getId(conn);
	}
	
	/** Get request to delete a user
		* @method
		*@memberof Main
	*/
	app.get('/admin/delete', (req,res) =>{
		//getNumUsers();
		getListId();
		console.log(listIdUser);
		res.render('Delete',{arr:listIdUser});
	});
	
	/** Post request to delete a user
		* @method
		*@memberof Main
	*/
	app.post('/admin/delete',(req,res) => {
		tmp1  = req.body.ID;
		Delete(tmp1);
		listIdUser=[];
		deletedIp=[];
		res.redirect('/admin');
	});
	
	/** Function that removes a user from the database
		* @async
		* @method
		* @param {number} id - Whose user ID you want to delete.
		*@memberof Main
	*/
	async function Delete(id){
		deletedIp = await bd.Delete(conn, id);
		console.log(deletedIp);
	}
	
	/** Starting the server on the selected port
		* @method
		*@memberof Main
	*/
	app.listen(PORT);
	console.log('Сервер стартовал!'+PORT);
}

/** Calling the main function
	* @method
	*@memberof Main
*/
main();
