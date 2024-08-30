-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tcc
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `nomeAdmin` varchar(50) NOT NULL,
  `emailAdmin` varchar(100) NOT NULL,
  `senhaAdmin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `idAvaliacao` int NOT NULL AUTO_INCREMENT,
  `notaAvaliacao` int NOT NULL,
  `comentarioAvaliacao` text NOT NULL,
  `idUsuario` int NOT NULL,
  `idConteudo` int NOT NULL,
  `dataAvaliacao` datetime NOT NULL,
  PRIMARY KEY (`idAvaliacao`),
  KEY `fk_avaliacoes_usuarios_idx` (`idUsuario`),
  KEY `fk_avaliacoes_conteudo1_idx` (`idConteudo`),
  CONSTRAINT `fk_avaliacoes_conteudo1` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`),
  CONSTRAINT `fk_avaliacoes_usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudo` (
  `idConteudo` int NOT NULL AUTO_INCREMENT,
  `tituloConteudo` varchar(200) NOT NULL,
  `descricaoConteudo` text NOT NULL,
  `generoConteudo` varchar(20) NOT NULL,
  `anoConteudo` year NOT NULL,
  `tipoConteudo` varchar(1) NOT NULL,
  `avaliacaoConteudo` int NOT NULL,
  PRIMARY KEY (`idConteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo`
--

LOCK TABLES `conteudo` WRITE;
/*!40000 ALTER TABLE `conteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicoavaliacao`
--

DROP TABLE IF EXISTS `historicoavaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicoavaliacao` (
  `idHistorico` int NOT NULL AUTO_INCREMENT,
  `dataAvaliacao` datetime DEFAULT NULL,
  `idUsuario` int NOT NULL,
  `idConteudo` int NOT NULL,
  PRIMARY KEY (`idHistorico`),
  KEY `fk_historicoAvaliacao_usuarios1_idx` (`idUsuario`),
  KEY `fk_historicoAvaliacao_conteudo1_idx` (`idConteudo`),
  CONSTRAINT `fk_historicoAvaliacao_conteudo1` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`),
  CONSTRAINT `fk_historicoAvaliacao_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicoavaliacao`
--

LOCK TABLES `historicoavaliacao` WRITE;
/*!40000 ALTER TABLE `historicoavaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicoavaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferenciasusuario`
--

DROP TABLE IF EXISTS `preferenciasusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferenciasusuario` (
  `idPreferencia` int NOT NULL AUTO_INCREMENT,
  `generoPreferencia` varchar(45) NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idPreferencia`),
  KEY `fk_preferenciasUsuario_usuarios1_idx` (`idUsuario`),
  CONSTRAINT `fk_preferenciasUsuario_usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferenciasusuario`
--

LOCK TABLES `preferenciasusuario` WRITE;
/*!40000 ALTER TABLE `preferenciasusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferenciasusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nomeUsuario` varchar(50) NOT NULL,
  `emailUsuario` varchar(80) NOT NULL,
  `senhaUsuario` varchar(25) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 21:38:41
