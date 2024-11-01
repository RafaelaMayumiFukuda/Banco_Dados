-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Nov-2024 às 20:59
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

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
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `marca_id_marca` int(11) NOT NULL,
  `nome_modelo` varchar(45) NOT NULL,
  `cor_modelo` varchar(20) NOT NULL,
  `ano_modelo` year(4) NOT NULL,
  `placa_modelo` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `marca_id_marca`, `nome_modelo`, `cor_modelo`, `ano_modelo`, `placa_modelo`) VALUES
(1, 1, 'Corolla', 'Prata', 2020, 'ABC-1234'),
(2, 1, 'Hilux', 'Branco', 2021, 'XYZ-5678'),
(3, 2, 'Fiesta', 'Preto', 2019, 'DEF-3456'),
(4, 2, 'Ranger', 'Azul', 2022, 'HIJ-7890'),
(5, 3, 'Onix', 'Vermelho', 2021, 'KLM-2345'),
(6, 3, 'Tracker', 'Cinza', 2023, 'NOP-4567'),
(7, 4, 'Civic', 'Preto', 2020, 'QRS-6789'),
(8, 4, 'HR-V', 'Branco', 2022, 'TUV-8901'),
(9, 2, 'Corolla', 'Prata', 2020, 'ABC-1234'),
(10, 3, 'Ranger', 'Azul', 2021, 'XYZ-5678'),
(11, 1, 'Civic', 'Preto', 2022, 'DEF-3456');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD UNIQUE KEY `id_modelo` (`id_modelo`,`marca_id_marca`),
  ADD KEY `marca_id_marca` (`marca_id_marca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`marca_id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
