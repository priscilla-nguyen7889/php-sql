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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (35,24,23),(36,23,24),(37,25,23),(38,23,25),(39,26,25),(40,26,23),(41,25,26),(42,25,24),(43,27,26),(44,27,23),(45,23,27),(46,34,29),(47,34,25),(48,23,32),(49,37,25),(50,23,29),(51,23,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'fffffff',25,0,0,'2021-10-27 09:15:25'),(2,'aaaaaa',25,0,0,'2021-10-27 09:16:02'),(3,'hi',23,0,0,'2021-10-27 09:19:14'),(4,'Hello',23,0,0,'2021-10-27 09:20:07'),(5,'xxxxxxx',23,0,0,'2021-10-27 06:25:23'),(6,'ccccc',24,0,0,'2021-10-27 06:26:55'),(7,'dddd',24,0,0,'2021-10-27 06:29:28'),(8,'ddddd',24,0,0,'2021-10-27 06:29:37'),(9,'haha',23,0,0,'2021-10-27 06:31:46'),(10,'alo alo',23,0,0,'2021-10-27 10:29:12'),(11,'hooray\r\n',23,0,0,'2021-10-27 10:48:27'),(12,'hi princess!',26,0,0,'2021-10-27 10:57:11'),(13,'heeendn',26,0,0,'2021-10-27 10:58:12'),(14,'taga',26,0,0,'2021-10-27 10:58:45'),(15,'jgigjbig',26,0,0,'2021-10-27 10:59:01'),(16,'tesssss',25,0,0,'2021-10-27 11:00:58'),(17,'ttkjtjtkt',25,0,0,'2021-10-27 11:02:09'),(18,'djhdf',27,0,0,'2021-10-27 11:05:45'),(19,'ddddd',34,0,0,'2021-10-27 11:44:36'),(20,'ff',35,0,0,'2021-10-27 11:51:16'),(21,'',35,0,0,'2021-10-27 11:51:35'),(22,'tada\r\n',23,0,0,'2021-10-28 12:13:17'),(23,'gtgtgt',37,0,0,'2021-10-28 12:36:30'),(24,'hyhyhy',37,0,0,'2021-10-28 12:36:41'),(25,'eeeee',35,0,0,'2021-10-28 13:25:14'),(26,'ccgg\r\nbygygy\r\ngygy\r\n',35,0,0,'2021-10-28 13:26:29'),(27,'yftyft',35,0,0,'2021-10-28 13:28:25'),(28,'hdchcdhud',23,0,0,'2021-10-28 14:00:38'),(29,'haha\r\n',23,0,0,'2021-10-28 14:01:28'),(30,'\"\"@',23,0,0,'2021-10-28 14:09:04'),(31,'/n',23,0,0,'2021-10-28 14:10:31'),(32,'vyvy',23,0,0,'2021-10-28 14:13:03'),(33,'\'',23,0,0,'2021-10-28 14:17:28'),(34,'drop table',23,0,0,'2021-10-28 14:17:38'),(35,' ',23,0,0,'2021-10-28 14:18:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Nick','Taggart','nick','$2y$10$SymnLu24x1IsOmMFfX2e8utG/dJHl62.ed./Qgxbiom1DdmQQpwZO','123 Main st., Fredericton','New Brunswick','E3B 0E1','(506) 111-1111','nick.taggart@nbcc.ca','','Got it','NB','2021-10-28 04:33:44','23-1635385793.jpg'),(24,'qqf','qql','qq','$2y$10$Bfp/SnXxgJCu1edWV9Y49ODXSoEBdbaNlwJnWqq7DKA4xorU5JtVm','dd','Yukon','e3d 2e1','(506) 111-3333','qq@gmail.com','','qq','qq','2021-10-26 11:47:33','24.jpg'),(25,'ww','ww','ww','$2y$10$iWnW9Natc9Tcd7giw0se0uFOFPCVayTCQ.s5/1r4L5Rhuq47UqtB.','ww','British Columbia','E3B 0E1','(506) 222-2222','ww@gmail.com','','ww','ww','2021-10-27 14:01:40','25-1635393701.jpg'),(26,'aa','aa','aa','$2y$10$QNIyQVip.gMhAOzVPLKJBu5jghhLb/wlauNK4GzxwVIwbFlyP7Ibe','35 RED MAPLE COURT','New Brunswick','E3B 0E1','(506) 222-3333','aa@gmail.com','','dd','','2021-10-27 13:56:47','26.jpg'),(27,'Priscilla','nguyen','pris','$2y$10$bB9Jlp67aoQ225PhTGMYXuFxgvyshxVSV3V/6r1AymMji77O3lUyu','xx','British Columbia','e3s 3e4','(1111111111','ffnjf@yehoo.com','','dddd','','2021-10-27 14:04:56','27-1635393766.jpg'),(28,'BFUEGFU','FVHIFHVI','ch','$2y$10$xI3p9gPCyCz91BHPk5eMO..yTGawaA9KqV0EH0fGkhy5fDeKvIWW2','VJFDU','Nunavut','E3R 4R4','999999999','FVDFH@HMAIL.COM','G','G','FF','2021-10-27 23:13:18',NULL),(29,'DDD','DD','qa','$2y$10$G/XOCzj5ex7DBY3xnnHaNuPHQDN16ThA8YYWgzO9GKkNlwVbvgyGm','VV','Nunavut','E3B 4R5','1234567890','DD@GMAIL.COM','FF','GGFF','VV','2021-10-27 23:16:22',NULL),(30,'s','s','s','$2y$10$3vLU4hbI3RW387NWKih55uKRf56K6PdsjkEzmnVixLsieYXGeDsUy','ww','Nunavut','e3r 4r5','12345678901234567890','s@r.com','ww','dd','dd','2021-10-27 23:24:33',NULL),(31,'dddd','dd','dd','$2y$10$dVHMLVSLKF1tRwB8PoZbs.eiEJmBowpvHzMY5SaIqUCBparOHgL4y','dd','Yukon','q2w1q2','234567','w@gmail.com','','dd','','2021-10-27 23:29:40',NULL),(32,'zz','zz','zz','$2y$10$2LSdKDdDFqmoYit6qygSa.OtB9vcxI3RGC9C.mPVIlLlhu65JvS5G','ss','Yukon','w2e3e4','123 456 7890','zz@t.com','dd','dd','dd','2021-10-27 23:35:46',NULL),(33,'w','w','w','$2y$10$1.3goD4/KVoeZE9T0Pz5X.W1HR5HcZTatXaxgkVfDHDh1rpLYYx7C','rr','Yukon','E3B 0E1','1234','w@hm.com','f','f','','2021-10-27 23:40:46',NULL),(34,'A','a','w2','$2y$10$qUeCUDw7OdmzZGnAmO07F.6Y3nlADp8wRMDBZhqsPc1m9lI5k2RDi','ee','Yukon','w2e 2e3','(506) 222-1111','q@hm.com','rr','rr','rr','2021-10-27 14:45:00','34.jpg'),(35,'qq','qq','zzz','$2y$10$OwQ3tvsAbSN2jH2IH9OFXeYVFpz4W/Js2r1uLKNVJ4d285uefNCjS','rr','Yukon','e4r 5t6','345 678 9090','qq@g.com','r','r','r','2021-10-28 04:15:39','35.jpg'),(36,'dd','dd','erer','$2y$10$Uy6nMXyPVbE0lpJGl67BDuRMErFj4rEFuX56Oro09BWldRLWUkU5i','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','Yukon','e3r 4r5','123 456 7890','xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@h.com','rr','ccccccccccccccccccccc','c','2021-10-28 00:52:17',NULL),(37,'ww','aa','222','$2y$10$7aydEBnI03WjR.pi/NaAl.d26Mh5tVBwSaa2UTTI9PxBx.qYgRSPq','ddd','Yukon','w2e3e4','111 111 1111','e@gmail.com','dd','dd','dd','2021-10-28 15:36:16','37.jpg'),(38,'xx','xx','xxxx','$2y$10$DdXp1ghrY37BG3WIAhlD/O0p9A2Y0eSjJgu2zejXe2D2YIF5FY1Yu','qw','Yukon','e3e 4r4','(506) 345-7789','x@f.com','','ff','ff','2021-10-28 14:37:27','38-1635388862.jpg');
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

-- Dump completed on 2021-10-28 13:04:22
