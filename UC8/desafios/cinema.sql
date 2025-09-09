-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 03:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cinema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `t_filme`
--

CREATE TABLE `t_filme` (
  `id_filme` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `diretor` varchar(100) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `classificacao` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `t_filme`
--

INSERT INTO `t_filme` (`id_filme`, `titulo`, `diretor`, `genero`, `duracao`, `classificacao`) VALUES
(1, 'Filme 1', 'Diretor 1', 'Genero 1', 120, '18+'),
(2, 'Filme 2', 'Diretor 2', 'Genero 2', 160, '16+'),
(3, 'Filme 3', 'Diretor 3', 'Genero 3', 100, '13+');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `t_filme`
--
ALTER TABLE `t_filme`
  ADD PRIMARY KEY (`id_filme`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `t_filme`
--
ALTER TABLE `t_filme`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
