-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           8.0.28 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para wk_database
CREATE DATABASE IF NOT EXISTS `wk_database` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wk_database`;

-- Copiando estrutura para tabela wk_database.clientecad
CREATE TABLE IF NOT EXISTS `clientecad` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'não permite negativos',
  `nome` varchar(120) NOT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='Tabela de cadastro de clientes';

-- Copiando dados para a tabela wk_database.clientecad: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `clientecad` DISABLE KEYS */;
INSERT INTO `clientecad` (`codigo`, `nome`, `cidade`, `uf`) VALUES
	(1, 'RAFAEL HASSEGAWA', 'BELO HORIZONTE', 'MG'),
	(2, 'LISA CORREA HASSEGAWA', 'BELO HORIZONTE', 'MG'),
	(3, 'EMILIO HASSEGAWA', 'BELO HORIZONTE', 'MG'),
	(4, 'LISA MITSUE HASSEGAWA', 'SAO PAULO', 'SP'),
	(5, 'MARINA HASSEGAWA', 'BELO HORIZONTE', 'MG'),
	(6, 'DANIEL MARAMALDO', 'SAO PAULO', 'SP'),
	(7, 'FABIO RICARDO', 'BELO HORIZONTE', 'MG'),
	(8, 'PATRICIA LEITE', 'RIO DE JANEIRO', 'RJ'),
	(9, 'MARIA DO CARMO', 'VITORIA', 'ES'),
	(10, 'DANIELA AMARAL', 'BARBACENA', 'MG'),
	(11, 'CARLOS MENDO', 'SALINAS', 'MG'),
	(12, 'EDUARDO SOUZA', 'CURITIBA', 'PR'),
	(13, 'JOSE MARIA DE SOUZA', 'PORTO ALEGRE', 'RS'),
	(14, 'FABIANA NEPOMUCENO', 'JUIZ DE FORA', 'MG'),
	(15, 'CAMILA BERTOLAZZI', 'OURO BRANCO', 'MG'),
	(16, 'RICARDO VASCONCELOS', 'OSASCO', 'SP'),
	(17, 'MARCIA GONZAGA', 'RIBEIRAO PRETO', 'SP'),
	(18, 'JUSSARA SILVA', 'BELO HORIZONTE', 'MG'),
	(19, 'THIAGO SANTOS MELLO', 'BELO HORIZONTE', 'MG'),
	(20, 'JOANA RASLAN DE OLIVEIRA', 'NOVA LIMA', 'MG');
/*!40000 ALTER TABLE `clientecad` ENABLE KEYS */;

-- Copiando estrutura para tabela wk_database.itensvendacad
CREATE TABLE IF NOT EXISTS `itensvendacad` (
  `codigoItem` int unsigned NOT NULL AUTO_INCREMENT,
  `numped` int unsigned DEFAULT NULL,
  `cod_produto` int unsigned DEFAULT NULL,
  `quant_produto` int unsigned DEFAULT NULL,
  `valor_unitario` double DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  PRIMARY KEY (`codigoItem`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COMMENT='Tabela com registros dos itens de venda (itens de um pedido).';

-- Copiando dados para a tabela wk_database.itensvendacad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itensvendacad` DISABLE KEYS */;
INSERT INTO `itensvendacad` (`codigoItem`, `numped`, `cod_produto`, `quant_produto`, `valor_unitario`, `valor_total`) VALUES
	(1, 1, 12, 4, 1800, 7200),
	(2, 1, 16, 3, 2400, 7200),
	(3, 1, 17, 6, 2500, 15000),
	(4, 2, 17, 4, 2500, 10000),
	(5, 2, 15, 5, 3600.8, 18004),
	(6, 2, 14, 4, 3400, 13600),
	(7, 2, 14, 6, 3400, 20400),
	(8, 4, 16, 6, 2400, 14400),
	(9, 5, 15, 4, 3600.8, 14403.2),
	(10, 6, 20, 4, 4800, 19200),
	(11, 7, 20, 4, 4800, 19200),
	(12, 9, 6, 10, 1598, 15980),
	(13, 11, 5, 4, 1400, 5600),
	(14, 12, 4, 5, 1200.5, 6002.5),
	(15, 13, 5, 4, 1400, 5600),
	(16, 14, 15, 4, 3600.8, 14403.2),
	(17, 15, 5, 4, 1400, 5600),
	(18, 16, 3, 4, 570, 2280),
	(19, 17, 6, 4, 1500.5, 6002),
	(20, 18, 5, 6, 1400, 8400),
	(21, 19, 6, 12, 1500.5, 18006),
	(22, 20, 6, 3, 333, 999),
	(23, 21, 5, 4, 1400, 5600),
	(24, 22, 4, 5, 33, 165),
	(25, 23, 15, 3, 3600.8, 10802.4),
	(26, 24, 5, 4, 333, 1332),
	(27, 25, 5, 4, 999, 3996),
	(28, 26, 4, 5, 333, 1665),
	(29, 57, 16, 1, 2400, 2400),
	(30, 61, 2, 1, 550.8, 550.8),
	(31, 72, 18, 1, 2800, 2800),
	(32, 73, 2, 4, 550.8, 2203.2),
	(33, 73, 3, 5, 570, 2850),
	(34, 74, 19, 4, 3200, 12800),
	(35, 75, 4, 4, 1200.5, 4802),
	(36, 76, 18, 8, 2800, 22400),
	(37, 77, 5, 5, 1400, 7000),
	(38, 78, 4, 4, 1200.5, 4802);
/*!40000 ALTER TABLE `itensvendacad` ENABLE KEYS */;

-- Copiando estrutura para tabela wk_database.produtocad
CREATE TABLE IF NOT EXISTS `produtocad` (
  `codigo` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(120) NOT NULL,
  `preco_venda` double DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='Tabela de produtos';

-- Copiando dados para a tabela wk_database.produtocad: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `produtocad` DISABLE KEYS */;
INSERT INTO `produtocad` (`codigo`, `descricao`, `preco_venda`) VALUES
	(1, 'NOKIA 9250', 500.5),
	(2, 'NOKIA 9255', 550.8),
	(3, 'NOKIA 9350', 570),
	(4, 'NOKIA 1100', 1200.5),
	(5, 'SAMSUNG 9665', 1400),
	(6, 'SAMSUNG 9670', 1500.5),
	(7, 'SAMSUNG 9780', 1800),
	(8, 'SAMSUNG S800', 2450),
	(9, 'SAMSUNG S900', 2800),
	(10, 'LG 1200', 1500),
	(11, 'LG 1250', 1600.8),
	(12, 'LG 1400', 1800),
	(13, 'IPHONE 7', 3200),
	(14, 'IPHONE 8', 3400),
	(15, 'IPHONE 9', 3600.8),
	(16, 'MOTOROLA Z20', 2400),
	(17, 'MOTOROLA Z21', 2500),
	(18, 'MOTOROLA Z22', 2800),
	(19, 'MOTOROLA Z23', 3200),
	(20, 'MOTOROLA ULTRA Z21', 4800);
/*!40000 ALTER TABLE `produtocad` ENABLE KEYS */;

-- Copiando estrutura para tabela wk_database.vendascad
CREATE TABLE IF NOT EXISTS `vendascad` (
  `numped` int unsigned NOT NULL AUTO_INCREMENT,
  `dt_emissao` date DEFAULT NULL,
  `cod_cliente` int DEFAULT NULL,
  `valor_total` double unsigned DEFAULT NULL,
  PRIMARY KEY (`numped`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1 COMMENT='Tabela com registro das vendas (capa do pedido)';

-- Copiando dados para a tabela wk_database.vendascad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendascad` DISABLE KEYS */;
INSERT INTO `vendascad` (`numped`, `dt_emissao`, `cod_cliente`, `valor_total`) VALUES
	(1, '2022-03-23', 11, 29400),
	(2, '2022-03-23', 14, 62004),
	(3, '2022-03-23', NULL, NULL),
	(4, '2022-03-23', NULL, NULL),
	(5, '2022-03-23', NULL, NULL),
	(6, '2022-03-23', NULL, NULL),
	(7, '2022-03-23', NULL, NULL),
	(8, '2022-03-23', NULL, NULL),
	(9, '2022-03-23', NULL, NULL),
	(10, '2022-03-23', NULL, NULL),
	(11, '2022-03-23', NULL, NULL),
	(12, '2022-03-23', NULL, NULL),
	(13, '2022-03-23', NULL, NULL),
	(14, '2022-03-23', NULL, NULL),
	(15, '2022-03-23', NULL, NULL),
	(16, '2022-03-23', NULL, NULL),
	(17, '2022-03-23', NULL, NULL),
	(18, '2022-03-23', NULL, NULL),
	(19, '2022-03-23', NULL, NULL),
	(20, '2022-03-23', NULL, NULL),
	(21, '2022-03-23', NULL, NULL),
	(22, '2022-03-23', NULL, NULL),
	(23, '2022-03-23', NULL, NULL),
	(24, '2022-03-23', NULL, NULL),
	(25, '2022-03-23', NULL, NULL),
	(26, '2022-03-23', 2, 1665),
	(27, '2022-03-23', NULL, NULL),
	(28, '2022-03-23', NULL, NULL),
	(29, '2022-03-23', NULL, NULL),
	(30, '2022-03-23', NULL, NULL),
	(31, '2022-03-23', NULL, NULL),
	(32, '2022-03-23', NULL, NULL),
	(33, '2022-03-23', NULL, NULL),
	(34, '2022-03-23', NULL, NULL),
	(35, '2022-03-23', NULL, NULL),
	(36, '2022-03-23', NULL, NULL),
	(37, '2022-03-23', NULL, NULL),
	(38, '2022-03-23', NULL, NULL),
	(39, '2022-03-23', NULL, NULL),
	(40, '2022-03-23', NULL, NULL),
	(41, '2022-03-23', NULL, NULL),
	(42, '2022-03-23', NULL, NULL),
	(43, '2022-03-23', NULL, NULL),
	(44, '2022-03-23', NULL, NULL),
	(45, '2022-03-23', NULL, NULL),
	(46, '2022-03-23', NULL, NULL),
	(47, '2022-03-23', NULL, NULL),
	(48, '2022-03-23', NULL, NULL),
	(49, '2022-03-23', NULL, NULL),
	(50, '2022-03-23', NULL, NULL),
	(51, '2022-03-23', NULL, NULL),
	(52, '2022-03-23', NULL, NULL),
	(53, '2022-03-23', NULL, NULL),
	(54, '2022-03-23', NULL, NULL),
	(55, '2022-03-23', NULL, NULL),
	(56, '2022-03-23', NULL, NULL),
	(57, '2022-03-23', NULL, NULL),
	(58, '2022-03-23', NULL, NULL),
	(59, '2022-03-23', NULL, NULL),
	(60, '2022-03-23', NULL, NULL),
	(61, '2022-03-23', 18, 550.8),
	(62, '2022-03-23', NULL, NULL),
	(63, '2022-03-23', NULL, NULL),
	(64, '2022-03-23', NULL, NULL),
	(65, '2022-03-23', NULL, NULL),
	(66, '2022-03-23', NULL, NULL),
	(67, '2022-03-23', NULL, NULL),
	(68, '2022-03-23', NULL, NULL),
	(69, '2022-03-23', NULL, NULL),
	(70, '2022-03-23', NULL, NULL),
	(71, '2022-03-23', NULL, NULL),
	(72, '2022-03-23', NULL, NULL),
	(73, '2022-03-23', NULL, NULL),
	(74, '2022-03-23', 15, 12800),
	(75, '2022-03-23', 13, 4802),
	(76, '2022-03-23', 7, 22400),
	(77, '2022-03-23', 4, 7000),
	(78, '2022-03-23', 6, 4802);
/*!40000 ALTER TABLE `vendascad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
