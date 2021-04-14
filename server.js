const express = require('express');
const bodyParesr = require('body-parser');
const mysql = require('mysql2/promise');
const config = require('./config'); 
const bd = require('./database'); 
const dgram = require('dgram');//npm i dgram
const client = dgram.createSocket('udp4');
const client1 = dgram.createSocket('udp4');

//2 arg - ip ansible, 3 arg - port ansible, 4 arg - port device

const app = express();
app.set('view engine','ejs');
app.use(bodyParesr.urlencoded({extended: true}));
const PORT = process.env.PORT || 8080;
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


async function main(){
	const conn = await mysql.createConnection(config);
	
	let arr = [];
	let arr2 = [];
	let tmp;
	let tmp1;
	let numU = [];
	let IpUser;
	let listIdUser = [];
	let deletedIp = [];
	//getNumUsers();
	app.get('/', (req,res) => {
		getNumUsers();
		res.render('HomePage',{arr:numU});
	});
	app.post('/',(req,res) => {
		tmp  = req.body.id;
		per();
		res.redirect('/send');
	});	
	
	async function getNumUsers(){
		numU = await bd.numUsers(conn);
		console.log(numU[numU.length-1]);
	}
	
	async function per()
	{
		arr2 =  await bd.getInterfaces(conn,tmp);
		console.log(arr2);
	}
	
	
	async function writeLog(nameInt,CurMes){
		bd.Log(conn,getDateTime(),tmp,nameInt,CurMes);
	}
	
	async function getIp(Interface, Id, Mes){
		IpUser = await bd.getIp(conn,Interface,Id);
		console.log(IpUser);
		const mes ={
			inter: Interface,
			mes: Mes
		};
		client.send(JSON.stringify(mes), process.argv[4], IpUser, (err) => {
			//client.close();
		});
	}
	
	app.get('/send', (req,res) =>{
		res.render('HomePage1',{arr:arr2});
	});
	app.post('/send',(req,res) => {
		arr.push("id:"+tmp +" Interface:"+ req.body.inter +" message:"+req.body.message);
		getIp(req.body.inter,tmp, req.body.message);
		writeLog(req.body.inter, req.body.message);
		arr2 = [];
		res.redirect('/');
	});
	
	app.get('/list',(req,res) => res.render('ViewList',{arr:arr}));	
	
	app.get('/admin', (req,res) =>{
		getListId();
		getNumUsers();
		res.render('HomeAdmin');
	});
	
	app.get('/admin/add', (req,res) =>{
		//getNumUsers();
		res.render('Add');
	});
	app.post('/admin/add', (req,res) =>{
		
		console.log("id:"+parseInt(numU[numU.length-1], 10)+1 +" ip1:"+ req.body.ip1 +" ip2:"+req.body.ip2+"lora:"+req.body.lora+"lte:"+req.body.lte+"wifi:"+req.body.wifi);
		var l=0;
		var w=0;
		var lo=0;
		if(req.body.lte == 'yes'){
			l=1;
		}
		if(req.body.lora == 'yes'){
			w=1;
		}
		if(req.body.wifi == 'yes'){
			lo=1;
		}
		
		ADD(lo, l, w, req.body.ip1, req.body.ip2);
		const man ={
			action: "add_rule",
			ip_in: req.body.ip1,
			ip_out: req.body.ip2
		};
		client1.send(JSON.stringify(man), process.argv[3], process.argv[2], (err) => {
			//client1.close();
		});
		res.redirect('/admin');
	});
	
	async function ADD(lora, lte,wifi, ip1, ip2){
		//getNumUsers();
		bd.Add(conn,parseInt(numU[numU.length-1], 10)+1, lora, wifi, lte, ip1, ip2);
	}
	
	async function getListId(){
		listIdUser = await bd.getId(conn);
	}
	
	app.get('/admin/delete', (req,res) =>{
		//getNumUsers();
		getListId();
		console.log(listIdUser);
		res.render('Delete',{arr:listIdUser});
	});
	
	app.post('/admin/delete',(req,res) => {
		tmp1  = req.body.ID;
		Delete(tmp1);
	
		listIdUser=[];
		deletedIp=[];
		res.redirect('/admin');
	});
	async function Delete(id){
		deletedIp = await bd.Delete(conn, id);
		console.log(deletedIp);
		const man ={
			action: "delete_rule",
			ip_in: deletedIp[0],
			ip_out: deletedIp[1]
		};
		client1.send(JSON.stringify(man), process.argv[3], process.argv[2], (err) => {
			//client1.close();
		});
	}
	
	app.listen(PORT);
	console.log('Сервер стартовал!'+PORT);
}

main();





/*
<form method="post">
		<label>Введите id абонента, которого хотите удалить</label>
		<input type="text" name="id" placeholder='Активных абонентов: <%=b%>'><br><br>
		<button type="submit">Выбрать</button>
		<br><br>
	</form>
*/