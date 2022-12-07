-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2022 às 15:13
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.4

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

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nomeCategoria`) VALUES
(1, 'Doces'),
(2, 'Salgados'),
(3, 'Cafés'),
(4, 'Completos'),
(5, 'Sustentáveis'),
(6, 'Refeições');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
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

--
-- Extraindo dados da tabela `comentarios`
--

INSERT INTO `comentarios` (`idComent`, `receitas_idReceitas`, `idUser`, `titulo`, `texto`, `nome`, `email`, `aproved`, `deleted`) VALUES
(1, 2, 2, 'bullshit', 'aoba', 'Enzo', 'enzo.dionisio@outlook.com', 1, 0),
(3, 3, 2, 'Gostei muito', 'adorei os detalhes do peixe', 'O pexe é lindo', 'enzo@sla@hotmail.com', 1, 0),
(4, 3, 2, 'siiiiiiiiiiiiiiiiim', 'dnsadpasçdçasd', 'Arroz', 'pexe', 1, 0),
(5, 3, 2, 'sadsa', 'dasdas', 'adasda', 'dasdas', 1, 0),
(6, 3, 2, '', '', 'jenne', 'e', 1, 0),
(7, 3, 2, 'sadadasd', 'eiasdasdasdasdasdadasd', 'jenne', 'feia', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE `receitas` (
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

INSERT INTO `receitas` (`idReceitas`, `nome`, `descricao`, `tempodepreparo`, `rendimento`, `ingredientes`, `mododepreparo`, `aprovado`, `img`, `video`, `Categorias_idCategoria`) VALUES
(2, 'pexe', 'pexe.', '18anos', '', '[\"amor\", \"elemento X\", \"kkkkkk\"]', '[\"via \", \"adasdasd\"]', 1, 'qqwe', 'qweqwe', 4),
(3, 'Mel', 'mel', '12313212horas', '20 porções', '[\"peixe\"]', '[\"mel\"]', 1, 'asd', 'asda', 1),
(4, 'Bolinho de Brócolis', 'Bolinho de Brócolis com queijo na frigideira, rápido, pouquíssimos ingredientes e super fácil.', '30 minutos', '12 porções', '[\"300g de brócolis\" ,\"2½ colheres de farinha de trigo ou aveia \" ,\"Sal a gosto\" , \"Temperos à gosto \" ,\"100g de mussarela \" , \"2 ovos \" , \"Azeite \"]', '[\"Higienize e cozinhe o brócolis.\", \"Após o cozimento retirar os talos dos brócolis ( esses talos você pode utilizar na receita de panqueca de brócolis).\" ,\"Misture isso com os ovos, farinha, sal, temperos e a mussarela.\",\"Em uma frigideira com um fio de azeite coloque a misturinha e molde em formato de um círculo, espere até dourar ambos os lados.\",\"As porções depende do formato que você for fazer.\"]', 0, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/Receitas%20upadas%20manualmente%2FMicrosoftTeams-image%20(1).png?alt=media&token=d1bef506-9120-4a3e-943d-65c127e9d218', '', 5),
(5, 'Bolo de Milho Enlatado', 'Bolo feito com milho enlatado, com ingredientes simples e baratos.', '40 minutos', '1 Bolo', '[\"1 lata de milho\", \"1 xícara (chá) de açúcar\", \"3 ovos\", \"1 xícara (chá) leite\", \"1 xícara (chá) milharina\", \"1 colher (sopa) de fermento em pó\", \"1/2 xícara (chá) de óleo\"]\r\n\r\n', '[\" Unte uma forma com furo no meio com manteiga e farinha de trigo\", \" Misture os ingredientes no liquidificador e bata até que o milho esteja bem moído\", \"3. Acrescente o fermento e pulse o liquidificador 3 vezes\", \" Coloque a massa na forma e leve ao forno pré-aquecido a 180º por aproximadamente 40 minutos\", \" Se necessário, faça o teste do palito para garantir o cozimento do bolo\"]', 0, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/Receitas%20upadas%20manualmente%2Fbologrande.png?alt=media&token=92c04491-56df-48f3-bb38-0b96ad788083', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(300) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `email`, `senha`, `telefone`, `admin`) VALUES
(2, 'Enzo', 'pexe', '$2b$12$HWCu/pR1jjSySsyo7Ci98Oausn3Rn4GJZEYJNmKRiOuhZ3GptHXA6', '11993486470', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usucom`
--

CREATE TABLE `usucom` (
  `idUsuCom` int(11) NOT NULL,
  `comentarios_idComent` int(11) DEFAULT NULL,
  `usuario_idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usufav`
--

CREATE TABLE `usufav` (
  `idFav` int(11) NOT NULL,
  `idUsuFav` int(11) NOT NULL,
  `idReceitFav` int(11) NOT NULL,
  `titulo` varchar(1000) NOT NULL,
  `descricao` varchar(5000) NOT NULL,
  `img` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usufav`
--

INSERT INTO `usufav` (`idFav`, `idUsuFav`, `idReceitFav`, `titulo`, `descricao`, `img`) VALUES
(2, 2, 2, 'pexe', 'pexe.', 'qqwe');

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
  MODIFY `idComent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `idReceitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usucom`
--
ALTER TABLE `usucom`
  MODIFY `idUsuCom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usufav`
--
ALTER TABLE `usufav`
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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