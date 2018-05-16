-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: races
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `Races`
--

DROP TABLE IF EXISTS `Races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Races` (
  `race_id` varchar(60) NOT NULL,
  `date` int(8) NOT NULL,
  `start_time` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `locatio` varchar(60) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Races`
--

LOCK TABLES `Races` WRITE;
/*!40000 ALTER TABLE `Races` DISABLE KEYS */;
INSERT INTO `Races` VALUES ('29-5',20180514,'11:00 PM','Fallout','Mile Marker 29 Route 30 77086'),('PINE1',20180501,'10:00 PM','Dipper','Pine and 40th 76587'),('TBD-48',20191031,'1:00 AM','whoknows','TBD');
/*!40000 ALTER TABLE `Races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `race_id` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES ('29-5','Active'),('PINE1','Active'),('TBD-48','Active');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-16 20:33:55
