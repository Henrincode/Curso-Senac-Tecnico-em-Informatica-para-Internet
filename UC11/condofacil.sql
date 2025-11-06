-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/11/2025 às 01:55
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
-- Banco de dados: `condofacil`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Calçados'),
(4, 'Acessórios'),
(5, 'Móveis'),
(6, 'Decoração'),
(7, 'Brinquedos'),
(8, 'Livros');

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominios`
--

CREATE TABLE `condominios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `condominios`
--

INSERT INTO `condominios` (`id`, `nome`, `numero`, `rua`, `cidade`, `estado`) VALUES
(1, 'Spazio Beach', 2000, 'Comendador Thomaz Fortunato', 'Americana', 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `usuario_id`, `categoria_id`, `titulo`, `descricao`) VALUES
(1, 1, 1, 'Rádio de carro CD US', 'Rádio de carro usado com entradas USB e leitor de CD'),
(2, 1, 1, 'Computador gamer', 'RTX 3060, I5, 16GB RAM, 1TB SSD'),
(3, 2, 2, 'Camisa social azul', 'Camisa social masculina tamanho M, pouco usada'),
(4, 2, 2, 'Jaqueta de couro', 'Jaqueta de couro preta, tamanho G, em ótimo estado'),
(5, 3, 3, 'Tênis esportivo Nike', 'Tênis de corrida confortável, número 42, usado poucas vezes'),
(6, 4, 4, 'Relógio de pulso', 'Relógio analógico com pulseira de couro marrom'),
(7, 5, 5, 'Sofá 3 lugares', 'Sofá de tecido cinza, confortável e bem conservado'),
(8, 6, 6, 'Luminária de mesa', 'Luminária branca de LED, ideal para escritório ou quarto'),
(9, 7, 7, 'Boneca Barbie', 'Boneca original Barbie com roupas e acessórios'),
(10, 8, 8, 'Livro “Dom Casmurro”', 'Edição de capa dura, excelente estado de conservação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Henrique', 'henrique@mail.com', 'dasDASD@!@#'),
(2, 'Ana Claudia', 'ana@mail.com', 'sadasd!@#Asdas'),
(3, 'Arthur Marques', 'arthur@mail.com', 'sdadSAD@!312'),
(4, 'Beatriz Souza', 'beatriz@mail.com', 'Bia123@!asd'),
(5, 'Carlos Eduardo', 'carlos@mail.com', 'CarL0s@#123'),
(6, 'Fernanda Lima', 'fernanda@mail.com', 'FerN@!789asd'),
(7, 'João Pedro', 'joaopedro@mail.com', 'JpEDR0@#abc'),
(8, 'Mariana Torres', 'mariana@mail.com', 'Mari@2024!A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_condominios`
--

CREATE TABLE `usuarios_condominios` (
  `usuario_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `bloco` varchar(10) NOT NULL,
  `apartamento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios_condominios`
--

INSERT INTO `usuarios_condominios` (`usuario_id`, `condominio_id`, `bloco`, `apartamento`) VALUES
(1, 1, '6', '308'),
(2, 1, '1', '102'),
(3, 1, '2', '201'),
(4, 1, '2', '202'),
(5, 1, '3', '301'),
(6, 1, '3', '302'),
(7, 1, '4', '401'),
(8, 1, '4', '402');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `condominios`
--
ALTER TABLE `condominios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prod_categoria` (`categoria_id`),
  ADD KEY `fk_prod_usuario` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios_condominios`
--
ALTER TABLE `usuarios_condominios`
  ADD KEY `fk_uc_condominio` (`condominio_id`),
  ADD KEY `fk_uc_usuario` (`usuario_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `condominios`
--
ALTER TABLE `condominios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_prod_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_prod_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `usuarios_condominios`
--
ALTER TABLE `usuarios_condominios`
  ADD CONSTRAINT `fk_uc_condominio` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  ADD CONSTRAINT `fk_uc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
