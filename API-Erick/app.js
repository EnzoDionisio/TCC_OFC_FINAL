const express = require('express')
const mysql = require('mysql2');
const app = express();
const bcrypt = require('bcrypt');
const cors = require('cors')
const bodyParser = require('body-parser')

app.use(express.json());
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json())
app.use(cors())

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "bucho"
});

const salt = bcrypt.genSaltSync(12);

function compareHash(password, hashed) {
  return bcrypt.compareSync(password, hashed);
}

app.get('/', async (req, res) => {
  res.send('pagina inicial');
});
//salvar receita link: http://localhost:8081/salvar-receita
app.post('/salvar-receita', async (req, res) => {
  db.connect(async (err) => {
    if (err) throw err;
    console.log("Connected!");
    const { nome, descricao, tempodepreparo, rendimento, ingredientes, mododepreparo, dificuldade, img, video, Categorias_idCategoria } = req.body
    db.query("INSERT INTO `receitas`(`idReceitas`, `nome`, `descricao`, `tempodepreparo`, `rendimento`, `ingredientes`, `mododepreparo`, `dificuldade`, `img`, `video`, `Categorias_idCategoria`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [nome, descricao, tempodepreparo, rendimento, ingredientes, mododepreparo, dificuldade, img, video, Categorias_idCategoria])
  });
  res.send('ta salvo meu bom');
  res.end();
});

//cadastro link: http://localhost:8081/cadastro

app.post('/cadastro', async (req,res) => {
  console.log(req.body)
  const {nome, email, senha, telefone} = req.body
  db.query("SELECT `idUsuario` FROM `usuario` WHERE `email` = ?",
      [email],
      (error, result) => {
          if (result.length == 0) {
            const password = bcrypt.hashSync(senha, salt);
              db.query("INSERT INTO `usuario`(`idUsuario`, `nome`, `email`, `senha`, `telefone`) VALUES (NULL, ?, ?, ?, ?)",
                  [nome, email, password, telefone],
                  (error, result) => {
                      if (error) {
                          res.json({ "status": false, "message": "Não foi possível cadastrar o usuário. Tente novamente mais tarde, por favor." })
                      }
                      else {
                          res.json({ "status": true, "message": "Usuário cadastrado com sucesso!" })
                      }
                  }
              )
          }
          else {
              res.json({ "status": false, "message": "Usuário já existente." })
          }
      })
});




//buscar info receitas com categoria 
app.get('/categoria/:categoria', async (req, res) => {
  const categoria = req.params.categoria;
  db.query("SELECT idCategoria FROM `categorias` WHERE `nomeCategoria` = ?",
  [categoria],
  (err, result) => {
    const idCategoria = result[0].idCategoria
    db.query('SELECT * FROM `receitas` WHERE `aprovado` = 1 AND `Categorias_idCategoria` = ?',
    [idCategoria], 
    (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  }
  )
});


//login
app.post('/login', async(req,res) =>{
  const {email, senha} = req.body
  db.query("SELECT `idUsuario`, `nome`, `email`, `senha` FROM `usuario` WHERE `email` = ?",
    [email],
    (error , result) => {
      const userData = {"id": result[0].idUsuario}
      if(result.length === 0){
        res.json({"auth": false, "message": "email não encontrado"})
        }
        else{
          if (result[0].email == email && compareHash(senha, result[0].senha)){
            console.log("logado"),
            res.json({ "auth": true, "message": "Logado com sucesso!", userData})
          }
          else{res.json({ "auth": false, "message": "E-mail ou senha incorretos"})}
        }

    }
  )
});


//buscar info receita 
app.get("/buscareceita/:idReceita", (req, res) => {
  const idReceita = req.params.idReceita

  db.query("SELECT * FROM `receitas` WHERE `idReceitas` = ?",
    [idReceita],
    (err, result) => {
      if (result.length == 0) {
        res.send("Receita não encontrada.")
      }
      else {
        res.json(result[0])
      }
    }
  )
})

app.post("/favoritos", (req, res) => {
  const {id} = req.body

  db.query("SELECT `idReceitFav` FROM `usufav` WHERE `idUsuFav` = ?", 
  [id], 
  (err, result) => {
    res.json(result)
  })
})

app.post("/userdata", (req, res) => {
  const {id} = req.body
  db.query("SELECT `nome` FROM `usuario` WHERE `idUsuario` = ?",
  [id],
  (err, result) => {
    res.json(result[0])
  })
})

app.listen(8081, function () {
  console.log('rodando o serve');
});