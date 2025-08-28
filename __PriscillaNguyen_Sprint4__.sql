CREATE DATABASE  IF NOT EXISTS `bitter_priscillanguyen` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bitter_priscillanguyen`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bitter_priscillanguyen
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `FK_follows` (`from_id`),
  KEY `FK_follows2` (`to_id`),
  CONSTRAINT `FK_follows` FOREIGN KEY (`from_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK_follows2` FOREIGN KEY (`to_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (35,24,23),(36,23,24),(37,25,23),(38,23,25),(39,26,25),(40,26,23),(41,25,26),(42,25,24),(43,27,26),(44,27,23),(45,23,27),(46,34,29),(47,34,25),(48,23,32),(49,37,25),(50,23,29),(51,23,34),(52,23,30),(53,23,37),(54,23,26),(55,39,30),(56,42,28),(57,23,39),(58,23,41),(59,23,42),(60,23,45),(61,23,36),(62,23,44),(63,23,33),(64,23,28),(65,23,31),(66,23,35),(67,23,46),(68,23,38),(69,47,45),(70,47,25),(71,23,47),(72,23,48),(73,23,49),(74,47,32),(75,47,46),(76,47,31),(77,47,23),(78,47,37),(79,47,38),(80,47,28),(81,47,39),(82,49,26),(83,49,31),(84,49,34),(85,49,23),(86,47,27),(87,48,49),(88,48,23),(89,50,35),(90,50,41),(91,44,49),(92,44,45),(93,44,35),(94,44,46),(95,44,48),(96,48,27),(97,48,30),(98,51,25),(99,51,32),(100,48,25),(101,52,26);
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `tweet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  KEY `FK_tweet_id_idx` (`tweet_id`),
  KEY `FK_user_id_idx` (`user_id`),
  CONSTRAINT `FK_tweet_id` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `tweet_id` int(11) NOT NULL AUTO_INCREMENT,
  `tweet_text` varchar(280) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `original_tweet_id` int(11) NOT NULL DEFAULT '0',
  `reply_to_tweet_id` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tweet_id`),
  KEY `FK_tweets` (`user_id`),
  CONSTRAINT `FK_tweets` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'fffffff',25,0,0,'2021-10-27 09:15:25'),(2,'aaaaaa',25,0,0,'2021-10-27 09:16:02'),(3,'hi',23,0,0,'2021-10-27 09:19:14'),(4,'Hello',23,0,0,'2021-10-27 09:20:07'),(5,'xxxxxxx',23,0,0,'2021-10-27 06:25:23'),(6,'ccccc',24,0,0,'2021-10-27 06:26:55'),(7,'dddd',24,0,0,'2021-10-27 06:29:28'),(8,'ddddd',24,0,0,'2021-10-27 06:29:37'),(9,'haha',23,0,0,'2021-10-27 06:31:46'),(10,'alo alo',23,0,0,'2021-10-27 10:29:12'),(11,'hooray\r\n',23,0,0,'2021-10-27 10:48:27'),(12,'hi princess!',26,0,0,'2021-10-27 10:57:11'),(13,'heeendn',26,0,0,'2021-10-27 10:58:12'),(14,'taga',26,0,0,'2021-10-27 10:58:45'),(15,'jgigjbig',26,0,0,'2021-10-27 10:59:01'),(16,'tesssss',25,0,0,'2021-10-27 11:00:58'),(17,'ttkjtjtkt',25,0,0,'2021-10-27 11:02:09'),(18,'djhdf',27,0,0,'2021-10-27 11:05:45'),(19,'ddddd',34,0,0,'2021-10-27 11:44:36'),(20,'ff',35,0,0,'2021-10-27 11:51:16'),(21,'',35,0,0,'2021-10-27 11:51:35'),(22,'tada\r\n',23,0,0,'2021-10-28 12:13:17'),(23,'gtgtgt',37,0,0,'2021-10-28 12:36:30'),(24,'hyhyhy',37,0,0,'2021-10-28 12:36:41'),(25,'eeeee',35,0,0,'2021-10-28 13:25:14'),(26,'ccgg\r\nbygygy\r\ngygy\r\n',35,0,0,'2021-10-28 13:26:29'),(27,'yftyft',35,0,0,'2021-10-28 13:28:25'),(28,'hdchcdhud',23,0,0,'2021-10-28 14:00:38'),(29,'haha\r\n',23,0,0,'2021-10-28 14:01:28'),(30,'\"\"@',23,0,0,'2021-10-28 14:09:04'),(31,'/n',23,0,0,'2021-10-28 14:10:31'),(32,'vyvy',23,0,0,'2021-10-28 14:13:03'),(33,'\'',23,0,0,'2021-10-28 14:17:28'),(34,'drop table',23,0,0,'2021-10-28 14:17:38'),(35,' ',23,0,0,'2021-10-28 14:18:24'),(36,'ssss',23,0,0,'2021-10-28 16:06:00'),(37,'\'\'\'\'\'\'\'',23,0,0,'2021-10-28 16:13:46'),(38,'\'\' \'\'/ ',23,0,0,'2021-10-28 16:14:10'),(39,'',23,0,0,'2021-10-28 16:14:18'),(40,'hshshshsh',23,0,0,'2021-10-28 16:23:56'),(41,'vfvfjbvnjfnj',23,0,0,'2021-10-29 13:16:45'),(42,'ssss',23,0,0,'2021-10-29 14:24:54'),(43,'dddd',39,0,0,'2021-10-29 14:29:01'),(44,'ggg',42,0,0,'2021-11-09 19:47:00'),(45,'gggg',42,0,0,'2021-11-09 19:47:10'),(46,'ffff3:48',42,0,0,'2021-11-09 19:48:39'),(47,'he 6pm\r\n',23,0,0,'2021-11-10 22:01:25'),(48,'6-1pm\r\n',23,0,0,'2021-11-10 22:01:39'),(49,'d',47,0,0,'2021-11-10 22:02:31'),(50,'ddd610',23,0,0,'2021-11-10 22:11:01'),(51,'819PM\r\n',47,0,0,'2021-11-11 00:19:53'),(52,'hi 845\r\n\r\n',23,0,0,'2021-11-11 00:45:09'),(53,'854',23,0,0,'2021-11-11 00:54:59'),(54,'856',47,0,0,'2021-11-11 00:55:36'),(55,'ddd',47,0,0,'2021-11-11 00:59:34'),(56,'alo 902',47,0,0,'2021-11-11 01:02:29'),(57,'8:38',47,0,0,'2021-11-11 12:38:27'),(58,'10:11\r\n',23,0,0,'2021-11-11 14:11:35'),(59,'1013\r\n',23,0,0,'2021-11-11 14:13:20'),(60,'1015\r\n',23,0,0,'2021-11-11 14:15:10'),(61,'1015\r\n',23,60,0,'2021-11-11 15:19:20'),(62,'1120',23,0,0,'2021-11-11 15:21:04'),(63,'1120',23,62,0,'2021-11-11 15:21:16'),(64,'1120',23,62,0,'2021-11-11 15:22:05'),(65,'1120',23,62,0,'2021-11-11 15:22:35'),(66,'1015\r\n',23,60,0,'2021-11-11 15:30:24'),(67,'8:38',23,57,0,'2021-11-11 15:30:39'),(68,'1013\r\n',47,59,0,'2021-11-11 15:35:15'),(69,'hi 1135',47,0,0,'2021-11-11 15:35:54'),(70,'hi 1135',47,69,0,'2021-11-11 15:35:59'),(71,'hi 1135',47,70,0,'2021-11-11 15:36:37'),(72,'',47,69,0,'2021-11-11 18:11:36'),(73,'',47,69,0,'2021-11-11 18:12:07'),(74,'',47,69,0,'2021-11-11 18:12:28'),(75,'jgigjbig',49,15,0,'2021-11-11 18:16:35'),(76,'taga',49,14,0,'2021-11-11 18:17:02'),(77,'heeendn',49,13,0,'2021-11-11 18:18:06'),(78,'heeendn',49,13,0,'2021-11-12 00:32:01'),(79,'hi princess!',49,12,0,'2021-11-12 01:42:38'),(80,'',49,79,0,'2021-11-12 01:48:07'),(81,'',23,80,0,'2021-11-12 10:53:54'),(82,'',23,81,0,'2021-11-12 10:54:55'),(83,'',23,82,0,'2021-11-12 12:08:38'),(84,'',23,82,0,'2021-11-12 12:08:45'),(85,'',23,84,0,'2021-11-12 12:08:57'),(86,'',23,84,0,'2021-11-12 12:09:01'),(87,'',23,84,0,'2021-11-12 12:09:06'),(88,'',23,87,0,'2021-11-12 12:15:35'),(91,'',23,88,0,'2021-11-12 12:15:48'),(95,'',23,91,0,'2021-11-12 12:24:48'),(96,'',23,95,0,'2021-11-12 13:06:08'),(97,'',23,96,0,'2021-11-12 13:48:22'),(98,'heeendn',49,78,0,'2021-11-12 13:55:09'),(99,'hi princess!',49,79,0,'2021-11-12 13:55:17'),(130,'hi 436',49,0,99,'2021-11-12 20:36:31'),(131,'hi 436',49,130,0,'2021-11-12 20:46:15'),(132,'hi 436',49,131,0,'2021-11-12 21:16:00'),(133,'fff',49,0,132,'2021-11-12 21:16:42'),(134,'xcdcdcd',49,0,132,'2021-11-12 21:38:18'),(135,'hello',49,0,132,'2021-11-12 21:40:31'),(136,'hi546',47,0,97,'2021-11-12 21:46:41'),(137,'yuyuy',47,0,0,'2021-11-12 21:49:30'),(138,'hhjh',47,0,0,'2021-11-12 21:49:39'),(139,'ddds',47,0,138,'2021-11-12 22:17:06'),(140,'hello nick',47,0,138,'2021-11-12 22:20:10'),(141,'hi1',47,0,137,'2021-11-12 22:29:13'),(142,'g',47,0,138,'2021-11-12 22:29:52'),(143,'r',47,0,138,'2021-11-12 22:30:17'),(144,'rt',47,0,138,'2021-11-12 22:33:05'),(145,'q',47,0,138,'2021-11-12 22:34:54'),(146,'e',47,0,138,'2021-11-12 22:36:36'),(147,'er',47,0,138,'2021-11-12 22:37:13'),(148,'7',47,0,138,'2021-11-12 22:39:00'),(149,'3',47,0,138,'2021-11-12 22:53:14'),(150,'1',47,0,138,'2021-11-12 22:53:54'),(151,'2',47,0,138,'2021-11-12 22:54:04'),(152,'3',47,0,138,'2021-11-12 22:54:27'),(153,'5',47,0,138,'2021-11-12 22:54:35'),(154,'1',47,0,137,'2021-11-12 22:55:02'),(155,'2',47,0,137,'2021-11-12 22:55:09'),(156,'1',47,0,97,'2021-11-12 22:58:00'),(157,'hi711\r\n',48,0,0,'2021-11-12 23:11:30'),(158,'hello',48,135,0,'2021-11-12 23:11:43'),(159,'hi7112repl',48,0,157,'2021-11-12 23:12:06'),(160,'gagain',48,0,157,'2021-11-12 23:12:15'),(161,'hi7112repl',48,159,0,'2021-11-12 23:12:18'),(162,'gagain',48,160,0,'2021-11-12 23:12:23'),(163,'',48,0,0,'2021-11-12 23:25:15'),(164,'hi 727',48,0,163,'2021-11-12 23:27:41'),(165,'hi 727',23,164,0,'2021-11-13 01:05:04'),(166,'hi905',23,0,165,'2021-11-13 01:05:14'),(167,'hi905',23,166,0,'2021-11-13 01:05:22'),(168,'hi906',23,0,164,'2021-11-13 01:05:35'),(169,'907',23,0,164,'2021-11-13 01:05:43'),(170,'907',23,169,0,'2021-11-13 01:05:46'),(171,'hi910',50,0,0,'2021-11-13 01:07:20'),(172,'hi910',50,171,0,'2021-11-13 01:07:34'),(173,'hi911',50,0,172,'2021-11-13 01:07:41'),(174,'hi911',50,173,0,'2021-11-13 01:07:43'),(175,'yftyft',50,27,0,'2021-11-13 01:28:32'),(176,'930',50,0,175,'2021-11-13 01:28:40'),(177,'930',50,176,0,'2021-11-13 01:28:44'),(178,'930',50,177,0,'2021-11-13 01:39:31'),(179,'930',50,176,0,'2021-11-13 01:39:39'),(180,'hi942',50,0,179,'2021-11-13 01:42:10'),(181,'hi942',50,180,0,'2021-11-13 01:42:17'),(182,'967\r\n',50,0,179,'2021-11-13 01:42:56'),(183,'967\r\n',50,182,0,'2021-11-13 01:54:12'),(184,'hi942',50,180,0,'2021-11-13 02:00:36'),(185,'hi942',50,184,0,'2021-11-13 02:09:48'),(186,'1009r',50,0,185,'2021-11-13 02:09:59'),(187,'1009r',50,186,0,'2021-11-13 02:10:01'),(188,'r1011',44,0,135,'2021-11-13 02:11:10'),(189,'r1011',44,188,0,'2021-11-13 02:11:13'),(190,'r1011',44,189,0,'2021-11-13 02:14:58'),(191,'1015',44,0,190,'2021-11-13 02:15:07'),(192,'r1011',44,190,0,'2021-11-13 02:17:46'),(193,'1015',44,191,0,'2021-11-13 02:17:50'),(194,'1015',44,191,0,'2021-11-13 02:29:07'),(195,'r1011',44,188,0,'2021-11-13 02:29:11'),(196,'r1011',44,195,0,'2021-11-13 02:29:15'),(197,'1107',44,0,194,'2021-11-13 03:07:13'),(198,'1107',44,197,0,'2021-11-13 03:07:23'),(199,'1107',44,198,0,'2021-11-13 03:07:45'),(200,'1142',44,0,198,'2021-11-13 03:43:00'),(201,'1142',44,200,0,'2021-11-13 03:43:02'),(202,'1143',44,0,198,'2021-11-13 03:44:39'),(203,'1143',44,202,0,'2021-11-13 03:44:42'),(204,'1149',44,0,203,'2021-11-13 03:50:03'),(205,'1149',44,204,203,'2021-11-13 03:51:03'),(206,'907',48,170,0,'2021-11-13 03:51:32'),(207,'1151',48,0,206,'2021-11-13 03:51:46'),(208,'1151',48,207,206,'2021-11-13 03:51:50'),(209,'hi906',48,168,164,'2021-11-13 03:52:53'),(210,'1152',48,0,209,'2021-11-13 03:53:00'),(211,'1152',48,210,209,'2021-11-13 03:53:04'),(212,'1152',23,211,209,'2021-11-13 04:00:40'),(213,'1200',23,0,212,'2021-11-13 04:00:47'),(214,'1200',23,213,212,'2021-11-13 04:00:49'),(215,'ttkjtjtkt',51,17,0,'2021-11-13 04:02:02'),(216,'122',51,0,215,'2021-11-13 04:02:10'),(217,'122',51,216,215,'2021-11-13 04:02:12'),(218,'122',51,217,215,'2021-11-13 04:25:29'),(219,'ddd',51,0,218,'2021-11-13 04:25:34'),(220,'ddd',51,219,218,'2021-11-13 04:25:36'),(221,'1200',23,214,212,'2021-11-13 12:30:46'),(222,'800',23,0,221,'2021-11-13 12:30:56'),(223,'800',23,222,221,'2021-11-13 12:30:58'),(224,'1152',23,211,209,'2021-11-13 12:31:07'),(225,'1152',23,211,209,'2021-11-13 12:31:17'),(226,'1152',48,225,209,'2021-11-13 12:45:20'),(227,'845',48,0,226,'2021-11-13 12:45:30'),(228,'850',48,0,223,'2021-11-13 12:47:26'),(229,'849',48,0,226,'2021-11-13 12:50:00'),(230,'849',48,229,226,'2021-11-13 12:50:06'),(231,'hi 852',52,0,0,'2021-11-13 12:52:42'),(232,'hi 852',52,231,0,'2021-11-13 12:52:46'),(233,'hi 852',52,232,0,'2021-11-13 12:52:55'),(234,'853',52,0,233,'2021-11-13 12:53:10'),(235,'853',52,234,233,'2021-11-13 12:53:18'),(236,'yh',52,0,232,'2021-11-13 12:53:46'),(237,'ffff',52,0,0,'2021-11-13 13:05:48'),(238,'ffff',52,237,0,'2021-11-13 13:05:51'),(239,'ffff',52,238,0,'2021-11-13 13:06:19');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `address` varchar(200) NOT NULL,
  `province` varchar(50) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `contact_number` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` varchar(160) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Nick','Taggart','nick','$2y$10$SymnLu24x1IsOmMFfX2e8utG/dJHl62.ed./Qgxbiom1DdmQQpwZO','123 Main st., Fredericton','New Brunswick','E3B 0E1','(506) 111-1111','nick.taggart@nbcc.ca','','Got it','NB','2021-10-28 04:33:44','23-1636765565.jpg'),(24,'qqf','qql','qq','$2y$10$Bfp/SnXxgJCu1edWV9Y49ODXSoEBdbaNlwJnWqq7DKA4xorU5JtVm','dd','Yukon','e3d 2e1','(506) 111-3333','qq@gmail.com','','qq','qq','2021-10-26 11:47:33','24.jpg'),(25,'ww','ww','ww','$2y$10$iWnW9Natc9Tcd7giw0se0uFOFPCVayTCQ.s5/1r4L5Rhuq47UqtB.','ww','British Columbia','E3B 0E1','(506) 222-2222','ww@gmail.com','','ww','ww','2021-10-27 14:01:40','25-1635393701.jpg'),(26,'aa','aa','aa','$2y$10$QNIyQVip.gMhAOzVPLKJBu5jghhLb/wlauNK4GzxwVIwbFlyP7Ibe','35 RED MAPLE COURT','New Brunswick','E3B 0E1','(506) 222-3333','aa@gmail.com','','dd','','2021-10-27 13:56:47','26.jpg'),(27,'Priscilla','nguyen','pris','$2y$10$bB9Jlp67aoQ225PhTGMYXuFxgvyshxVSV3V/6r1AymMji77O3lUyu','xx','British Columbia','e3s 3e4','(1111111111','ffnjf@yehoo.com','','dddd','','2021-10-27 14:04:56','27-1635395490.jpg'),(28,'BFUEGFU','FVHIFHVI','ch','$2y$10$xI3p9gPCyCz91BHPk5eMO..yTGawaA9KqV0EH0fGkhy5fDeKvIWW2','VJFDU','Nunavut','E3R 4R4','999999999','FVDFH@HMAIL.COM','G','G','FF','2021-10-27 23:13:18',NULL),(29,'DDD','DD','qa','$2y$10$G/XOCzj5ex7DBY3xnnHaNuPHQDN16ThA8YYWgzO9GKkNlwVbvgyGm','VV','Nunavut','E3B 4R5','1234567890','DD@GMAIL.COM','FF','GGFF','VV','2021-10-27 23:16:22',NULL),(30,'s','s','s','$2y$10$3vLU4hbI3RW387NWKih55uKRf56K6PdsjkEzmnVixLsieYXGeDsUy','ww','Nunavut','e3r 4r5','12345678901234567890','s@r.com','ww','dd','dd','2021-10-27 23:24:33',NULL),(31,'dddd','dd','dd','$2y$10$dVHMLVSLKF1tRwB8PoZbs.eiEJmBowpvHzMY5SaIqUCBparOHgL4y','dd','Yukon','q2w1q2','234567','w@gmail.com','','dd','','2021-10-27 23:29:40',NULL),(32,'zz','zz','zz','$2y$10$2LSdKDdDFqmoYit6qygSa.OtB9vcxI3RGC9C.mPVIlLlhu65JvS5G','ss','Yukon','w2e3e4','123 456 7890','zz@t.com','dd','dd','dd','2021-10-27 23:35:46',NULL),(33,'w','w','w','$2y$10$1.3goD4/KVoeZE9T0Pz5X.W1HR5HcZTatXaxgkVfDHDh1rpLYYx7C','rr','Yukon','E3B 0E1','1234','w@hm.com','f','f','','2021-10-27 23:40:46',NULL),(34,'A','a','w2','$2y$10$qUeCUDw7OdmzZGnAmO07F.6Y3nlADp8wRMDBZhqsPc1m9lI5k2RDi','ee','Yukon','w2e 2e3','(506) 222-1111','q@hm.com','rr','rr','rr','2021-10-27 14:45:00','34.jpg'),(35,'qq','qq','zzz','$2y$10$OwQ3tvsAbSN2jH2IH9OFXeYVFpz4W/Js2r1uLKNVJ4d285uefNCjS','rr','Yukon','e4r 5t6','345 678 9090','qq@g.com','r','r','r','2021-10-28 04:15:39','35.jpg'),(36,'dd','dd','erer','$2y$10$Uy6nMXyPVbE0lpJGl67BDuRMErFj4rEFuX56Oro09BWldRLWUkU5i','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','Yukon','e3r 4r5','123 456 7890','xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@h.com','rr','ccccccccccccccccccccc','c','2021-10-28 00:52:17',NULL),(37,'ww','aa','222','$2y$10$7aydEBnI03WjR.pi/NaAl.d26Mh5tVBwSaa2UTTI9PxBx.qYgRSPq','ddd','Yukon','w2e3e4','111 111 1111','e@gmail.com','dd','dd','dd','2021-10-28 15:36:16','37.jpg'),(38,'xx','xx','xxxx','$2y$10$DdXp1ghrY37BG3WIAhlD/O0p9A2Y0eSjJgu2zejXe2D2YIF5FY1Yu','qw','Yukon','e3e 4r4','(506) 345-7789','x@f.com','','ff','ff','2021-10-28 14:37:27','38-1635388862.jpg'),(39,'d','d','xxaa','$2y$10$O/7wyeF43TPEBBunxv3TF.d6zisLsZxJ2qdrfBdrqkKIqt7LwKYIK','ss','British Columbia','e3e 3e4','(607) 678 3454','d@hmo.com','ss','ss','s','2021-10-29 14:28:06','39-1635474548.jpg'),(41,'nick2','t','nick2','$2y$10$CPCX7rVkRT5AWlvHxf//r.Cum03UjvUNJuxw7A5Z6XJuEQqsxR0ze','yy','Yukon','E3B 0E1','(506) 666-6666','r@gmail.com','','yy','yy','2021-11-09 19:04:00',NULL),(42,'n2','d','n2','$2y$10$Iohr/uV.PUqunZXJFf291e0LD6Xwvq.fnjuqBmv0UCZjQWFvb9ZIm','fffd','Yukon','E3B 0E1','(506) 222-4565','d@gmail.com','','ee','ee','2021-11-09 19:46:09','42-1636444015.jpg'),(44,'nick3','d','nick3','$2y$10$5r80FLPkoKbCjr8a9SOMcO/JBQUFuYw0bKfR6d0l34TKnKIXYJwdS','dd','British Columbia','E3B 0E1','(506) 230-4444','w@gmail.com','d','d','d','2021-11-10 14:34:17',NULL),(45,'nick4','d','nick4','$2y$10$PzFHv2t5szQ/.a6uVFycge2tNMCu9qR7FREXuwLg9T3VvlX4y38MS','ff','Yukon','E3B 0E1','(506) 456-3456','s4@gmail.com','vv','vv','vv','2021-11-10 14:57:17',NULL),(46,'nick5','n','nick5','$2y$10$L7ifsr12zdx4ZbO60Sw52epki3rWWP8e/0ms1rie9IEJQZrq.K.NC','dd@gmail.com','Nunavut','E3B 0E1','(506) 234-3333','s@gmail.com','dd','dd','dd','2021-11-10 15:27:49',NULL),(47,'nick6','d','nick6','$2y$10$towzZLlY.9zV0CXodFcFPOtzWw/LtunmI/c1897XOGzoEx4GEaBaC','hh','Yukon','E3B 0E1','(405) 567-7777','d34@gmail.com','hh','hh','hh','2021-11-10 21:54:50','47-1636540408.jpg'),(48,'nick7','d','nick7','$2y$10$oVLJc2UwWV5HR5ytXl9/L.vhk7nTjhe0daeHXubeU7l5rjLJewdC6','d','Yukon','E3B 0E1','(000) 444-5555','dw@gmail.com','d','d','d','2021-11-10 22:07:24','48-1636807516.jpg'),(49,'nick9','d','nick9','$2y$10$xmuR1W2VkJhcEypntejsBue7RCV2u72dR7SaF/tsTJDn9y040UAju','dd','Yukon','E3B 0E1','(444) 444-4444','wedd@gmail.com','cc','cc','cc','2021-11-10 22:08:29',NULL),(50,'n10','n','nick10','$2y$10$jnPTdm.KTj3XR4XSwyT4XO2Y/1QHS5rb7M/olq32ruIooxsggQy0.','ff','Yukon','E3B 0E1','(506) 222-3456','w@gmail.com','g','gg','gg','2021-11-13 01:07:00',NULL),(51,'n','n','nick11','$2y$10$nRnnEg5YXuHc8aSZ2VFOluQ5cnZkW530k/yhDM3dlMWy1Zn7HNwZq','ff','Nunavut','E3B 0E1','(506) 234-5555','wer@gmail.com','h','h','h','2021-11-13 04:01:48','51-1636776149.jpg'),(52,'n','Nguyen','nick12','$2y$10$fvcp0k7mxLrVMWMktcrUZeg.f8am1.vJce8x9h1AjxFbk1VHd/TSe','5 RED MAPLE COURT','New Brunswick','E3B 0E1','(506) 345-7890','nl@gmail.com','gg','gg','gg','2021-11-13 12:51:12','52-1636808013.jpg');
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

-- Dump completed on 2021-11-13  9:10:54
