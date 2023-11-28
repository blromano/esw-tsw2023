-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: hospeda_mais
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CLI_BAIRRO` varchar(50) NOT NULL,
  `CLI_NUMERO` varchar(5) NOT NULL,
  `CLI_CIDADE` varchar(50) NOT NULL,
  `CLI_CEP` varchar(9) NOT NULL,
  `CLI_ESTADO` varchar(2) NOT NULL,
  `CLI_NOME` varchar(255) NOT NULL,
  `CLI_CPF` char(11) DEFAULT NULL,
  `CLI_RG` varchar(255) DEFAULT NULL,
  `CLI_NASCIMENTO` date NOT NULL,
  `CLI_CELULAR` varchar(15) DEFAULT NULL,
  `CLI_EMAIL` varchar(100) DEFAULT NULL,
  `CLI_SEXO` enum('M','F','I') NOT NULL,
  `CLI_SENHA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `CLI_CPF` (`CLI_CPF`),
  UNIQUE KEY `CLI_RG` (`CLI_RG`),
  UNIQUE KEY `CLI_CELULAR` (`CLI_CELULAR`),
  UNIQUE KEY `CLI_EMAIL` (`CLI_EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jd. Lucas Teixeira','763','São João da Boa Vista','13876-854','SP','Petrik da Cunha Farbo','123.456.789','123456789','2000-10-27','19988811071','petrikfarbo@gmail.com','M','202cb962ac59075b964b07152d234b70'),(2,'Jd. das Rosas','123','São João da Boa Vista','13805-669','SP','Jennifer Kesia da Silva Ferreira','123.456.998','987563210','1999-08-14','19988131028','jennifer@gmail.com','F','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `ID_FEEDBACK` int(11) NOT NULL AUTO_INCREMENT,
  `FK_CLIENTES_ID_CLIENTE` int(11) NOT NULL,
  `FEE_COMENTARIO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_FEEDBACK`),
  KEY `FK_FEEDBACKS_2` (`FK_CLIENTES_ID_CLIENTE`),
  CONSTRAINT `FK_FEEDBACKS_2` FOREIGN KEY (`FK_CLIENTES_ID_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `ID_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `FUN_NOME` varchar(255) NOT NULL,
  `FUN_CPF` char(11) DEFAULT NULL,
  `FUN_RG` varchar(255) DEFAULT NULL,
  `FUN_BAIRRO` varchar(50) NOT NULL,
  `FUN_NUMERO` varchar(5) NOT NULL,
  `FUN_CIDADE` varchar(50) NOT NULL,
  `FUN_CEP` varchar(9) NOT NULL,
  `FUN_ESTADO` varchar(2) NOT NULL,
  `FUN_SEXO` enum('M','F','I') NOT NULL,
  `FUN_SENHA` varchar(100) NOT NULL,
  `FUN_EMAIL` varchar(100) DEFAULT NULL,
  `FUN_CELULAR` varchar(15) DEFAULT NULL,
  `FUN_NASCIMENTO` date NOT NULL,
  `FUN_TIPO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`),
  UNIQUE KEY `FUN_CPF` (`FUN_CPF`),
  UNIQUE KEY `FUN_RG` (`FUN_RG`),
  UNIQUE KEY `FUN_EMAIL` (`FUN_EMAIL`),
  UNIQUE KEY `FUN_CELULAR` (`FUN_CELULAR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Teste Funcionario','123.456.789','204567890','Jd. Madalena','777','São João da Boa Vista','13876-854','SP','M','c6f057b86584942e415435ffb1fa93d4','teste@gmail.com','1998881100','2000-10-27','Administrador');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limpezas`
--

DROP TABLE IF EXISTS `limpezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limpezas` (
  `ID_LIMPEZA` int(11) NOT NULL AUTO_INCREMENT,
  `FK_FUNCIONARIOS_ID_FUNCIONARIO` int(11) NOT NULL,
  `FK_QUARTOS_ID_QUARTO` int(11) NOT NULL,
  `LIM_LIMPO` tinyint(1) NOT NULL,
  `LIM_NOME_TAREFA` varchar(50) NOT NULL,
  `LIM_DATA_TAREFA` datetime NOT NULL,
  PRIMARY KEY (`ID_LIMPEZA`),
  KEY `FK_LIMPEZAS_2` (`FK_FUNCIONARIOS_ID_FUNCIONARIO`),
  KEY `FK_LIMPEZAS_3` (`FK_QUARTOS_ID_QUARTO`),
  CONSTRAINT `FK_LIMPEZAS_2` FOREIGN KEY (`FK_FUNCIONARIOS_ID_FUNCIONARIO`) REFERENCES `funcionarios` (`ID_FUNCIONARIO`),
  CONSTRAINT `FK_LIMPEZAS_3` FOREIGN KEY (`FK_QUARTOS_ID_QUARTO`) REFERENCES `quartos` (`ID_QUARTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limpezas`
--

LOCK TABLES `limpezas` WRITE;
/*!40000 ALTER TABLE `limpezas` DISABLE KEYS */;
/*!40000 ALTER TABLE `limpezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `PAG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FK_RESERVAS_ID_RESERVA` int(11) NOT NULL,
  `PAG_VALOR_TOTAL` decimal(6,2) NOT NULL,
  `PAG_VALOR_PEDIDO` decimal(6,2) NOT NULL,
  `PAG_METODO` varchar(25) NOT NULL,
  PRIMARY KEY (`PAG_ID`),
  KEY `FK_PAGAMENTOS_2` (`FK_RESERVAS_ID_RESERVA`),
  CONSTRAINT `FK_PAGAMENTOS_2` FOREIGN KEY (`FK_RESERVAS_ID_RESERVA`) REFERENCES `reservas` (`ID_RESERVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_PEDIDOS` int(11) NOT NULL AUTO_INCREMENT,
  `FK_PRODUTOS_PRD_ID` int(11) NOT NULL,
  `FK_RESERVAS_ID_RESERVA` int(11) NOT NULL,
  `PED_VALOR` decimal(6,2) NOT NULL,
  `PED_QTD` int(11) NOT NULL,
  PRIMARY KEY (`ID_PEDIDOS`),
  KEY `FK_PEDIDOS_2` (`FK_PRODUTOS_PRD_ID`),
  KEY `FK_PEDIDOS_3` (`FK_RESERVAS_ID_RESERVA`),
  CONSTRAINT `FK_PEDIDOS_2` FOREIGN KEY (`FK_PRODUTOS_PRD_ID`) REFERENCES `produtos` (`PRD_ID`),
  CONSTRAINT `FK_PEDIDOS_3` FOREIGN KEY (`FK_RESERVAS_ID_RESERVA`) REFERENCES `reservas` (`ID_RESERVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `PRD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRD_NOME` varchar(25) NOT NULL,
  `PRD_PRECO` decimal(6,2) NOT NULL,
  `PRD_QUANTIDADE` int(11) NOT NULL,
  PRIMARY KEY (`PRD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartos`
--

DROP TABLE IF EXISTS `quartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quartos` (
  `ID_QUARTO` int(11) NOT NULL,
  `QRT_CAPACIDADE` int(11) NOT NULL,
  `QRT_TIPO_CAMA` varchar(80) NOT NULL,
  `QRT_DISPONIVEL` tinyint(1) DEFAULT 1,
  `QRT_PRECO_DIARIA` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID_QUARTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartos`
--

LOCK TABLES `quartos` WRITE;
/*!40000 ALTER TABLE `quartos` DISABLE KEYS */;
INSERT INTO `quartos` VALUES (3,2,'Solteiro',1,1.00),(231,2,'King',1,32.00),(321,2,'Queen',0,121.00),(763,2,'King',0,320.00),(12355,2,'Solteiro',1,32.00);
/*!40000 ALTER TABLE `quartos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `ID_RESERVA` int(11) NOT NULL AUTO_INCREMENT,
  `FK_QUARTOS_ID_QUARTO` int(11) NOT NULL,
  `FK_CLIENTES_ID_CLIENTE` int(11) NOT NULL,
  `RES_CHECKIN` datetime NOT NULL,
  `RES_QTD_HOSPEDES` int(11) NOT NULL,
  `RES_CHECKOUT` datetime NOT NULL,
  PRIMARY KEY (`ID_RESERVA`),
  KEY `FK_RESERVAS_2` (`FK_QUARTOS_ID_QUARTO`),
  KEY `FK_RESERVAS_3` (`FK_CLIENTES_ID_CLIENTE`),
  CONSTRAINT `FK_RESERVAS_2` FOREIGN KEY (`FK_QUARTOS_ID_QUARTO`) REFERENCES `quartos` (`ID_QUARTO`),
  CONSTRAINT `FK_RESERVAS_3` FOREIGN KEY (`FK_CLIENTES_ID_CLIENTE`) REFERENCES `clientes` (`ID_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospeda_mais'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 18:51:12
