-- criar e selecionar banco de dados
CREATE database IF NOT EXISTS bucho;
USE bucho;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `bucho`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nomeCategoria`) VALUES
(1, 'doce'),
(2, 'salgado'),
(3, 'cafe'),
(4, 'completo'),
(5, 'sustentavel'),
(6, 'almoco');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--


CREATE TABLE IF NOT EXISTS `comentarios` (
  `idComent` int(11) NOT NULL,
  `receitas_idReceitas` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `titulo` varchar(75) DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `aproved` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE IF NOT EXISTS`receitas` (
  `idReceitas` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `tempodepreparo` varchar(15) NOT NULL,
  `rendimento` varchar(15) NOT NULL,
  `ingredientes` varchar(500) NOT NULL,
  `mododepreparo` varchar(2000) NOT NULL,
  `aprovado` tinyint(4) NOT NULL,
  `img` mediumtext NOT NULL,
  `video` longtext NOT NULL,
  `Categorias_idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `receitas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS`usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(300) NOT NULL,
  `telefone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Extraindo dados da tabela `usuario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usucom`
--

CREATE TABLE IF NOT EXISTS`usucom` (
  `idUsuCom` int(11) NOT NULL,
  `comentarios_idComent` int(11) DEFAULT NULL,
  `usuario_idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usufav`
--

CREATE TABLE IF NOT EXISTS`usufav` (
  `idFav` int(11) NOT NULL,
  `idUsuFav` int(11) NOT NULL,
  `idReceitFav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usufav`
--

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComent`),
  ADD UNIQUE KEY `idComent_UNIQUE` (`idComent`),
  ADD KEY `receitas_idReceitas` (`receitas_idReceitas`);

--
-- Índices para tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`idReceitas`),
  ADD UNIQUE KEY `idReceitas_UNIQUE` (`idReceitas`),
  ADD KEY `fk_Receitas_Categorias_idx` (`Categorias_idCategoria`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  ADD UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`);

--
-- Índices para tabela `usucom`
--
ALTER TABLE `usucom`
  ADD PRIMARY KEY (`idUsuCom`),
  ADD KEY `comentarios_idComent` (`comentarios_idComent`),
  ADD KEY `usuario_idUsuario` (`usuario_idUsuario`);

--
-- Índices para tabela `usufav`
--
ALTER TABLE `usufav`
  ADD PRIMARY KEY (`idFav`),
  ADD KEY `idUsuFav` (`idUsuFav`),
  ADD KEY `idReceitFav` (`idReceitFav`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `idReceitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usucom`
--
ALTER TABLE `usucom`
  MODIFY `idUsuCom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usufav`
--
ALTER TABLE `usufav`
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`receitas_idReceitas`) REFERENCES `receitas` (`idReceitas`);

--
-- Limitadores para a tabela `receitas`
--
ALTER TABLE `receitas`
  ADD CONSTRAINT `receitas_ibfk_1` FOREIGN KEY (`Categorias_idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usucom`
--
ALTER TABLE `usucom`
  ADD CONSTRAINT `usucom_ibfk_1` FOREIGN KEY (`comentarios_idComent`) REFERENCES `comentarios` (`idComent`),
  ADD CONSTRAINT `usucom_ibfk_2` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `usufav`
--
ALTER TABLE `usufav`
  ADD CONSTRAINT `usufav_ibfk_1` FOREIGN KEY (`idUsuFav`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `usufav_ibfk_2` FOREIGN KEY (`idReceitFav`) REFERENCES `receitas` (`idReceitas`);
COMMIT;
