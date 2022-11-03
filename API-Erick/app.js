const express = require('express')
const mysql = require('mysql2');
const app = express();
const bcrypt = require('bcrypt');
const cors = require('cors')

app.use(express.json());
app.use(cors())

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "bucho"
});

function generateHash(passwordFromUser) {
  const salt = bcrypt.genSaltSync(12);
  const hash = bcrypt.hashSync(passwordFromUser, salt);
  return hash;
}

function compareHash(passwordFromUser, hashed) {
  return bcrypt.compareSync(passwordFromUser, hashed);
}

app.get('/', async (req, res) => {
  res.send('pagina inicial');
});
//salvar receita link: http://localhost:8081/salvar-receita
app.post('/salvar-receita', async (req, res) => {
  db.connect(async (err) => {
    if (err) throw err;
    console.log("Connected!");
    const { nome, descricao, tempodepreparo, rendimento, ingredientes, mododepreparo, img, video, Categorias_idCategoria } = req.body
    db.query("INSERT INTO `receitas`(`idReceitas`, `nome`, `descricao`, `tempodepreparo`, `rendimento`, `ingredientes`, `mododepreparo`, `img`, `video`, `Categorias_idCategoria`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [nome, descricao, tempodepreparo, rendimento, ingredientes, mododepreparo, img, video, Categorias_idCategoria])
  });
  res.send('ta salvo meu bom');
  res.end();
});

//cadastro link: http://localhost:8081/cadastro

app.post('/cadastro', async (req, res) => {
  const { nome, email, password, telefone } = req.body
  db.query("SELECT `idUsuario` FROM `usuario` WHERE `email` = ?",
    [email],
    (error, result) => {
      if (result.length == 0) {
        db.query("INSERT INTO `usuario`(`idUsuario`, `nome`, `email`, `senha`, `telefone`) VALUES (NULL, ?, ?, ?, ?)",
          [nome, email, generateHash(password), telefone],
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
  var sql = 'SELECT * FROM `receitas` WHERE `Categorias_idCategoria` = ?';
  db.query(sql, [categoria], function (err, result) {
    if (err) throw err;
    res.send(result);
  });
});


//login
app.post('/login', async (req, res) => {
  const { email, password } = req.body
  db.query("SELECT `idUsuario`, `email`, `senha` FROM `usuario` WHERE `email` = ?",
    [email],
    (error, result) => {
      if (result.length === 0) {
        res.json({ "auth": false, "mesage": "email não encontrado" })
      }
      else {
        if (result[0].email == email && compareHash(password, result[0].senha)) {
          let token = jwt.sign({
            "idUsuario": result[0].idUsuario,
            "email": result[0].email
          }, KWT_KEY)

        }
        else { res.json({ "auth": false, "mesage": "E-mail ou senha incorretos" }) }
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


app.listen(8081, function () {
  console.log('rodando o serve');
});

// npm i express
// npm i mysql2

//pexe roda o codigo