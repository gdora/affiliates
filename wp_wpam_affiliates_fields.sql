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
-- Table structure for table `wp_wpam_affiliates_fields`
--

DROP TABLE IF EXISTS `wp_wpam_affiliates_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpam_affiliates_fields` (
  `affiliateFieldId` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('base','custom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` int(11) NOT NULL,
  `fieldType` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `databaseField` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  PRIMARY KEY (`affiliateFieldId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpam_affiliates_fields`
--

LOCK TABLES `wp_wpam_affiliates_fields` WRITE;
/*!40000 ALTER TABLE `wp_wpam_affiliates_fields` DISABLE KEYS */;
INSERT INTO `wp_wpam_affiliates_fields` VALUES (1,'base','First Name',50,'string',1,'firstName',1,0),(2,'base','Last Name',50,'string',1,'lastName',1,1),(3,'base','E-Mail Address',0,'email',1,'email',1,3),(4,'base','Address Line 1',255,'string',1,'addressLine1',1,4),(5,'base','Address Line 2',255,'string',0,'addressLine2',1,5),(6,'base','City',128,'string',1,'addressCity',1,6),(7,'base','State',0,'stateCode',1,'addressState',1,7),(8,'base','Zip Code',0,'zipCode',1,'addressZipCode',1,8),(9,'base','Country',0,'countryCode',1,'addressCountry',1,9),(10,'base','Company Name',50,'string',0,'companyName',0,10),(11,'base','Website URL',255,'string',0,'websiteUrl',0,11),(12,'base','Phone Number',0,'phoneNumber',1,'phoneNumber',1,2),(13,'base','Broker Accounts',500,'string',0,'broker_accounts',0,12),(17,'base','User type',0,'partner',0,'partner',1,13),(18,'base','Partner',0,'partner_id',0,'partner_id',1,14);
/*!40000 ALTER TABLE `wp_wpam_affiliates_fields` ENABLE KEYS */;
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
