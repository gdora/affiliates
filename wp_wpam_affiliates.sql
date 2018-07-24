-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wp
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_wpam_affiliates`
--

DROP TABLE IF EXISTS `wp_wpam_affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpam_affiliates` (
  `affiliateId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressCity` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressState` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressZipCode` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressCountry` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('applied','declined','approved','active','inactive','confirmed','blocked') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `companyName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `websiteUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uniqueRefKey` char(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '<none>',
  `nameOnCheck` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypalEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentMethod` enum('paypal','check','manual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bountyType` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bountyAmount` decimal(18,2) DEFAULT NULL,
  `phoneNumber` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userData` text COLLATE utf8mb4_unicode_ci,
  `broker_accounts` text COLLATE utf8mb4_unicode_ci,
  `partner` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`affiliateId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpam_affiliates`
--

LOCK TABLES `wp_wpam_affiliates` WRITE;
/*!40000 ALTER TABLE `wp_wpam_affiliates` DISABLE KEYS */;
INSERT INTO `wp_wpam_affiliates` VALUES (4,1,'gabor','dora','gabor.dora@gmail.com','Susogó utca 2','','Budapest','BP','1125','HU','active','2018-07-16 13:19:04','','','dHUxBM7MgVUDPmACF1lwtk4NdK2',NULL,'','check','percent',25.00,'+36703619823','a:0:{}',NULL,NULL,NULL),(6,3,'Teszt','Elek','gabor.dora@vodafone.com','Susogu u. 2/b','','Budapest','BP','1125','HU','active','2018-07-17 10:17:20','','','lA8tqiQtAsPVbK9R-qOhtEbWiJ0',NULL,NULL,NULL,'percent',25.00,'234234','a:0:{}',NULL,1,0),(7,4,'Gipsz','Jakab','gipszjakab@kukac.kuk','Susogó utca 2','','Budapest','BO','2234','HU','active','2018-07-17 11:20:58','','','XOhSAcBiJK13KT8GkdW9ttCQvk6',NULL,NULL,NULL,'percent',10.00,'23423432','a:0:{}',NULL,0,4),(8,5,'Like a','Boss','likeaboss@kukac.ka','Main 1','','New York','BP','1125','HU','active','2018-07-17 11:22:02','','','jeYSabiI0uzcnJWSxpBlpNzkTc2',NULL,NULL,NULL,'percent',30.00,'23423423','a:0:{}',NULL,1,0),(9,6,'Kakukk','Béla','dora.gabor@uptime.hu','Váci út 666','','Budapest','BP','11111','HU','active','2018-07-17 13:22:55','','','lgZyVgNplzct3rwI8,7PXPVpTSd',NULL,'','check','percent',25.00,'123123','a:0:{}','[{\"name\":\"wdfweqfd\",\"id\":\"sadfsadf\",\"type\":\"nem tudom\"}]',0,8);
/*!40000 ALTER TABLE `wp_wpam_affiliates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19 17:06:44
