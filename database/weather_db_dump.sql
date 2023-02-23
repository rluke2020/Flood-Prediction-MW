CREATE DATABASE  IF NOT EXISTS `weather_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `weather_db`;
-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: weather_db
-- ------------------------------------------------------
-- Server version	5.7.41-0ubuntu0.18.04.1

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
-- Table structure for table `district_rivers`
--

DROP TABLE IF EXISTS `district_rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district_rivers` (
  `district_id` int(11) NOT NULL,
  `river_id` int(11) NOT NULL,
  `elevation` int(11) NOT NULL,
  `distance_from_river` decimal(10,2) NOT NULL,
  PRIMARY KEY (`district_id`,`river_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `district_rivers_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `district_rivers_ibfk_2` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`river_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_rivers`
--

LOCK TABLES `district_rivers` WRITE;
/*!40000 ALTER TABLE `district_rivers` DISABLE KEYS */;
INSERT INTO `district_rivers` VALUES (1,1,1936,92.28),(1,2,1936,43.65),(2,3,2861,16.84),(2,4,2861,37.14),(2,5,2861,57.49),(2,6,2861,57.49),(2,7,2861,21.01),(3,8,1109,101.86),(4,9,3006,57.49),(5,10,3881,70.83),(6,11,3192,57.49),(7,12,3980,37.63),(7,13,3980,28.82),(8,10,3291,19.39),(8,14,3291,57.49),(9,13,3458,69.43),(9,15,3458,57.49),(9,16,3458,57.49),(10,12,3619,55.76),(10,17,1698,0.64),(11,12,3619,55.76),(12,8,2159,37.39),(12,18,2159,25.48),(13,8,2385,78.53),(14,19,3576,57.49),(15,20,2520,32.95),(15,21,2520,15.37),(15,22,2520,11.14),(16,8,2157,64.60),(17,23,3219,57.49),(17,24,3219,127.67),(18,25,2247,57.49),(19,10,2192,165.08),(19,17,2192,57.49),(19,31,2192,149.37),(20,27,2852,23.11),(20,28,2852,36.22),(21,8,564,163.41),(22,29,3154,57.49),(23,11,4027,57.49),(24,3,2060,65.77),(24,4,2060,84.02),(24,21,2060,33.36),(25,30,4275,57.49),(25,31,4275,94.80),(25,32,4275,57.49),(26,12,2034,1.87),(27,20,2339,21.32),(27,22,2339,34.78),(27,33,2339,79.40),(27,34,2339,57.49),(27,35,2339,60.11),(28,3,2920,53.88),(28,4,2920,72.12),(28,21,2920,61.28),(28,36,2920,55.35);
/*!40000 ALTER TABLE `district_rivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  `longitude` decimal(10,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `urban_population` int(11) NOT NULL,
  `land_area` decimal(10,2) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Balaka',34.97000000,-15.00360000,474026,142316.00),(2,'Blantyre',34.99000000,-15.78430000,840616,785339.00),(3,'Chikwawa',34.76000000,-16.03520000,599844,878437.00),(4,'Chiradzulu',35.27000000,-15.68990000,375460,604356.00),(5,'Chitipa',33.62000000,-9.70120000,246439,334176.00),(6,'Dedza',34.05000000,-14.38380000,884146,754625.00),(7,'Dowa',33.77000000,-13.67440000,830543,77559.00),(8,'Karonga',33.90000000,-9.95460000,386717,416264.00),(9,'Kasungu',33.47000000,-13.03630000,901545,416264.00),(10,'Likoma',34.74000000,-12.05310000,15316,71414.00),(11,'Lilongwe',34.74000000,-12.05310000,1081720,532989.00),(12,'Machinga',33.77000000,-13.98990000,809245,582494.00),(13,'Mangochi',35.53000000,-15.09250000,1254609,729796.00),(14,'Mchinji',35.24000000,-14.47590000,640950,131454.00),(15,'Mulanje',33.92000000,-13.79070000,728962,5523.00),(16,'Mwanza',35.52000000,-16.02960000,142481,237130.00),(17,'Mzimba',34.52000000,-15.60380000,982390,473718.00),(18,'Neno',35.25000000,-15.56830000,146530,561108.00),(19,'Nkhata Bay',34.22000000,-11.60830000,298235,182215.00),(20,'Nkhotakota',34.03000000,-12.92690000,417398,338299.00),(21,'Nsanje',34.94000000,-16.69650000,314744,945241.00),(22,'Ntcheu',34.03000000,-14.79520000,711580,251471.00),(23,'Ntchisi',33.93000000,-13.36160000,343651,709222.00),(24,'Phalombe',35.59000000,-15.80870000,462502,323315.00),(25,'Rumphi',33.86000000,-11.02220000,242541,560166.00),(26,'Salima',34.46000000,-13.78880000,517513,666590.00),(27,'Thyolo',35.12000000,-16.08420000,756048,666590.00),(28,'Zomba',35.33000000,-15.39070000,793314,501105.00);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flooding`
--

DROP TABLE IF EXISTS `flooding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flooding` (
  `flood_id` int(32) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `flooding` int(11) NOT NULL,
  PRIMARY KEY (`flood_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `flooding_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flooding`
--

LOCK TABLES `flooding` WRITE;
/*!40000 ALTER TABLE `flooding` DISABLE KEYS */;
INSERT INTO `flooding` VALUES (1,1,2019,1),(2,1,2020,0),(3,1,2021,1),(4,1,2022,1),(5,2,2019,0),(6,2,2020,0),(7,2,2021,1),(8,2,2022,1),(9,3,2019,1),(10,3,2020,0),(11,3,2021,1),(12,3,2022,1),(13,4,2019,0),(14,4,2020,0),(15,4,2021,1),(16,4,2022,1),(17,5,2019,0),(18,5,2020,0),(19,5,2021,0),(20,5,2022,1),(21,6,2019,0),(22,6,2020,0),(23,6,2021,0),(24,6,2022,1),(25,7,2019,0),(26,7,2020,0),(27,7,2021,0),(28,7,2022,1),(29,8,2019,1),(30,8,2020,0),(31,8,2021,0),(32,8,2022,1),(33,9,2019,0),(34,9,2020,0),(35,9,2021,0),(36,9,2022,1),(37,10,2019,0),(38,10,2020,0),(39,10,2021,0),(40,10,2022,1),(41,11,2019,0),(42,11,2020,1),(43,11,2021,1),(44,11,2022,1),(45,12,2019,1),(46,12,2020,0),(47,12,2021,1),(48,12,2021,0),(49,12,2022,1),(50,13,2019,1),(51,13,2020,0),(52,13,2021,1),(53,13,2022,1),(54,14,2019,1),(55,14,2020,1),(56,14,2021,0),(57,14,2022,1),(58,15,2019,0),(59,15,2020,0),(60,15,2021,1),(61,15,2022,1),(62,16,2019,0),(63,16,2020,0),(64,16,2021,0),(65,16,2022,1),(66,17,2019,0),(67,17,2020,0),(68,17,2021,1),(69,17,2022,1),(70,18,2019,0),(71,18,2020,0),(72,18,2021,0),(73,18,2022,1),(74,19,2019,0),(75,19,2020,0),(76,19,2021,0),(77,19,2022,0),(78,20,2019,1),(79,20,2020,0),(80,20,2021,0),(81,20,2022,1),(82,21,2019,1),(83,21,2020,0),(84,21,2021,1),(85,21,2022,1),(86,22,2019,0),(87,22,2020,0),(88,22,2021,1),(89,22,2022,1),(90,23,2019,0),(91,23,2020,0),(92,23,2021,0),(93,23,2022,1),(94,24,2019,1),(95,24,2020,0),(96,24,2021,0),(97,24,2022,1),(98,25,2019,0),(99,25,2020,0),(100,25,2021,0),(101,25,2022,1),(102,26,2019,0),(103,26,2020,0),(104,26,2021,1),(105,26,2022,1),(106,27,2019,0),(107,27,2020,0),(108,27,2021,0),(109,27,2022,1),(110,28,2019,1),(111,28,2020,0),(112,28,2021,1),(113,28,2022,1);
/*!40000 ALTER TABLE `flooding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainfall`
--

DROP TABLE IF EXISTS `rainfall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainfall` (
  `rainfall_id` int(32) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `rainfall` decimal(10,2) NOT NULL,
  PRIMARY KEY (`rainfall_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `rainfall_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainfall`
--

LOCK TABLES `rainfall` WRITE;
/*!40000 ALTER TABLE `rainfall` DISABLE KEYS */;
INSERT INTO `rainfall` VALUES (1,1,'december',121.30),(2,1,'december',311.81),(3,1,'december',109.70),(4,1,'december',508.30),(5,2,'december',124.20),(6,2,'december',859.40),(7,2,'december',110.10),(8,2,'december',727.00),(9,3,'december',21.60),(10,3,'december',383.10),(11,3,'december',62.00),(12,3,'december',560.00),(13,4,'december',64.40),(14,4,'december',717.20),(15,4,'december',91.90),(16,4,'december',437.10),(17,5,'december',78.00),(18,5,'december',697.80),(19,5,'december',311.81),(20,6,'december',99.90),(21,6,'december',602.50),(22,6,'december',20.80),(23,6,'december',437.10),(24,7,'december',47.30),(25,7,'december',553.60),(26,7,'december',28.40),(27,7,'december',311.81),(28,8,'december',95.50),(29,8,'december',242.60),(30,8,'december',74.90),(31,8,'december',323.50),(32,9,'december',53.10),(33,9,'december',508.00),(34,9,'december',0.10),(35,9,'december',298.30),(36,10,'december',311.81),(37,11,'december',139.50),(38,11,'december',509.60),(39,11,'december',20.80),(40,11,'december',423.00),(41,12,'december',45.40),(42,12,'december',459.80),(43,12,'december',31.10),(44,12,'december',445.10),(45,13,'december',106.80),(46,13,'december',532.80),(47,13,'december',6.30),(48,13,'december',263.80),(49,14,'december',88.80),(50,14,'december',554.70),(51,14,'december',40.20),(52,14,'december',910.40),(53,15,'december',141.30),(54,15,'december',968.30),(55,15,'december',218.00),(56,15,'december',311.81),(57,15,'december',910.40),(58,16,'december',300.10),(59,16,'december',837.10),(60,16,'december',12.10),(61,16,'december',550.80),(62,17,'december',42.20),(63,17,'december',629.90),(64,17,'december',30.80),(65,17,'december',221.80),(66,18,'december',74.10),(67,18,'december',453.50),(68,18,'december',12.10),(69,18,'december',765.40),(70,19,'december',169.50),(71,19,'december',789.80),(72,19,'december',15.90),(73,19,'december',311.81),(74,20,'december',152.70),(75,20,'december',983.20),(76,20,'december',42.70),(77,20,'december',311.81),(78,21,'december',311.81),(79,21,'december',440.70),(80,21,'december',51.50),(81,21,'december',415.50),(82,22,'december',118.20),(83,22,'december',440.70),(84,22,'december',3.10),(85,22,'december',450.60),(86,23,'december',131.90),(87,23,'december',468.20),(88,23,'december',3.10),(89,23,'december',225.90),(90,24,'december',311.81),(91,25,'december',311.81),(92,25,'december',483.20),(93,25,'december',487.20),(94,26,'december',93.90),(95,26,'december',808.60),(96,26,'december',45.70),(97,26,'december',383.00),(98,27,'december',103.50),(99,27,'december',730.90),(100,27,'december',206.60),(101,27,'december',411.70),(102,28,'december',150.40),(103,28,'december',311.81),(104,28,'december',121.20),(105,28,'december',576.00);
/*!40000 ALTER TABLE `rainfall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rivers`
--

DROP TABLE IF EXISTS `rivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rivers` (
  `river_id` int(11) NOT NULL AUTO_INCREMENT,
  `river_name` varchar(255) NOT NULL,
  PRIMARY KEY (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rivers`
--

LOCK TABLES `rivers` WRITE;
/*!40000 ALTER TABLE `rivers` DISABLE KEYS */;
INSERT INTO `rivers` VALUES (1,'Lifidzi'),(2,'Lirangwe'),(3,'Mudi'),(4,'Mwanza'),(5,'Nasolo'),(6,'Kholombidzo'),(7,'Lunzu'),(8,'Shire'),(9,'Mwanje'),(10,'Songwe'),(11,'Linthipe'),(12,'Lilongwe'),(13,'Lingadzi'),(14,'Rukuru'),(15,'Luwerezi'),(16,'Sani'),(17,'Likoma'),(18,'Domasi'),(19,'Molere'),(20,'Thuchila'),(21,'Namadzi'),(22,'Ruo'),(23,'Lupaso'),(24,'South Rukuru'),(25,'Neno'),(26,'North Rukuru'),(27,'Bua'),(28,'Dwangwa'),(29,'Ntcheu'),(30,'East Rukuru River'),(31,'North Rukuru River'),(32,'West Rukuru River'),(33,'Lichenya'),(34,'Nansadi'),(35,'Sombani'),(36,'Likangala');
/*!40000 ALTER TABLE `rivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 13:18:26
