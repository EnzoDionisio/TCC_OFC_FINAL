import express from 'express'
import mysql from 'mysql2'
import bcrypt from 'bcrypt'
import cors from 'cors'

const app = express();
import bodyParser from 'body-parser'

import {storageImage} from './firebase.js'

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
              db.query("INSERT INTO `usuario`(`idUsuario`, `nome`, `email`, `senha`, `telefone`, `admin`) VALUES (NULL, ?, ?, ?, ?, 0)",
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
  db.query("SELECT `idUsuario`, `nome`, `email`, `senha`, `admin` FROM `usuario` WHERE `email` = ?",
    [email],
    (error , result) => {
      const admin = result[0].admin
      const userData = {"id": result[0].idUsuario}
      if(result.length === 0){
        res.json({"auth": false, "message": "email não encontrado"})
        }
        else{
          if (result[0].email == email && compareHash(senha, result[0].senha)){
            if(admin == 1) {
              res.json({ "auth": true, "message": "Logado com sucesso!", userData, "admin": true})
              console.log("admin")
            }
            else {
              res.json({ "auth": true, "message": "Logado com sucesso!", userData, "admin": false})
              console.log("não admin")

            }
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
  const {userId} = req.body


  db.query("SELECT * FROM `usufav` WHERE `idUsuFav` = ?", 
  [userId], 
  (err, result) => {
    res.json(result)
  })
})

app.post("/favoritar", (req, res) => {
  const { recipeId, userId } = req.body

  db.query("SELECT * FROM `usufav` WHERE `idUsuFav` = ? && `idReceitFav` = ?",
    [userId, recipeId],
    (err, result) => {
      if (result.length == 0) {
        db.query("SELECT `nome`, `descricao`,`img` FROM `receitas` WHERE `idReceitas` = ?",
        [recipeId],
        (err, result) => {
          const {nome, descricao, img} = result[0]

          db.query("INSERT INTO `usufav`(`idFav`, `idUsuFav`, `idReceitFav`, `titulo`, `descricao`, `img`) VALUES (NULL,?,?,?,?,?)",
          [userId, recipeId, nome, descricao, img],
          (err, result) => {
              res.json({"status": true, "message": "Receita favoritada com sucesso!"})
          })
        })

        
      }
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

// buscar comentario com receita
app.post('/comentario', async (req, res) => {
  const {userId, recipeId, data} = req.body
  const {name, email, titulo, mensagem} = data

  console.log(req.body)

  db.query("INSERT INTO `comentarios`(`idComent`, `receitas_idReceitas`, `titulo`, `texto`, `nome`, `email`, `idUser`, `aproved`, `deleted`) VALUES (null,?,?,?,?,?,?, 0, 0)",
  [recipeId, titulo, mensagem, name, email, userId],
  (err, result) => {
  }
  )
});

app.post('/comentarioadmin', async (req, res) => {
  db.query("SELECT `nome`, `texto`, `idComent` FROM `comentarios` WHERE `aproved` = 0 && `deleted` = 0",
  (err, result) => {
    res.json(result)
  })
})

app.post('/aprovecomentario', async (req, res) => {
  const {idComent} = req.body

  db.query("UPDATE `comentarios` SET `aproved`= 1 WHERE `idComent` = ?",
  [idComent])
})

app.post("/deletecomentario", (req, res) => {
  const {idComent} = req.body

  db.query("UPDATE `comentarios` SET `deleted`= 1 WHERE `idComent` = ?",
  [idComent])
})

app.post("/comentariosreceita", (req, res) => {
  const {recipeId} = req.body

  db.query("SELECT `titulo`, `texto`, `nome` FROM `comentarios` WHERE `receitas_idReceitas` = ? && `aproved` = 1",
  [recipeId],
  (err, result) => {
    res.json(result)
  })
})

app.post("/sendRecipe", (req, res) => {
  const { data, image_url } = req.body
  const { name, email, rendimento, tempo, passosReceita, ingredientesReceita, categoria, descricao } = data

  let passosArray = ""
  let ingredientesArray = ""

  const passos = passosReceita.split(',')
  const ingredientes = ingredientesReceita.split(',')

  passosArray = `"[${passos}]"`
  ingredientesArray = `"[${ingredientes}]"`

  console.log(passosArray)
  console.log(ingredientesArray)

  db.query("INSERT INTO `receitas`(`idReceitas`, `nome`, `descricao`, `tempodepreparo`, `rendimento`, `ingredientes`, `mododepreparo`, `aprovado`, `img`, `video`, `Categorias_idCategoria`) VALUES (null,?,?,?,?,?,?,?,?,?,?)", 
  [name, descricao, tempo, rendimento, ingredientesArray, passosArray, 0, image_url, null, categoria], 
  (err, result) => {
    if(!err) {
      res.json({"status": true})
    }
  })
})




app.listen(8081, function () {
  console.log('rodando o serve');
});

