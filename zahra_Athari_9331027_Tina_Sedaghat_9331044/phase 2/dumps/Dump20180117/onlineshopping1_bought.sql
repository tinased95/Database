CREATE DATABASE  IF NOT EXISTS `onlineshopping1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlineshopping1`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshopping1
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `bought`
--

DROP TABLE IF EXISTS `bought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bought` (
  `BoughtID` int(11) NOT NULL,
  `CostumerID` int(11) DEFAULT NULL,
  `UtilityTotalCost` int(11) DEFAULT NULL,
  `UtilityTotalTax` int(11) DEFAULT NULL,
  `BoughtDateTime` datetime DEFAULT NULL,
  `PayStatus` varchar(45) DEFAULT NULL,
  `CostumerCity` varchar(45) DEFAULT NULL,
  `CostumerStreet` varchar(45) DEFAULT NULL,
  `CostumerPelak` varchar(45) DEFAULT NULL,
  `BoughtStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BoughtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bought`
--

LOCK TABLES `bought` WRITE;
/*!40000 ALTER TABLE `bought` DISABLE KEYS */;
INSERT INTO `bought` VALUES (5001,112,1,1,'2017-10-19 00:00:00','1','tehran','yas','12','readytodeliever'),(5002,112,2,2,'2017-09-22 00:00:00','1','tehran','lavasan','3','transporting'),(5003,113,3,3,'2017-10-02 00:00:00','2','rasht','valieasr','5','delivered'),(5004,116,4,4,'2009-12-11 00:00:00','2','tehran','farmanie','114','notdelivered'),(5005,118,5,5,'2001-08-10 00:00:00','1','tehran','taleghani','56','readytodeliever'),(5006,119,5,5,'2001-01-11 00:00:00','1','shiraz','sadi','6','readytodeliever'),(5007,120,5,5,'2001-08-15 00:00:00','1','shiraz','taleghani','9','readytodeliever'),(5008,2001,5,5,'2017-10-15 00:00:00','1','gilan','bahar','921','readytodeliever'),(5009,2002,5,5,'2017-10-15 00:00:00','1','gilan','hafez','2','delivered'),(5010,2003,5,5,'2001-08-15 00:00:00','1','gilan','safayi','3','transporting'),(5011,2007,5,5,'2017-10-15 00:00:00','1','gilan','yas','4','transporting'),(5012,2007,5,5,'2001-10-15 00:00:00','1','gilan','rasht','55','transporting'),(5013,2004,5,5,'2017-10-15 00:00:00','1','gilan','saedi','6','transporting');
/*!40000 ALTER TABLE `bought` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-17  9:40:25
