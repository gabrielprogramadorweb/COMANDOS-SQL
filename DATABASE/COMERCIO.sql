-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 29-Dez-2023 às 15:28
-- Versão do servidor: 5.7.22
-- versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `COMERCIO`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `IDCLIENTE` int(11) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  `SEXO` enum('M','F') NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `CPF` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CLIENTE`
--

INSERT INTO `CLIENTE` (`IDCLIENTE`, `NOME`, `SEXO`, `EMAIL`, `CPF`) VALUES
(1, 'Gabriel', 'M', 'gabriel@gmail.com', '874873273827'),
(2, 'Carla', 'F', 'carla@gmail.com', '34343432464'),
(3, 'Maria', 'F', 'maria@gmail.com', '34464222376'),
(4, 'Pedro', 'M', 'pedro@gmail.com', '56579879766'),
(5, 'Davi', 'M', 'davi@gmail.com', '76766775657'),
(6, 'João', 'M', 'joao@gmail.com', '88989765656');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ENDERECO`
--

CREATE TABLE `ENDERECO` (
  `IDENDERECO` int(11) NOT NULL,
  `RUA` varchar(30) NOT NULL,
  `BAIRRO` varchar(30) NOT NULL,
  `CIDADE` varchar(30) NOT NULL,
  `ESTADO` char(2) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ENDERECO`
--

INSERT INTO `ENDERECO` (`IDENDERECO`, `RUA`, `BAIRRO`, `CIDADE`, `ESTADO`, `ID_CLIENTE`) VALUES
(1, 'Rui barata', 'Parque Guajará', 'Belém', 'PA', 1),
(2, 'Rua da paz', 'Parque verde', 'São Paulo', 'SP', 2),
(3, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 4),
(6, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 3),
(10, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 6),
(11, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `PRODUTO`
--

CREATE TABLE `PRODUTO` (
  `PESO2` float(10,2) NOT NULL,
  `IDPRODUTO` int(11) NOT NULL,
  `NOME_PRODUTO` varchar(30) NOT NULL,
  `PESO` float(10,2) NOT NULL,
  `VALOR_UNITARIO` int(11) NOT NULL,
  `FRETE` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TELEFONE`
--

CREATE TABLE `TELEFONE` (
  `IDTELEFONE` int(11) NOT NULL,
  `TIPO` enum('RES','COM','CEL') NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `TELEFONE`
--

INSERT INTO `TELEFONE` (`IDTELEFONE`, `TIPO`, `NUMERO`, `ID_CLIENTE`) VALUES
(1, 'CEL', '78458743', 5),
(2, 'RES', '56576876', 5),
(3, 'CEL', '87866896', 1),
(4, 'COM', '54768899', 2),
(5, 'RES', '99667587', 1),
(6, 'CEL', '78989765', 3),
(7, 'CEL', '99766676', 3),
(8, 'COM', '66687899', 1),
(9, 'RES', '89986668', 5),
(10, 'CEL', '88687909', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`IDCLIENTE`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `ENDERECO`
--
ALTER TABLE `ENDERECO`
  ADD PRIMARY KEY (`IDENDERECO`),
  ADD UNIQUE KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Índices para tabela `PRODUTO`
--
ALTER TABLE `PRODUTO`
  ADD PRIMARY KEY (`IDPRODUTO`);

--
-- Índices para tabela `TELEFONE`
--
ALTER TABLE `TELEFONE`
  ADD PRIMARY KEY (`IDTELEFONE`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `IDCLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `ENDERECO`
--
ALTER TABLE `ENDERECO`
  MODIFY `IDENDERECO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `PRODUTO`
--
ALTER TABLE `PRODUTO`
  MODIFY `IDPRODUTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TELEFONE`
--
ALTER TABLE `TELEFONE`
  MODIFY `IDTELEFONE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ENDERECO`
--
ALTER TABLE `ENDERECO`
  ADD CONSTRAINT `ENDERECO_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`);

--
-- Limitadores para a tabela `TELEFONE`
--
ALTER TABLE `TELEFONE`
  ADD CONSTRAINT `TELEFONE_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
