-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2025 às 03:26
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
-- Banco de dados: `construtura`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `departamentos`
--

INSERT INTO `departamentos` (`id`, `nome`) VALUES
(1, 'Financeiro'),
(2, 'Comercial'),
(3, 'Segurança');

-- --------------------------------------------------------

--
-- Estrutura para tabela `instrumentos`
--

CREATE TABLE `instrumentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `instrumentos`
--

INSERT INTO `instrumentos` (`id`, `nome`) VALUES
(1, 'Caneta'),
(2, 'Notebook'),
(3, 'Headset');

-- --------------------------------------------------------

--
-- Estrutura para tabela `kit_emprestado`
--

CREATE TABLE `kit_emprestado` (
  `instrumento_id` int(11) DEFAULT NULL,
  `projeto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kit_emprestado`
--

INSERT INTO `kit_emprestado` (`instrumento_id`, `projeto_id`) VALUES
(1, 3),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `veiculo_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`id`, `nome`, `veiculo_id`, `usuario_id`) VALUES
(1, 'Projeto Financeiro', 2, 1),
(2, 'Projeto Comercial', 3, 2),
(3, 'Projeto Segurança', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `departamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `departamento_id`) VALUES
(1, 'João', 3),
(2, 'Tânia', 2),
(3, 'Guilherme', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(100) DEFAULT NULL,
  `responsavel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `placa`, `responsavel_id`) VALUES
(1, 'KZT4H59', 2),
(2, 'MGN8R12', 2),
(3, 'PQX7S84', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `instrumentos`
--
ALTER TABLE `instrumentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `kit_emprestado`
--
ALTER TABLE `kit_emprestado`
  ADD KEY `fk_instrumento` (`instrumento_id`),
  ADD KEY `fk_projeto` (`projeto_id`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario` (`usuario_id`),
  ADD KEY `fk_veiculo` (`veiculo_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento` (`departamento_id`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_responsavel` (`responsavel_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `instrumentos`
--
ALTER TABLE `instrumentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `kit_emprestado`
--
ALTER TABLE `kit_emprestado`
  ADD CONSTRAINT `fk_instrumento` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumentos` (`id`),
  ADD CONSTRAINT `fk_projeto` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`),
  ADD CONSTRAINT `kit_emprestado_ibfk_1` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumentos` (`id`);

--
-- Restrições para tabelas `projetos`
--
ALTER TABLE `projetos`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_veiculo` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `fk_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
