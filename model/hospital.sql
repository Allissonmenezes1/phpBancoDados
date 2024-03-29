-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2019 às 00:22
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6
--
-- Database: `hospital`
--
-- --------------------------------------------------------
--
-- Estrutura da tabela `ala`
--
CREATE TABLE `ala` (
  `id_ala` int(11) NOT NULL,
  `fk_id_hospital` int(11) NOT NULL,
  `fk_id_especialidade` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `quant_leitos` int(11) DEFAULT '1'
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
--
-- Estrutura da tabela `doenca`
--
CREATE TABLE `doenca` (
  `id_doenca` int(11) NOT NULL,
  `doenca` varchar(50) NOT NULL,
  `nome_cientifico` varchar(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
--
-- Estrutura da tabela `endereco`
--
CREATE TABLE `endereco` (
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Extraindo dados da tabela `endereco`
--
INSERT INTO `endereco` (`cep`, `logradouro`, `bairro`, `cidade`, `uf`)
VALUES
  (
    '23520-120',
    'Rua Antenor',
    'Santa Cruz',
    'Rio de Janeiro',
    'RJ'
  );
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `especialidade`
  --
  CREATE TABLE `especialidade` (
    `id_especialidade` int(11) NOT NULL,
    `especialidade` varchar(50) NOT NULL,
    `valor_dia` decimal(12, 2) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `funcionario`
  --
  CREATE TABLE `funcionario` (
    `id_funcionario` int(11) NOT NULL,
    `fk_id_hospital` int(11) NOT NULL,
    `fk_cep` varchar(9) NOT NULL,
    `nome` varchar(100) NOT NULL,
    `data_nasc` date NOT NULL,
    `cpf` int(11) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `hospital`
  --
  CREATE TABLE `hospital` (
    `id_hospital` int(11) NOT NULL,
    `nome` varchar(100) NOT NULL,
    `fk_cep` varchar(9) NOT NULL,
    `numero` varchar(100) NOT NULL,
    `complemento` varchar(100) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `lista_paciente`
  --
  CREATE TABLE `lista_paciente` (
    `fk_id_doenca` int(11),
    `fk_id_paciente` int(11)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `medico`
  --
  CREATE TABLE `medico` (
    `fk_funcionario` int(11) NOT NULL,
    `crm` varchar(50) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `paciente`
  --
  CREATE TABLE `paciente` (
    `id_paciente` int(11) NOT NULL,
    `fk_id_ala` int(11) DEFAULT NULL,
    `fk_id_sexo` int(11) DEFAULT NULL,
    `fk_cep` varchar(9) DEFAULT NULL,
    `nome` varchar(100) DEFAULT NULL,
    `email` varchar(100) DEFAULT NULL,
    `cpf` int(11) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura da tabela `sexo`
  --
  CREATE TABLE `sexo` (
    `id_sexo` int(11) NOT NULL,
    `sexo` varchar(100) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Indexes for dumped tables
  --
  --
  -- Indexes for table `ala`
  --
ALTER TABLE `ala`
ADD
  PRIMARY KEY (`id_ala`),
ADD
  KEY `hospital` (`fk_id_hospital`),
ADD
  KEY `especialidade` (`fk_id_especialidade`);
--
  -- Indexes for table `doenca`
  --
ALTER TABLE `doenca`
ADD
  PRIMARY KEY (`id_doenca`);
--
  -- Indexes for table `endereco`
  --
ALTER TABLE `endereco`
ADD
  PRIMARY KEY (`cep`);
--
  -- Indexes for table `especialidade`
  --
ALTER TABLE `especialidade`
ADD
  PRIMARY KEY (`id_especialidade`);
--
  -- Indexes for table `funcionario`
  --
ALTER TABLE `funcionario`
ADD
  PRIMARY KEY (`id_funcionario`),
ADD
  UNIQUE KEY `cpf` (`cpf`),
ADD
  KEY `fk_id_hospital` (`fk_id_hospital`),
ADD
  KEY `fk_cep` (`fk_cep`);
--
  -- Indexes for table `hospital`
  --
ALTER TABLE `hospital`
ADD
  PRIMARY KEY (`id_hospital`),
ADD
  KEY `fk_cep` (`fk_cep`);
--
  -- Indexes for table `lista_paciente`
  --
ALTER TABLE `lista_paciente`
ADD
  KEY `FK_id_doenca` (`fk_id_doenca`),
ADD
  KEY `FK_id_paciente` (`fk_id_paciente`);
--
  -- Indexes for table `medico`
  --
ALTER TABLE `medico`
ADD
  KEY `fk_funcionario` (`fk_funcionario`);
--
  -- Indexes for table `paciente`
  --
ALTER TABLE `paciente`
ADD
  PRIMARY KEY (`id_paciente`),
ADD
  UNIQUE KEY `cpf` (`cpf`),
ADD
  UNIQUE KEY `email` (`email`),
ADD
  KEY `cep` (`fk_cep`),
ADD
  KEY `ala` (`fk_id_ala`),
ADD
  KEY `sexo` (`fk_id_sexo`);
--
  -- Indexes for table `sexo`
  --
ALTER TABLE `sexo`
ADD
  PRIMARY KEY (`id_sexo`);
--
  -- AUTO_INCREMENT for dumped tables
  --
  --
  -- AUTO_INCREMENT for table `especialidade`
  --
ALTER TABLE `especialidade`
MODIFY
  `id_especialidade` int(11) NOT NULL AUTO_INCREMENT;
--
  -- AUTO_INCREMENT for table `funcionario`
  --
ALTER TABLE `funcionario`
MODIFY
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;
--
  -- AUTO_INCREMENT for table `hospital`
  --
ALTER TABLE `hospital`
MODIFY
  `id_hospital` int(11) NOT NULL AUTO_INCREMENT;
--
  -- AUTO_INCREMENT for table `sexo`
  --
ALTER TABLE `sexo`
MODIFY
  `id_sexo` int(11) NOT NULL AUTO_INCREMENT;
--
  -- Constraints for dumped tables
  --
  --
  -- Limitadores para a tabela `ala`
  --
ALTER TABLE `ala`
ADD
  CONSTRAINT `especialidade` FOREIGN KEY (`fk_id_especialidade`) REFERENCES `especialidade` (`id_especialidade`),
ADD
  CONSTRAINT `hospital` FOREIGN KEY (`fk_id_hospital`) REFERENCES `hospital` (`id_hospital`);
--
  -- Limitadores para a tabela `funcionario`
  --
ALTER TABLE `funcionario`
ADD
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`fk_id_hospital`) REFERENCES `hospital` (`id_hospital`),
ADD
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`);
--
  -- Limitadores para a tabela `hospital`
  --
ALTER TABLE `hospital`
ADD
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`);
--
  -- Limitadores para a tabela `lista_paciente`
  --
ALTER TABLE `lista_paciente`
ADD
  CONSTRAINT `FK_id_doenca` FOREIGN KEY (`fk_id_doenca`) REFERENCES `doenca` (`id_doenca`),
ADD
  CONSTRAINT `FK_id_paciente` FOREIGN KEY (`fk_id_paciente`) REFERENCES `paciente` (`id_paciente`);
--
  -- Limitadores para a tabela `medico`
  --
ALTER TABLE `medico`
ADD
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`fk_funcionario`) REFERENCES `funcionario` (`id_funcionario`);
--
  -- Limitadores para a tabela `paciente`
  --
ALTER TABLE `paciente`
ADD
  CONSTRAINT `ala` FOREIGN KEY (`fk_id_ala`) REFERENCES `ala` (`id_ala`),
ADD
  CONSTRAINT `cep` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`),
ADD
  CONSTRAINT `sexo` FOREIGN KEY (`fk_id_sexo`) REFERENCES `sexo` (`id_sexo`);
COMMIT;