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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (35,24,23),(36,23,24),(37,25,23),(38,23,25),(39,26,25),(40,26,23),(41,25,26),(42,25,24),(43,27,26),(44,27,23),(45,23,27),(46,34,29),(47,34,25),(48,23,32),(49,37,25),(50,23,29),(51,23,34),(52,23,30),(53,23,37),(54,23,26),(55,39,30),(56,42,28),(63,23,33),(64,23,28),(65,23,31),(66,23,35),(67,23,46),(68,23,38),(69,47,45),(70,47,25),(71,23,47),(72,23,48),(73,23,49),(74,47,32),(75,47,46),(76,47,31),(77,47,23),(78,47,37),(79,47,38),(80,47,28),(81,47,39),(82,49,26),(83,49,31),(84,49,34),(85,49,23),(86,47,27),(87,48,49),(88,48,23),(89,50,35),(90,50,41),(91,44,49),(92,44,45),(93,44,35),(94,44,46),(95,44,48),(96,48,27),(97,48,30),(98,51,25),(99,51,32),(100,48,25),(101,52,26),(102,23,51),(103,52,37),(104,23,44),(105,23,42),(106,23,54),(107,23,36),(108,23,68),(109,23,41),(110,67,68),(111,68,23),(112,69,41),(113,69,24),(114,52,23),(115,23,69),(116,47,44),(117,44,63),(118,44,62),(119,62,68),(120,44,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (47,280,23,'2021-12-06 10:03:58'),(51,283,23,'2021-12-09 18:47:30'),(52,281,23,'2021-12-09 18:48:08'),(53,285,23,'2021-12-09 18:48:13'),(54,285,47,'2021-12-09 19:33:38'),(56,288,23,'2021-12-09 19:36:20'),(57,285,68,'2021-12-09 19:48:03'),(60,282,68,'2021-12-09 19:53:41'),(64,290,68,'2021-12-09 20:03:20'),(65,293,23,'2021-12-09 20:19:50'),(66,295,23,'2021-12-09 20:19:57'),(67,294,23,'2021-12-09 20:19:58');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message_text` varchar(255) NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_toid_idx` (`id`,`from_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (19,47,23,'from nick 6','2021-12-09 15:05:13'),(18,23,47,'from Nick 303','2021-12-09 15:03:59'),(17,44,23,'nick 3 258','2021-12-09 14:59:01'),(16,23,44,'from nick 256','2021-12-09 14:56:45'),(13,44,62,'pn36 from nick3','2021-12-09 13:38:25'),(14,62,68,'hi pn46 from pn36','2021-12-09 13:44:43'),(15,62,68,'hi pn46 145','2021-12-09 13:45:52'),(20,23,0,'hhhhh','2021-12-09 15:09:46'),(21,23,0,'gggg','2021-12-09 15:10:19'),(22,23,36,'fg','2021-12-09 15:18:05'),(23,47,27,'nicj6 hi','2021-12-09 15:19:24'),(24,47,0,'jbjbj','2021-12-09 15:20:42'),(25,47,27,'','2021-12-09 15:22:23'),(26,47,27,'hi n6','2021-12-09 15:26:54'),(27,23,68,'from nick dec 9','2021-12-09 15:48:33'),(28,68,23,'hi 405 pn 46','2021-12-09 16:05:22'),(29,23,68,'from nick','2021-12-09 16:06:06'),(30,23,27,'hihhh','2021-12-09 16:17:44'),(31,23,68,'bgbgbg','2021-12-09 16:20:20');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (266,'hi 729\r\n',23,0,0,'2021-11-28 11:29:55'),(267,'hi 729\r\n',23,266,0,'2021-11-28 11:29:59'),(268,'awe',23,0,267,'2021-11-28 11:30:06'),(269,'awe',23,268,267,'2021-11-28 11:30:07'),(270,'hi211',23,0,269,'2021-12-05 18:21:40'),(271,'hi211',23,270,269,'2021-12-05 18:21:43'),(272,'awe',52,269,267,'2021-12-05 20:47:01'),(273,'hi211',52,270,269,'2021-12-05 20:50:46'),(274,'450',52,0,271,'2021-12-05 20:50:53'),(275,'451',52,0,273,'2021-12-05 20:51:08'),(276,'1143',23,203,0,'2021-12-05 21:30:23'),(277,'1107',23,199,0,'2021-12-05 21:30:51'),(278,'1107',23,277,0,'2021-12-05 21:54:21'),(279,'1107',47,278,0,'2021-12-06 01:11:43'),(280,'from Nick6',47,0,279,'2021-12-06 01:11:52'),(281,'hi521',23,0,280,'2021-12-06 09:21:48'),(282,'522 n6',47,0,281,'2021-12-06 09:22:48'),(283,'554 n6',47,0,0,'2021-12-06 09:54:29'),(284,'554 n6',23,283,0,'2021-12-06 09:54:44'),(285,'hi n6 554',23,0,283,'2021-12-06 09:54:54'),(286,'hi n6 554',47,285,283,'2021-12-09 19:33:40'),(287,'test 333',47,0,286,'2021-12-09 19:33:52'),(288,'pn44  335',67,0,0,'2021-12-09 19:35:49'),(289,'hi  347',68,0,0,'2021-12-09 19:47:58'),(290,'hi  347',68,289,0,'2021-12-09 19:51:42'),(291,'hi',68,0,290,'2021-12-09 19:51:49'),(292,'hi  347',68,290,0,'2021-12-09 20:04:31'),(293,'hi 419',23,0,0,'2021-12-09 20:19:48'),(294,'hi 419',23,293,0,'2021-12-09 20:19:51'),(295,'ggggg',23,0,294,'2021-12-09 20:19:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Nick','Taggart','nick','$2y$10$SymnLu24x1IsOmMFfX2e8utG/dJHl62.ed./Qgxbiom1DdmQQpwZO','123 Main st., Fredericton','New Brunswick','E3B 0E1','(506) 111-1111','nick.taggart@nbcc.ca','','Got it','NB','2021-10-28 04:33:44','23-1639035832.jpg'),(24,'qqf','qql','qq','$2y$10$Bfp/SnXxgJCu1edWV9Y49ODXSoEBdbaNlwJnWqq7DKA4xorU5JtVm','dd','Yukon','e3d 2e1','(506) 111-3333','qq@gmail.com','','qq','qq','2021-10-26 11:47:33','24.jpg'),(25,'ww','ww','ww','$2y$10$iWnW9Natc9Tcd7giw0se0uFOFPCVayTCQ.s5/1r4L5Rhuq47UqtB.','ww','British Columbia','E3B 0E1','(506) 222-2222','ww@gmail.com','','ww','ww','2021-10-27 14:01:40','25-1635393701.jpg'),(26,'aa','aa','aa','$2y$10$QNIyQVip.gMhAOzVPLKJBu5jghhLb/wlauNK4GzxwVIwbFlyP7Ibe','35 RED MAPLE COURT','New Brunswick','E3B 0E1','(506) 222-3333','aa@gmail.com','','dd','','2021-10-27 13:56:47','26.jpg'),(27,'Priscilla','nguyen','pris','$2y$10$bB9Jlp67aoQ225PhTGMYXuFxgvyshxVSV3V/6r1AymMji77O3lUyu','xx','British Columbia','e3s 3e4','(1111111111','ffnjf@yehoo.com','','dddd','','2021-10-27 14:04:56','27-1635395490.jpg'),(28,'BFUEGFU','FVHIFHVI','ch','$2y$10$xI3p9gPCyCz91BHPk5eMO..yTGawaA9KqV0EH0fGkhy5fDeKvIWW2','VJFDU','Nunavut','E3R 4R4','999999999','FVDFH@HMAIL.COM','G','G','FF','2021-10-27 23:13:18',NULL),(29,'DDD','DD','qa','$2y$10$G/XOCzj5ex7DBY3xnnHaNuPHQDN16ThA8YYWgzO9GKkNlwVbvgyGm','VV','Nunavut','E3B 4R5','1234567890','DD@GMAIL.COM','FF','GGFF','VV','2021-10-27 23:16:22',NULL),(30,'s','s','s','$2y$10$3vLU4hbI3RW387NWKih55uKRf56K6PdsjkEzmnVixLsieYXGeDsUy','ww','Nunavut','e3r 4r5','12345678901234567890','s@r.com','ww','dd','dd','2021-10-27 23:24:33',NULL),(31,'dddd','dd','dd','$2y$10$dVHMLVSLKF1tRwB8PoZbs.eiEJmBowpvHzMY5SaIqUCBparOHgL4y','dd','Yukon','q2w1q2','234567','w@gmail.com','','dd','','2021-10-27 23:29:40',NULL),(32,'zz','zz','zz','$2y$10$2LSdKDdDFqmoYit6qygSa.OtB9vcxI3RGC9C.mPVIlLlhu65JvS5G','ss','Yukon','w2e3e4','123 456 7890','zz@t.com','dd','dd','dd','2021-10-27 23:35:46',NULL),(33,'w','w','w','$2y$10$1.3goD4/KVoeZE9T0Pz5X.W1HR5HcZTatXaxgkVfDHDh1rpLYYx7C','rr','Yukon','E3B 0E1','1234','w@hm.com','f','f','','2021-10-27 23:40:46',NULL),(34,'A','a','w2','$2y$10$qUeCUDw7OdmzZGnAmO07F.6Y3nlADp8wRMDBZhqsPc1m9lI5k2RDi','ee','Yukon','w2e 2e3','(506) 222-1111','q@hm.com','rr','rr','rr','2021-10-27 14:45:00','34.jpg'),(35,'qq','qq','zzz','$2y$10$OwQ3tvsAbSN2jH2IH9OFXeYVFpz4W/Js2r1uLKNVJ4d285uefNCjS','rr','Yukon','e4r 5t6','345 678 9090','qq@g.com','r','r','r','2021-10-28 04:15:39','35.jpg'),(36,'dd','dd','erer','$2y$10$Uy6nMXyPVbE0lpJGl67BDuRMErFj4rEFuX56Oro09BWldRLWUkU5i','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','Yukon','e3r 4r5','123 456 7890','xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@h.com','rr','ccccccccccccccccccccc','c','2021-10-28 00:52:17',NULL),(37,'ww','aa','222','$2y$10$7aydEBnI03WjR.pi/NaAl.d26Mh5tVBwSaa2UTTI9PxBx.qYgRSPq','ddd','Yukon','w2e3e4','111 111 1111','e@gmail.com','dd','dd','dd','2021-10-28 15:36:16','37.jpg'),(38,'xx','xx','xxxx','$2y$10$DdXp1ghrY37BG3WIAhlD/O0p9A2Y0eSjJgu2zejXe2D2YIF5FY1Yu','qw','Yukon','e3e 4r4','(506) 345-7789','x@f.com','','ff','ff','2021-10-28 14:37:27','38-1635388862.jpg'),(39,'d','d','xxaa','$2y$10$O/7wyeF43TPEBBunxv3TF.d6zisLsZxJ2qdrfBdrqkKIqt7LwKYIK','ss','British Columbia','e3e 3e4','(607) 678 3454','d@hmo.com','ss','ss','s','2021-10-29 14:28:06','39-1635474548.jpg'),(41,'nick2','t','nick2','$2y$10$CPCX7rVkRT5AWlvHxf//r.Cum03UjvUNJuxw7A5Z6XJuEQqsxR0ze','yy','Yukon','E3B 0E1','(506) 666-6666','r@gmail.com','','yy','yy','2021-11-09 19:04:00',NULL),(42,'n2','d','n2','$2y$10$Iohr/uV.PUqunZXJFf291e0LD6Xwvq.fnjuqBmv0UCZjQWFvb9ZIm','fffd','Yukon','E3B 0E1','(506) 222-4565','d@gmail.com','','ee','ee','2021-11-09 19:46:09','42-1636444015.jpg'),(44,'nick3','d','nick3','$2y$10$5r80FLPkoKbCjr8a9SOMcO/JBQUFuYw0bKfR6d0l34TKnKIXYJwdS','dd','British Columbia','E3B 0E1','(506) 230-4444','w@gmail.com','d','d','d','2021-11-10 14:34:17',NULL),(45,'nick4','d','nick4','$2y$10$PzFHv2t5szQ/.a6uVFycge2tNMCu9qR7FREXuwLg9T3VvlX4y38MS','ff','Yukon','E3B 0E1','(506) 456-3456','s4@gmail.com','vv','vv','vv','2021-11-10 14:57:17',NULL),(46,'nick5','n','nick5','$2y$10$L7ifsr12zdx4ZbO60Sw52epki3rWWP8e/0ms1rie9IEJQZrq.K.NC','dd@gmail.com','Nunavut','E3B 0E1','(506) 234-3333','s@gmail.com','dd','dd','dd','2021-11-10 15:27:49',NULL),(47,'nick6','d','nick6','$2y$10$towzZLlY.9zV0CXodFcFPOtzWw/LtunmI/c1897XOGzoEx4GEaBaC','hh','Yukon','E3B 0E1','(405) 567-7777','d34@gmail.com','hh','hh','hh','2021-11-10 21:54:50','47-1636540408.jpg'),(48,'nick7','d','nick7','$2y$10$oVLJc2UwWV5HR5ytXl9/L.vhk7nTjhe0daeHXubeU7l5rjLJewdC6','d','Yukon','E3B 0E1','(000) 444-5555','dw@gmail.com','d','d','d','2021-11-10 22:07:24','48-1636807516.jpg'),(49,'nick9','d','nick9','$2y$10$xmuR1W2VkJhcEypntejsBue7RCV2u72dR7SaF/tsTJDn9y040UAju','dd','Yukon','E3B 0E1','(444) 444-4444','wedd@gmail.com','cc','cc','cc','2021-11-10 22:08:29',NULL),(50,'n10','n','nick10','$2y$10$jnPTdm.KTj3XR4XSwyT4XO2Y/1QHS5rb7M/olq32ruIooxsggQy0.','ff','Yukon','E3B 0E1','(506) 222-3456','w@gmail.com','g','gg','gg','2021-11-13 01:07:00',NULL),(51,'n','n','nick11','$2y$10$nRnnEg5YXuHc8aSZ2VFOluQ5cnZkW530k/yhDM3dlMWy1Zn7HNwZq','ff','Nunavut','E3B 0E1','(506) 234-5555','wer@gmail.com','h','h','h','2021-11-13 04:01:48','51-1636776149.jpg'),(52,'n','Nguyen','nick12','$2y$10$fvcp0k7mxLrVMWMktcrUZeg.f8am1.vJce8x9h1AjxFbk1VHd/TSe','5 RED MAPLE COURT','New Brunswick','E3B 0E1','(506) 345-7890','nl@gmail.com','gg','gg','gg','2021-11-13 12:51:12','52-1636808013.jpg'),(53,'n','tttttt','nick13','$2y$10$E9WTgxZPmQMirG1HxwT9d.9IlPlW4xsNHSzrc9d6eF7juhlv8fhj6','3 RED MAPLE COURT','New Brunswick','E3B 0E1','(555) 456-3456','tt@gmail.com','','cc','cc','2021-11-24 01:13:35',NULL),(54,'as','as','p23','$2y$10$i42krfM7FAUKnfBFrdMR7e3U0xaMG/2ErY85xZZPVDXXo/6YMGMUy','d','New Brunswick','e3b 0e1','(506) 222-3333','s@gmail.com','dd','dd','dd','2021-11-27 20:04:33',NULL),(55,'wwwww','ww','pn34','$2y$10$n1bkxg8x7drI.ISK1s9MzeCLI5ZohE00p4zZ4olNHIR2Cg73U4tt.','35 RED MAPLE COURT','New Brunswick','E3B 0E2','(506) 234-4444','w34@gmail.com','2','2','2','2021-11-27 23:30:12',NULL),(56,'diie','id','pn45','$2y$10$EyInmB1DFsms4wkgZjlsjO.pVXRGc6XDgbwgqtr7uCV6.xw3dGjai','4 ff','Quebec','G1K 8R2','(506) 333-3333','we@gmail.com','xx','xx','xx','2021-11-27 23:47:48',NULL),(57,'ff','dd','pn24','$2y$10$eGw36rkt.zj0fBRnSJUbUufgONenBN6tz0ygbJLwkBosLrho37Pga','3 dd','Quebec','G1K 8R2','(405) 567-7777','dd@gmail.com','dd','dd','dd','2021-11-27 23:49:16',NULL),(58,'ded','dd','pn26','$2y$10$3iistLl4FuOuI87bj0h8..V3D/15HZDnWiKhLllnMtNnSJtUrp72e','2 ffff','Prince Edward Island','C1A 7N8','(345) 555-6767','ddxf@gmail.com','dd','d','d','2021-11-27 23:53:59',NULL),(59,'e3ed','ddd','pn27','$2y$10$6OKC05hQMzg.eefAp6wVjeUzZH9psFcLn97iOEtPmxzLtM.e2h/he','3 ffrfr','Newfoundland and Labrador','A0B 3M0','(345) 555-6767','ddddd@gmail.com','cc','cc','cc','2021-11-28 00:12:04',NULL),(60,'DFGGV','DDDD','pn30','$2y$10$RX.905eSDPDuGxtLPNV1Ve1XExj9T/Qf4qW/dmv2bWilmQ6XQNFfC','2 ffkfk','Northwest Territories','X1A 0E2','(455) 445-3456','wec@gmail.com','ff','ff','ff','2021-11-28 00:36:57',NULL),(61,'eddd','ddd','pn35','$2y$10$xlk/GYOevXfOK4oF.SWzJukCqz.Me3pWW/ksN.CipoACppPp0H8TS','4 rtg','New Brunswick','e3b 0e1','(345) 567-5555','dd@gmail.com','dd','dd','dd','2021-11-28 01:02:01',NULL),(62,'fgh','hhh','pn36','$2y$10$VMpJ0fGWRFOGfCa5ax.EYeq1SSyv8sLBKULTZArA0h1/G5z68NVnu','4 rt','British Columbia','V6E 1C3','(455) 445-3456','hhh@gmail.com','rr','rr','rr','2021-11-28 01:03:49',NULL),(63,'cccc','ccc','pn37','$2y$10$UliVkhclxIszoMjgOxBjdejIwRVvKaf9C0jFepY9CjvliBM6dFIH2','3 rtd','Alberta','T2E 6Z8','(455) 445-3456','cc@gmail.com','d','d','d','2021-11-28 01:19:03',NULL),(64,'frt','tt','pn39','$2y$10$1fNeWejiPFqfZr2KAfieSuriys3vVXK9PtI5kjBfKTO7OJ9wqlYxG','3 rtf','Saskatchewan','S7M 1L2','(455) 445-3456','tt@hmail.com','df','ff','ff','2021-11-28 01:21:22',NULL),(65,'cddc','cdcdc','pn42','$2y$10$TkwfdA1yrZtUkArSGyyrJuaeh8sxZmwbIM3uRq2o2h7NA5Z8HPEa6','4 ggg','Manitoba','R3C3J2','(567) 456-4567','cdcd@gmail.com','gg','g','g','2021-11-28 01:25:55',NULL),(66,'fvfvn','divdi','pn40','$2y$10$fyog4hPHXw1LNleTXhYYlunj4Ruz8hiVrvqbeMr7S1xSEtNLgx4Jy','4 rt','Ontario','M5V2V4','(566) 555-3456','vfi@gmail.com','dd','d','dd','2021-11-28 01:31:42',NULL),(67,'vfvf','vf','pn44','$2y$10$0428sosW6dY6USGz76A6W.7WrnLwrhLn/t3koZr58MR2egGBjsQ6S','3 rgg','Nova Scotia','B0T1K0','(567) 456-4567','vf@hmail.com','f','f','f','2021-11-28 01:34:31','67-1639035363.jpg'),(68,'vnvnv','ncn','pn46','$2y$10$EhfmJq63M.UsAwfMa3XBhuUf609FSZkKOcR0PwovPG4ZuvbkryAma','5 tgg','Yukon','Y1A 5P7','(888) 567-4567','fn@gmail.com','ff','ff','ff','2021-11-28 01:36:59','68-1639037055.jpg'),(69,'dfdfd','fdfd','pn49','$2y$10$dnEiIr7LFbuzow6zHh5hd.6Ar2x/echpGzBKHwwD.ZEBxeldfoBHe','4 gg','Nova Scotia','B3B0G2','(455) 445-3456','fffd@gmail.com','s','ss','ss','2021-11-28 13:14:23','69-1638062469.jpg'),(70,'pris','nguyen','pris1','$2y$10$cHhWOJLtJ9lptACNOu89WuQ.Z036vcFNOzDP/ee3r4BlNr6I7PjDe','5 RED MAPLE COURT','New Brunswick','E3B 0E1','(555) 555-5555','fhf@gmail.com','fff','fff','ff','2021-12-09 20:07:41',NULL);
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

-- Dump completed on 2021-12-09 16:22:10
