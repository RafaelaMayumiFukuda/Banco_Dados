-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Nov-2024 às 19:54
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
-- Banco de dados: `livraria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `registro` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `pais` varchar(15) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `id_autor_livro` int(10) NOT NULL,
  `id_autor_editora` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(5) NOT NULL,
  `categoria` int(20) NOT NULL,
  `id_categoria_livro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_clietes` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id_colaboradores` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `dt_nascimente` date NOT NULL,
  `dt_admissao` date NOT NULL,
  `salario` int(10) NOT NULL,
  `observacao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `danfe`
--

CREATE TABLE `danfe` (
  `id_danfe` int(5) NOT NULL,
  `numero_nfe` int(10) NOT NULL,
  `serie_nfe` int(3) NOT NULL,
  `dt_emissao` date NOT NULL,
  `valor_total` int(10) NOT NULL,
  `chave_eletronica` int(44) NOT NULL,
  `proto_autori` int(15) NOT NULL,
  `id_danfe_livro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `editoras`
--

CREATE TABLE `editoras` (
  `id_editora` int(5) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(100) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `IE` varchar(12) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dados_bancarios` varchar(100) NOT NULL,
  `id_editora_livro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `id_livros` int(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `editora` varchar(30) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `edicao` varchar(20) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `dt_publicacao` date NOT NULL,
  `nr_paginas` int(10) NOT NULL,
  `dimensoes` varchar(50) NOT NULL,
  `ISBN_10` char(10) NOT NULL,
  `ISBN_13` varchar(14) NOT NULL,
  `quantidade` int(5) NOT NULL,
  `preco` int(10) NOT NULL,
  `cod_barras` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

CREATE TABLE `setores` (
  `id_setores` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `qtd_colaboradores` int(5) NOT NULL,
  `id_setor_colab` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_vendas` int(5) NOT NULL,
  `dt_vendas` date NOT NULL,
  `valor_total` int(10) NOT NULL,
  `qtd_livro` int(5) NOT NULL,
  `id_venda_livro` int(10) NOT NULL,
  `id_venda_danfe` int(5) NOT NULL,
  `id_venda_colaborador` int(5) NOT NULL,
  `id_venda_cliente` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`),
  ADD KEY `id_autor_editora` (`id_autor_editora`),
  ADD KEY `id_autor_livro` (`id_autor_livro`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_categoria_livro` (`id_categoria_livro`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clietes`);

--
-- Índices para tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id_colaboradores`);

--
-- Índices para tabela `danfe`
--
ALTER TABLE `danfe`
  ADD PRIMARY KEY (`id_danfe`),
  ADD KEY `id_danfe_livro` (`id_danfe_livro`);

--
-- Índices para tabela `editoras`
--
ALTER TABLE `editoras`
  ADD PRIMARY KEY (`id_editora`),
  ADD KEY `id_editora_livro` (`id_editora_livro`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livros`);

--
-- Índices para tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id_setores`),
  ADD KEY `id_setor_colab` (`id_setor_colab`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `id_venda_cliente` (`id_venda_cliente`),
  ADD KEY `id_venda_colaborador` (`id_venda_colaborador`),
  ADD KEY `id_venda_danfe` (`id_venda_danfe`),
  ADD KEY `id_venda_livro` (`id_venda_livro`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clietes` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id_colaboradores` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `danfe`
--
ALTER TABLE `danfe`
  MODIFY `id_danfe` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `editoras`
--
ALTER TABLE `editoras`
  MODIFY `id_editora` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livros` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id_setores` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `autores_ibfk_1` FOREIGN KEY (`id_autor_editora`) REFERENCES `editoras` (`id_editora`),
  ADD CONSTRAINT `autores_ibfk_2` FOREIGN KEY (`id_autor_livro`) REFERENCES `livros` (`id_livros`);

--
-- Limitadores para a tabela `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`id_categoria_livro`) REFERENCES `livros` (`id_livros`);

--
-- Limitadores para a tabela `danfe`
--
ALTER TABLE `danfe`
  ADD CONSTRAINT `danfe_ibfk_1` FOREIGN KEY (`id_danfe_livro`) REFERENCES `livros` (`id_livros`);

--
-- Limitadores para a tabela `editoras`
--
ALTER TABLE `editoras`
  ADD CONSTRAINT `editoras_ibfk_1` FOREIGN KEY (`id_editora_livro`) REFERENCES `livros` (`id_livros`);

--
-- Limitadores para a tabela `setores`
--
ALTER TABLE `setores`
  ADD CONSTRAINT `setores_ibfk_1` FOREIGN KEY (`id_setor_colab`) REFERENCES `colaboradores` (`id_colaboradores`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_venda_cliente`) REFERENCES `clientes` (`id_clietes`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_venda_colaborador`) REFERENCES `colaboradores` (`id_colaboradores`),
  ADD CONSTRAINT `vendas_ibfk_3` FOREIGN KEY (`id_venda_danfe`) REFERENCES `danfe` (`id_danfe`),
  ADD CONSTRAINT `vendas_ibfk_4` FOREIGN KEY (`id_venda_livro`) REFERENCES `livros` (`id_livros`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
