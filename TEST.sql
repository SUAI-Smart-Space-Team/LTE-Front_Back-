-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: mybd
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `LTE`
--

DROP TABLE IF EXISTS `LTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LTE` (
  `IdUser` int(11) DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  `Port` varchar(20) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `lte_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LTE`
--

LOCK TABLES `LTE` WRITE;
/*!40000 ALTER TABLE `LTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoRa`
--

DROP TABLE IF EXISTS `LoRa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoRa` (
  `IdUser` int(11) DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  `Port` varchar(20) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `lora_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoRa`
--

LOCK TABLES `LoRa` WRITE;
/*!40000 ALTER TABLE `LoRa` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoRa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WiFi`
--

DROP TABLE IF EXISTS `WiFi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WiFi` (
  `IdUser` int(11) DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  `Port` varchar(20) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `wifi_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WiFi`
--

LOCK TABLES `WiFi` WRITE;
/*!40000 ALTER TABLE `WiFi` DISABLE KEYS */;
/*!40000 ALTER TABLE `WiFi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `Moment` datetime DEFAULT NULL,
  `IdUser` int(11) DEFAULT NULL,
  `Interface` varchar(255) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LTE` tinyint(1) DEFAULT '0',
  `LoRa` tinyint(1) DEFAULT '0',
  `WiFi` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21 11:58:16
