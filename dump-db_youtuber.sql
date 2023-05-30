-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: db_youtuber
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB

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
-- Table structure for table `upload_view`
--

DROP TABLE IF EXISTS `upload_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `youtuber_id` int(10) unsigned DEFAULT NULL,
  `video_upload_id` int(10) unsigned DEFAULT NULL,
  `percent_watched` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_view_FK` (`youtuber_id`),
  KEY `upload_view_FK_1` (`video_upload_id`),
  CONSTRAINT `upload_view_FK` FOREIGN KEY (`youtuber_id`) REFERENCES `youtuber` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_view_FK_1` FOREIGN KEY (`video_upload_id`) REFERENCES `video_upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_view_CHECK` CHECK (`percent_watched` >= 0 and `percent_watched` <= 100)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_view`
--

LOCK TABLES `upload_view` WRITE;
/*!40000 ALTER TABLE `upload_view` DISABLE KEYS */;
INSERT INTO `upload_view` VALUES
(1,1,1,12),
(2,1,2,10),
(3,1,4,100),
(4,1,3,0),
(5,1,5,54),
(6,2,1,3),
(7,2,2,78),
(8,2,3,100),
(9,2,4,98),
(10,2,5,0),
(11,3,1,0),
(12,3,2,1),
(13,3,3,67),
(14,3,4,100),
(15,3,5,100),
(16,4,1,40),
(17,4,2,80),
(18,4,3,76),
(19,4,4,23),
(20,4,5,11),
(21,5,1,100),
(22,5,2,100),
(23,5,3,100),
(24,5,4,100),
(25,5,5,100),
(26,1,1,100);
/*!40000 ALTER TABLE `upload_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_upload`
--

DROP TABLE IF EXISTS `video_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `length` time DEFAULT NULL,
  `youtuber_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_upload_FK` (`youtuber_id`),
  CONSTRAINT `video_upload_FK` FOREIGN KEY (`youtuber_id`) REFERENCES `youtuber` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_upload`
--

LOCK TABLES `video_upload` WRITE;
/*!40000 ALTER TABLE `video_upload` DISABLE KEYS */;
INSERT INTO `video_upload` VALUES
(1,'video_one','This is a fake description for video one','00:10:34',1),
(2,'video_two','This is a fake description for video two','00:55:01',2),
(3,'video_three','This is a fake description for video three','00:02:53',3),
(4,'video_four','This is a fake description for video four','00:45:09',4),
(5,'video_five','This is a fake description for video five','01:09:12',5);
/*!40000 ALTER TABLE `video_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtuber`
--

DROP TABLE IF EXISTS `youtuber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `youtuber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `is_partner` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UN` (`username`),
  UNIQUE KEY `email_UN` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtuber`
--

LOCK TABLES `youtuber` WRITE;
/*!40000 ALTER TABLE `youtuber` DISABLE KEYS */;
INSERT INTO `youtuber` VALUES
(1,'user_one','1993-06-16',1,'user_one@fake.com'),
(2,'user_two','1993-06-16',1,'user_two@fake.com'),
(3,'user_three','1994-06-16',0,'user_three@fake.com'),
(4,'user_four','1995-06-16',0,'user_four@fake.com'),
(5,'user_five','1996-06-16',0,'user_five@fake.com');
/*!40000 ALTER TABLE `youtuber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_youtuber'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 17:18:47
