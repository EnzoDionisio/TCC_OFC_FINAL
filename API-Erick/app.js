const express = require("express");
const app = express();
const cors = require ('cors');

const receitas = require ('./models/receitas');

const er = require('./models/er');

app.use(express.json());

app.get('/', async (req,res) => {
	res.send('pagina inicial');
});

app.post('/enviarrec', async (req,res) => {
	console.log(req.body);

	await er.create(req.body)
	.then(() =>{
		return res.json({
			erro:false,
			mensagem:"receita cadastrada"
		});
	}).catch(() => {
		return res.status(400).json({
			erro:true,
			mensagem: "usuario não cadastrado"
		});
	});
});





app.listen(8081, function(){
	console.log('rodando o serve');
});