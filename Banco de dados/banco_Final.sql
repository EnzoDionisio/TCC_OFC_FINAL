-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Dez-2022 às 02:43
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

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
(19, 5, 2, 'Amei a receita!!!', 'Simplesmente tudo perfeito nesse trabalho!', 'Débora', 'Debora@hotmail.com', 1, 0),
(20, 5, 2, 'adorei a receita!!!', 'Simplesmente tudo perfeito nesse trabalho, cicla muito bem com a sustentabilidade pós industrial!', 'Flávio', 'Debora@hotmail.com', 1, 0);

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
  `video` longtext DEFAULT NULL,
  `Categorias_idCategoria` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `receitas`
--

INSERT INTO `receitas` (`idReceitas`, `nome`, `descricao`, `tempodepreparo`, `rendimento`, `ingredientes`, `mododepreparo`, `aprovado`, `img`, `video`, `Categorias_idCategoria`, `deleted`) VALUES
(4, 'Bolinho de Brócolis', 'Bolinho de Brócolis com queijo na frigideira, rápido, pouquíssimos ingredientes e super fácil.', '30 minutos', '12 porções', '[\"300g de brócolis\" ,\"2½ colheres de farinha de trigo ou aveia \" ,\"Sal a gosto\" , \"Temperos à gosto \" ,\"100g de mussarela \" , \"2 ovos \" , \"Azeite \"]', '[\"Higienize e cozinhe o brócolis.\", \"Após o cozimento retirar os talos dos brócolis ( esses talos você pode utilizar na receita de panqueca de brócolis).\" ,\"Misture isso com os ovos, farinha, sal, temperos e a mussarela.\",\"Em uma frigideira com um fio de azeite coloque a misturinha e molde em formato de um círculo, espere até dourar ambos os lados.\",\"As porções depende do formato que você for fazer.\"]', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/Receitas%20upadas%20manualmente%2FMicrosoftTeams-image%20(1).png?alt=media&token=d1bef506-9120-4a3e-943d-65c127e9d218', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/E-cqk3JulUg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 5, 0),
(5, 'Bolo de Milho Enlatado', 'Bolo feito com milho enlatado, com ingredientes simples e baratos.', '40 minutos', '1 Bolo', '[\"1 lata de milho\", \"1 xícara (chá) de açúcar\", \"3 ovos\", \"1 xícara (chá) leite\", \"1 xícara (chá) milharina\", \"1 colher (sopa) de fermento em pó\", \"1/2 xícara (chá) de óleo\"]\r\n\r\n', '[\" Unte uma forma com furo no meio com manteiga e farinha de trigo\", \" Misture os ingredientes no liquidificador e bata até que o milho esteja bem moído\", \"3. Acrescente o fermento e pulse o liquidificador 3 vezes\", \" Coloque a massa na forma e leve ao forno pré-aquecido a 180º por aproximadamente 40 minutos\", \" Se necessário, faça o teste do palito para garantir o cozimento do bolo\"]', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/Receitas%20upadas%20manualmente%2Fbologrande.png?alt=media&token=92c04491-56df-48f3-bb38-0b96ad788083', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Uc05ohfKLiY\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, 0),
(10, 'Berinjela empanada', 'Receita de berinjela com queijo, crocante por fora e macia por dentro na airfryer, rápido e prática para toda sua família.', ' 40 minutos', '', '[\"1 berinjela\",\n\"250g de farinha de rosca\",\n\"Sal\",\n\"Tempero a gosto\",\n\"2 ovos\",\n\"100g de queijo da sua preferência ( opcional ) \"]', '[\"Higienize a berinjela e forte em rodelas\",\n\"Quebre os ovos e bata até ficar uma mistura homogênea\",\n\"Na farinha de rosca você pode temperar a gosto, o queijo ele é opcional, após acrescentar os ingredientes mesa tudo.\",\n\"Passe as rodelas nos ovos batidos e em seguida passe na farinha de rosca de forma que cubra toda a rodela.\",\n\"Feito todas as rodelas você pode fritar na sua frigideira com um fio de azeite até dourar  ou levar na fritadeira elétrica por 20 minutos e regar com um fio de azeite.\",\n\"O ponto da berinjela empanada é quando estiver douradas.\"]', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2FMicrosoftTeams-image.png?alt=media&token=7ce7d212-3fd3-41ab-9393-638767051544', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kCC4T9JyGA8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 2, 0),
(11, 'Arroz Branco Simples', 'Arroz soltinho clássico para quem está iniciando na cozinha!', '30 minutos', '10 Porções de c', '[\"2 dentes de alhos picado\",\"1 fio (sopa) de óleo\",\"1 colher (chá) de sal\",\"2 xícaras de arroz\",\"3 xícaras de água quente\"]', '[\"Lave bem o arroz\",\"Coloque a água para ferver\",\"Soque o alho picado\",\"Em seguida, numa panela, coloque o alho picado e socado, espere\",\"Acrescente então o óleo e deixe dourar\",\"Quando o alho começar a suar, adicione o arroz\",\"Refogue o arroz, e em seguida, coloque a água quente e o sal\",\"Baixe o fogo, deixe a panela semi-tampada e deixe cozinhar até a água secar.\"]', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2FMicrosoftTeams-image%20(2).png?alt=media&token=025739b5-c77a-4011-a87c-641708a4d84f', NULL, 4, 0),
(12, 'Biscoitinho de leite em pó', 'Biscoitinhos doces simples e gostosos feitos com leite em pó.', '20 minutos', '12 porções', '[\'1/2 xícara (chá) de leite em pó\',\'1/2 xícara (chá) de amido de milho\',\'1 colher (sopa) de manteiga\',\'1 caixa de leite condensado\']', '[\'Misture todos os ingredientes num recipiente, porém adicione aos poucos o leite condensado, até ficar uma massa que não gruda nas mãos.\',\'Unte a forma na qual os biscoitos irão assar ou coloque papel manteiga.\',\'Enrole a massa do jeito que preferir e coloque na forma.\',\'Leve ao forno a 180° por 20 minutos.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2Fbiscoitodoce.png?alt=media&token=9b713625-2b7b-43ad-bf2e-818610f239be', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EIlRL-gix5U\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, 0),
(13, 'Panqueca de brócolis', 'Prática receita de brócolis, boa para aproveitar talos não usados!', '40 minutos', '8 porções', '[\'150g Talos de brócolis\',\'5 xícaras de chá de farinha de trigo\',\'3 xícaras de chá de leite integral\',\'Sal a gosto\',\'Azeite\',\'Recheio: à gosto (o recheio que utilizamos foi de carne moída)\',\'300g de carne moída ( pode ser da sua preferência).\',\'Azeitona\',\'Temperos e sal a gosto.\',\'Finalização opcional\',\'½ xícara de chá molho de tomate\',\'Mussarela a gosto\']', '[\'No liquidificador coloque o leite, a farinha, os talos, sal e um fio de azeite e bata tudo até ficar uma mistura homogênea, se sua massa estiver muito grossa acrescente mais leite e farinha.\',\'Após a mistura prepare seu recheio a gosto.\',\'Como utilizei carne moída em uma panela com alho e azeite fritei a carne moída, temperei e deixei cozinhando, após o cozimento acrescentei azeitonas.\',\'Após finalizar o preparo só seu recheio, coloque um pouco da massa da panqueca em uma frigideira com um fio de azeite e deixe dourar dos dois lados.\',\'Após isso recheie e feche sua panqueca, você pode colocar molho de tomate e mussarela ao fechar sua panqueca, leve ao forno ou microondas até derreter ou dourar o queijo.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2Fpanqueca.png?alt=media&token=730a395e-3d90-4d84-9b8a-4899c4e46185', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Cp0s9MxoCQ4\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 5, 0),
(14, 'Chocolate quente cremoso', 'Receita deliciosa de chocolate quente cremoso, super deliciosa para sair da rotina!', '10 Minutos', '4 Porções', '[\'xícaras (chá) de leite\',\'1 colher (sopa) de amido de milho\',\'3 colheres (sopa) de chocolate em pó\',\'4 colheres (sopa) de açúcar\',\'1 canela em pó\',\'1 caixinha de creme de leite\']', '[\'Em um liquidificador, bata o leite, o amido de milho, o chocolate em pó e o açúcar.\',\'Despeje a mistura em uma panela com a canela e leve ao fogo baixo, mexendo sempre até ferver.\',\'Desligue, adicione o creme de leite e mexa bem até obter uma mistura homogênea.\',\'Retire a canela e sirva quente.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2F321194_original.jpeg?alt=media&token=fc182a81-8ea6-437a-beff-d85f2de81706', NULL, 3, 0),
(15, 'Batata doce ao forno', 'Um ótimo petisco para os que amam batata doce de coração, ou que querem provar algo diferente do convencional\r\n', '35 minutos', '4 Porções', '[\'3 batatas doce grandes\',\'Azeite a gosto\',\'Salsinha a gosto\',\'Cebolinha a gosto\',\'Oregano a gosto\']', '[\'Corte as batatas em rodelas de mais ou menos 2 cm. Preaqueca o forno a 200°C.\',\'Em uma travessa que possa ir ao forno coloque-as e regue-as com o azeite a gosto. Salpique a cebolinha, salsinha e oregano a gosto.\',\'Cubra a travessa com papel aluminio, deixe no forno por uns 20 minutos. Quando estiverem macias (não moles), tire o papel e deixe dourar por uns 10 minutos.\',\'Se preferir pode salpicar presunto, bacon ou peito de peru cortadinho.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2Fbatata-doce-assada.png?alt=media&token=055aee6c-edf7-41b6-8708-9a19953f204b', NULL, 4, 0),
(16, 'Suco verde detox', 'Aprenda como fazer suco verde, o suco mais queridinho do momento. Uma receita fácil, para fazer no dia a dia e que com certeza,  até quem faz cara feia vai gostar.', '5 minutos', '1 porção', '[\'1 folha de couve\',\'suco de 1 limão;\',\'1 maçã pequena com casca;\',\'1 colher de café de gengibre ralado;\',\'200 ml de água gelada.\']', '[\'Bata todos os ingredientes no liquidificador até ficar uniforme.\',\'Em seguida, de preferência, beba sem coar e não adoce.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2Fbatata-doce-assada.png?alt=media&token=055aee6c-edf7-41b6-8708-9a19953f204b', NULL, 3, 0),
(17, 'Lasanha de carne moída', 'Lasanha perfeita para quem quer fazer um prato bem gostoso para a família e amigos!', '50 minutos', '15 porções', '[\'500 g de massa de lasanha\',\'500 g de carne moída\',\'2 caixas de creme de leite\',\'3 colheres de manteiga\',\'3 colheres de farinha de trigo\',\'500 g de presunto\',\'500 g de mussarela\',\'sal a gosto\',\'2 copos de leite\',\'1 cebola ralada\',\'3 colheres de óleo\',\'1 caixa de molho de tomate\',\'3 dentes de alho amassados\',\'1 pacote de queijo ralado\']', '[\'LASANHA\',\'Cozinhe a massa segundo as orientações do fabricante, despeje em um refratário com água gelada para não grudar e reserve.\',\'MOLHO À BOLONHESA\',\'Refogue o alho, a cebola, a carne moída, o molho de tomate, deixe cozinhar por 3 minutos e reserve.\',\'MOLHO BRANCO\',\'Derreta a margarina, coloque as 3 colheres de farinha de trigo e mexa.\',\'Despeje o leite aos poucos e continue mexendo.\',\'Por último, coloque o creme de leite, mexa por 1 minuto e desligue o fogo.\',\'MONTAGEM\',\'Despeje uma parte do molho à bolonhesa em um refratário, a metade da massa, a metade do presunto, a metade da mussarela, todo o molho branco e o restante da massa.\',\'Repita as camadas até a borda do recipiente.\',\'Finalize com o queijo ralado e leve ao forno alto (220° C), preaquecido, por cerca de 20 minutos.\']', 1, 'https://firebasestorage.googleapis.com/v0/b/bucho-cheio-f31b1.appspot.com/o/categorias%2F324587_original.jpeg?alt=media&token=7cab2114-01ad-4b9b-8c44-6304759433e7', NULL, 4, 0);

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
(2, 'Enzo', 'pexe', '$2b$12$HWCu/pR1jjSySsyo7Ci98Oausn3Rn4GJZEYJNmKRiOuhZ3GptHXA6', '11993486470', 1);

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
  MODIFY `idComent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `idReceitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
