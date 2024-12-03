-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/12/2024 às 21:26
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carros`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nome_marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `marca`
--

INSERT INTO `marca` (`id_marca`, `nome_marca`) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Chevrolet'),
(4, 'Honda');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `marca_id_marca` int(11) DEFAULT NULL,
  `nome_modelo` varchar(100) NOT NULL,
  `cor_modelo` varchar(50) DEFAULT NULL,
  `ano_modelo` year(4) DEFAULT NULL,
  `placa_modelo` varchar(20) DEFAULT NULL,
  `id_proprietario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `marca_id_marca`, `nome_modelo`, `cor_modelo`, `ano_modelo`, `placa_modelo`, `id_proprietario`) VALUES
(1, 1, 'Corolla', 'Prata', '2020', 'ABC-1234', NULL),
(2, 1, 'Hilux', 'Branco', '2021', 'XYZ-5678', NULL),
(3, 2, 'Fiesta', 'Preto', '2019', 'DEF-3456', NULL),
(4, 2, 'Ranger', 'Azul', '2022', 'HIJ-7890', NULL),
(5, 3, 'Onix', 'Vermelho', '2021', 'KLM-2345', NULL),
(6, 3, 'Tracker', 'Cinza', '2023', 'NOP-4567', NULL),
(7, 4, 'Civic', 'Preto', '2020', 'QRS-6789', NULL),
(8, 4, 'HR-V', 'Branco', '2022', 'TUV-8901', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id_proprietario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `RG` varchar(20) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `CEP` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD UNIQUE KEY `placa_modelo` (`placa_modelo`),
  ADD KEY `marca_id_marca` (`marca_id_marca`),
  ADD KEY `id_proprietario` (`id_proprietario`);

--
-- Índices de tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id_proprietario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `id_proprietario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`marca_id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE,
  ADD CONSTRAINT `modelo_ibfk_2` FOREIGN KEY (`id_proprietario`) REFERENCES `proprietario` (`id_proprietario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
