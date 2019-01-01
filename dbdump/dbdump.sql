CREATE DATABASE  IF NOT EXISTS `komos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `komos`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: komos
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `idaccount` int(51) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `queued` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idaccount`)
) ENGINE=InnoDB AUTO_INCREMENT=54343003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (32432443,'Checking Account','EUR','active',2950,2950,1,1),(50889975,'Savings Account','EUR','active',6800,6800,1,2),(54343002,'Savings Account','EUR','active',10000,10000,1,3);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `total_breakdown` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `start` datetime NOT NULL,
  `stop` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `author` varchar(8) NOT NULL,
  `published` datetime NOT NULL,
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Sperrvermerk',
  `recurring` tinyint(2) DEFAULT '0',
  `day` tinyint(2) DEFAULT '0',
  `month` tinyint(2) DEFAULT '0',
  `modifiedby` varchar(8) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=MyISAM AUTO_INCREMENT=874 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparedcashout`
--

DROP TABLE IF EXISTS `preparedcashout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preparedcashout` (
  `idcashout` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `account` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcashout`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparedcashout`
--

LOCK TABLES `preparedcashout` WRITE;
/*!40000 ALTER TABLE `preparedcashout` DISABLE KEYS */;
/*!40000 ALTER TABLE `preparedcashout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `idtransaction` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `idaccount` int(50) DEFAULT NULL,
  PRIMARY KEY (`idtransaction`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (0,NULL,NULL,NULL,NULL,NULL),(1,'Direct debit (Rent)','2018-10-03 00:00:00',-350,3000,32432443),(2,'Withdraw ATM (Sudring)','2018-09-03 00:00:00',-500,3350,32432443),(3,'Deposit','2018-08-13 00:00:00',750,3850,32432443),(4,'Direct debit (Rent)','2018-08-03 00:00:00',-350,3100,32432443),(5,'Withdraw ATM (Shell)','2018-08-01 00:00:00',-350,3450,32432443),(6,'Deposit','2018-07-20 00:00:00',800,3800,32432443),(7,'Direct debit (Rent)','2018-07-13 00:00:00',-350,3000,32432443),(8,'Withdraw ATM (Gas station)','2018-07-05 00:00:00',-500,3350,32432443),(9,'Direct debit (Rent)','2018-07-03 00:00:00',-350,3850,32432443),(10,'Deposit','2018-06-15 00:00:00',800,4200,32432443),(11,'Withdraw ATM (Pad/gas)','2018-06-10 00:00:00',-400,3400,32432443),(12,'Direct debit (Rent)','2018-06-03 00:00:00',-350,3800,32432443),(13,'Withdraw ATM (Pad/gas)','2018-06-02 00:00:00',-500,4150,32432443),(14,'Direct debit (Rent)','2018-05-03 00:00:00',-350,4650,32432443),(15,'Deposit','2018-10-01 00:00:00',1000,10000,54343002),(16,'Deposit','2018-09-03 00:00:00',1000,9000,54343002),(17,'Deposit','2018-08-02 00:00:00',1000,8000,54343002),(18,'Deposit','2018-07-03 00:00:00',1000,7000,54343002),(19,'Deposit','2018-06-01 00:00:00',1000,6000,54343002),(20,'Deposit','2018-05-01 00:00:00',1000,5000,54343002),(21,'Deposit','2018-04-03 00:00:00',1000,4000,54343002),(22,'Deposit','2018-03-02 00:00:00',1000,3000,54343002),(23,'Deposit','2018-02-03 00:00:00',1000,2000,54343002),(24,'Deposit','2018-01-01 00:00:00',1000,1000,54343002),(26,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,7200,50889975),(27,'Deposit','2018-01-01 00:00:00',1000,7400,50889975),(28,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,6400,50889975),(29,'Deposit','2018-01-01 00:00:00',1000,6600,50889975),(30,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,5600,50889975),(31,'Deposit','2018-01-01 00:00:00',1000,5800,50889975),(32,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,4800,50889975),(33,'Deposit','2018-01-01 00:00:00',1000,5000,50889975),(34,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,4000,50889975),(35,'Deposit','2018-01-01 00:00:00',1000,4200,50889975),(36,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,3200,50889975),(37,'Deposit','2018-01-01 00:00:00',1000,3400,50889975),(38,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,2400,50889975),(39,'Deposit','2018-01-01 00:00:00',1000,2600,50889975),(40,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,1600,50889975),(41,'Deposit','2018-01-01 00:00:00',1000,1800,50889975),(42,'Direct Debit (Private School)','2018-02-03 00:00:00',-200,800,50889975),(43,'Deposit','2018-01-01 00:00:00',1000,1000,50889975),(44,'Withdraw ATM','0000-00-00 00:00:00',50,2950,32432443),(45,'Withdraw ATM','0000-00-00 00:00:00',50,2950,32432443),(46,'Withdraw ATM','0000-00-00 00:00:00',100,9900,54343002),(47,'Withdraw ATM','2019-01-01 12:11:31',200,7000,50889975),(48,'Withdraw ATM','2019-01-01 16:41:27',200,6800,50889975),(49,'Withdraw ATM','2019-01-01 16:43:25',50,2950,32432443);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `impairment` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'User 1','user1','user1','No','3'),(6,'Sebastian Mansfield','admin','admin','No','3'),(7,'Atm','atm','atm','No','4');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-01 17:07:22
