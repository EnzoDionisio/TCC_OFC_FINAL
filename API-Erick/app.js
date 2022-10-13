const express = require('express')
const mysql = require('mysql2');
const app = express();
app.use(express.json());
var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "123456",
  database: "bucho"
});


app.get('/', async (req,res) => {
  res.send('pagina inicial');
});
//salvar receita link: http://localhost:8081/salvar-receita
app.post('/salvar-receita', async (req,res) => {
  db.connect(async (err) =>{
    if (err) throw err;
    console.log("Connected!");
    const salvar = `INSERT INTO receitas (nome, descricao, mododepreparo, video, img) VALUES `;
    const values = (req.body.nome+',' +req.body.descricao+','+ req.body.mododepreparo+','+ req.body.video+','+ req.body.img);
    console.log(salvar + values)
    db.query(salvar+'('+values+')', function (err, result) {
      if (err) throw err;
      console.log("Number of records inserted: " + result.affectedRows);
    });
  });
  res.send('ta salvo meu bom');
    res.end();
});

//cadastro link: http://localhost:8081/cadastro
app.post('/cadastro', async (req,res) => {
  db.connect(async (err) =>{
    if (err) throw err;
    console.log("Connected!");
    const salvar = `INSERT INTO usuario (nome, email, senha, telefone) VALUES `;
    const values = (req.body.nome+',' +req.body.email+','+ req.body.senha+','+ req.body.tel);
    console.log(salvar + values)
    db.query(salvar+'('+values+')', function (err, result) {
      if (err) throw err;
      console.log("Number of records inserted: " + result.affectedRows);
    });
  });
  res.send('ta salvo meu bom');
    res.end();
});



app.listen(8081, function(){
  console.log('rodando o serve');
});









