CREATE database IF NOT EXISTS bucho;
USE bucho;
CREATE TABLE IF NOT EXISTS bucho.Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(300) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  PRIMARY KEY (idUsuario),
  UNIQUE INDEX email_UNIQUE (email ASC) ,
  UNIQUE INDEX telefone_UNIQUE (telefone ASC) ,
  UNIQUE INDEX idUsuario_UNIQUE (idUsuario ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Categorias (
  idCategoria INT NOT NULL AUTO_INCREMENT,
  nomeCategoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCategoria),
  UNIQUE INDEX idCategoria_UNIQUE (idCategoria ASC) )
ENGINE = InnoDB;

 CREATE TABLE IF NOT EXISTS bucho.Receitas (
  idReceitas INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(70) NOT NULL,
  descricao VARCHAR(250) NOT NULL,
  tempodepreparo VARCHAR(15) NOT NULL,
  rendimento VARCHAR(15) NOT NULL,
  ingredientes VARCHAR(500) NOT NULL,
  mododepreparo VARCHAR(2000) NOT NULL,
  aprovado tinyint not null,
  img MEDIUMTEXT NOT NULL,
  video LONGTEXT NOT NULL,
  Categorias_idCategoria INT NOT NULL,
  PRIMARY KEY (idReceitas),
  UNIQUE INDEX idReceitas_UNIQUE (idReceitas ASC) ,
  INDEX fk_Receitas_Categorias_idx (Categorias_idCategoria ASC) ,
    FOREIGN KEY (Categorias_idCategoria) references categorias(idCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.comentarios (
  idComent INT NOT NULL AUTO_INCREMENT,
  receitas_idReceitas INT NOT NULL,
  titulo varchar (75),
  texto varchar (500),
  PRIMARY KEY (idComent),
  FOREIGN KEY (receitas_idReceitas) references receitas(idReceitas),
  UNIQUE INDEX idComent_UNIQUE (idComent ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.usuCom (
   idUsuCom INT NOT NULL AUTO_INCREMENT,
   comentarios_idComent INT,
   usuario_idUsuario INT,
   PRIMARY KEY (idUsuCom),
   FOREIGN KEY (comentarios_idComent) references comentarios(idComent),
   FOREIGN KEY (usuario_idUsuario) references usuario(idUsuario)
) ENGINE=InnoDB;

INSERT INTO `categorias` (`idCategoria`, `nomeCategoria`) VALUES  (NULL, 'doce'), (NULL, 'salgado'), (NULL, 'cafe'), (NULL, 'completo'), (NULL, 'sustentavel'), (NULL, 'almoco')
