const express = require("express");
const app = express();
const db = require('./models/db.js');

app.get('/receita1', async (rec,res) => {
	res.send("informações da receita 1");
});






app.listen(8081, function(){
	console.log('rodando o serve');
});