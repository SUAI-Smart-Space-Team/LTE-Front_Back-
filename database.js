module.exports = {
	
	numUsers: async function(conn){
		let a = `SELECT id FROM mybd.users`;
		let arr = [];
		const [rows,fields] = await conn.execute(a);
		for (let i = 0; i < rows.length; i++) { // выведет 0, затем 1, затем 2
			arr.push(""+rows[i].id);
		}
		return arr;
	},
	
	getInterfaces: async function(conn, id){
		let c = `SELECT * FROM mybd.users WHERE id=${id}`;
		let arr = [];
		const [rows1,fields1] =  await conn.execute(c);
		console.log(rows1);
		if(rows1[0].LTE == 1){
			arr.push("LTE");
		}
		if(rows1[0].LoRa==1){
			arr.push("LoRa");
		}
		if(rows1[0].WiFi==1)
		{
			arr.push("WiFi");
		}
		return arr;
	},
	
	Log: async function(conn, time, id, nameInt, CurMes){
		let d = `Insert into mybd.Log(Moment, IdUser, Interface, Message) values ('${time}', ${id}, '${nameInt}', '${CurMes}')`;
		await conn.execute(d);
	},
	
	getId: async function(conn){
		let a = `SELECT id FROM mybd.users`;
		let arr = [];
		const [rows,fields] = await conn.execute(a);
		for (let i = 0; i < rows.length; i++) { // выведет 0, затем 1, затем 2
			arr.push(""+rows[i].id);
		}
		return arr;
	},
	
	getIp:async function(conn, Interface, Id){
		let d = `SELECT IpIn FROM mybd.${Interface} WHERE IdUser = ${Id}`;
		const [rows,fields] = await conn.execute(d);
		//console.log(rows);
		console.log(rows[0].IpIn);
		return rows[0].IpIn;
	},
	
	Add: async function(conn, id, Lora, Wifi, LTE, ip1, ip2){
		let d = `Insert into mybd.Users(Id, LTE, LoRa, WiFi) values (${id}, ${LTE}, ${Lora}, ${Wifi})`;
		console.log("id: "+id +" ip1: "+ ip1 +" ip2: "+ip2+" lora: "+Lora+" lte: "+LTE+" wifi: "+Wifi);
		await conn.execute(d);
		if(Lora ==1){
			let c = `Insert into mybd.lora(IdUser, IpIn, IpOut) values ('${id}', '${ip1}', '${ip2}')`;
			await conn.execute(c);
		}
		if(Wifi ==1){
			let c = `Insert into mybd.wifi(IdUser, IpIn, IpOut) values ('${id}', '${ip1}', '${ip2}')`;
			await conn.execute(c);
		}
		if(LTE ==1){
			let c = `Insert into mybd.lte(IdUser, IpIn, IpOut) values ('${id}', '${ip1}', '${ip2}')`;
			await conn.execute(c);
		}
	},
	
	Delete: async function(conn, id){
		let arr = [];
		let a = `SELECT * FROM mybd.users WHERE id=${id}`;
		const [rows1,fields1] =  await conn.execute(a);
		console.log(rows1);
		if(rows1[0].LTE == 1){
			let d1 = `SELECT * FROM mybd.lte WHERE IdUser=${id}`;
			const [rows2,fields2] =  await conn.execute(d1);
			console.log(rows2);
			arr.push(""+rows2[0].IpIn);
			arr.push(""+rows2[0].IpOut);
			let d = `Delete FROM mybd.lte where IdUser= ${id}`;
			await conn.execute(d);
		}
		if(rows1[0].LoRa==1){
			if(rows1[0].LTE == 0){
				let d1 = `SELECT * FROM mybd.lora WHERE IdUser=${id}`;
				const [rows2,fields2] =  await conn.execute(d1);
				console.log(rows2);
				arr.push(""+rows2[0].IpIn);
				arr.push(""+rows2[0].IpOut);
			}
		
			let e = `Delete FROM mybd.lora where IdUser= ${id}`;
			await conn.execute(e);
			
		}
		if(rows1[0].WiFi==1)
		{
			if(rows1[0].LTE == 0 && rows1[0].LoRa == 0){
				let d1 = `SELECT * FROM mybd.wifi WHERE IdUser=${id}`;
				const [rows2,fields2] =  await conn.execute(d1);
				console.log(rows2);
				arr.push(""+rows2[0].IpIn);
				arr.push(""+rows2[0].IpOut);
			}
			let c = `Delete FROM mybd.wifi where IdUser= ${id}`;
			await conn.execute(c);
		}
		let k = `Delete FROM mybd.users where Id= ${id}`;
		await conn.execute(k);
		console.log(arr);
		return arr;
	}
};