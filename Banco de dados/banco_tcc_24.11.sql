-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Nov-2022 às 15:43
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
(6, 2, 2, 'a', 'a', 'a', 'a', 1, 0),
(7, 2, 2, 'b', 'b', 'b', 'b', 0, 1),
(8, 2, 2, 'k', 'k', 'k', 'k', 1, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComent`),
  ADD UNIQUE KEY `idComent_UNIQUE` (`idComent`),
  ADD KEY `receitas_idReceitas` (`receitas_idReceitas`),
  ADD KEY `idUser` (`idUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`receitas_idReceitas`) REFERENCES `receitas` (`idReceitas`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUsuario`);
COMMIT;