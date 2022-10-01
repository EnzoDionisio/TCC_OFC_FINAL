CREATE DATABASE IF NOT EXISTS bucho character set utf8mb4 collate utf8mb4_unicode_ci ;
CREATE TABLE IF NOT EXISTS bucho.Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(15) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  PRIMARY KEY (idUsuario),
  UNIQUE INDEX email_UNIQUE (email ASC) ,
  UNIQUE INDEX telefone_UNIQUE (telefone ASC) ,
  UNIQUE INDEX idUsuario_UNIQUE (idUsuario ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Receitas (
  idReceitas INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(250) NOT NULL,
  mododepreparo VARCHAR(2000) NOT NULL,
  video LONGTEXT NULL,
  img MEDIUMTEXT NOT NULL,
  PRIMARY KEY (idReceitas),
  UNIQUE INDEX idReceitas_UNIQUE (idReceitas ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Categorias (
  idCategoria INT NOT NULL,
  cafe TINYINT NULL,
  almoco TINYINT NULL,
  sobremesas TINYINT NULL,
  bebidas TINYINT NULL,
  salgados TINYINT NULL,
  PRIMARY KEY (idCategoria),
  UNIQUE INDEX idCategoria_UNIQUE (idCategoria ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Envie (
  idEnvie INT NOT NULL AUTO_INCREMENT,
  nomeReceita VARCHAR(70) NOT NULL,
  igredientes VARCHAR(500) NOT NULL,
  mododepreparo VARCHAR(1000) NOT NULL,
  obs VARCHAR(100) NULL,
  Categorias_idCategoria INT NOT NULL,
  PRIMARY KEY (idEnvie, Categorias_idCategoria),
  INDEX fk_Envie_Categorias1_idx (Categorias_idCategoria ASC),
  CONSTRAINT fk_Envie_Categorias1
    FOREIGN KEY (Categorias_idCategoria)
    REFERENCES bucho.Categorias (idCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Favoritos (
  idFavoritos INT NOT NULL,
  Usuario_idUsuario INT NOT NULL,
  PRIMARY KEY (idFavoritos, Usuario_idUsuario),
  INDEX fk_Favoritos_Usuario1_idx (Usuario_idUsuario ASC),
  CONSTRAINT fk_Favoritos_Usuario1
    FOREIGN KEY (Usuario_idUsuario)
    REFERENCES bucho.Usuario (idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Receitas_has_Favoritos (
  Receitas_idReceitas INT NOT NULL,
  Favoritos_idFavoritos INT NOT NULL,
  Favoritos_Usuario_idUsuario INT NOT NULL,
  PRIMARY KEY ( Receitas_idReceitas, Favoritos_idFavoritos, Favoritos_Usuario_idUsuario),
  INDEX fk_Receitas_has_Favoritos_Favoritos1_idx (Favoritos_idFavoritos ASC, Favoritos_Usuario_idUsuario ASC),
  INDEX fk_Receitas_has_Favoritos_Receitas1_idx (Receitas_idReceitas ASC),
  CONSTRAINT fk_Receitas_has_Favoritos_Receitas1
    FOREIGN KEY (Receitas_idReceitas)
    REFERENCES bucho.Receitas (idReceitas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Receitas_has_Favoritos_Favoritos1
    FOREIGN KEY (Favoritos_idFavoritos , Favoritos_Usuario_idUsuario)
    REFERENCES bucho.Favoritos (idFavoritos , Usuario_idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bucho.Receitas_has_Categorias (
  Receitas_idReceitas INT NOT NULL,
  Categorias_idCategoria INT NOT NULL,
  PRIMARY KEY (Receitas_idReceitas, Categorias_idCategoria),
  INDEX fk_Receitas_has_Categorias_Categorias1_idx (Categorias_idCategoria ASC) ,
  INDEX fk_Receitas_has_Categorias_Receitas_idx (Receitas_idReceitas ASC) ,
  CONSTRAINT fk_Receitas_has_Categorias_Receitas
    FOREIGN KEY (Receitas_idReceitas)
    REFERENCES bucho.Receitas (idReceitas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Receitas_has_Categorias_Categorias1
    FOREIGN KEY (Categorias_idCategoria)
    REFERENCES bucho.Categorias (idCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

