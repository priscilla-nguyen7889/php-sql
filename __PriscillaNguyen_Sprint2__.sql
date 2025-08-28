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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,12,1),(2,12,3),(3,12,7),(4,12,5),(5,12,6),(6,12,8),(7,12,9),(8,12,2),(9,12,11),(10,12,4),(11,12,10),(12,11,7),(13,11,9),(14,11,4),(15,11,3),(16,11,12),(17,11,6),(18,11,1),(19,11,2),(20,11,8),(21,11,5),(22,11,10),(23,13,1),(24,13,9),(25,13,11),(26,13,10);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Priscilla','Nguyen','Priscilla','Test@000','45 th st.','Yukon','E3B 0E1','9099099999','pn@gmail.com','','tada','canada','2021-09-23 17:46:34',NULL),(2,'PriscillaTest1','Nguyen','Priscilla1','Test@000','35 th st.','Nunavut','W3B 0E1','1099099999','pn1@gmail.com','','horray','canada','2021-09-23 18:10:57',NULL),(3,'d1','ww','wer','Test@000','35 RED MAPLE COURT','New Brunswick','E3B 0E1','5608909999','ss@gggg','','ddd','Canada','2021-09-23 22:26:06',NULL),(4,'d2','wwe','wer12','1234','36 RED MAPLE COURT','New Brunswick','E3B 0E1','5608909991','ss@gggge','rrrr/rr/rr','33edfgg','Canada','2021-09-23 22:40:22',NULL),(5,'q1','aa','pn000','1234','35 Red Maple Court','New Brunswick','E3B 0E1','5062301905','priscill@gmail.com','r/r','tada','Canada','2021-09-24 02:42:19',NULL),(6,'w2','dd','Priscilla','1234','3 ed','Nunavut','E3B 0E3','4567890987','dd@fr','d/d','dd','us','2021-09-24 02:43:23',NULL),(7,'ddddddddddddddddddddddddd','ddddddddd','nick','234','0 Red Maple Court','New Brunswick','E3B 0E6','34567890','pris@gmail.com','66/gg','gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg','canada','2021-09-24 02:44:27',NULL),(8,'w','d','bb','1234567','2 wer','Yukon','dd','2345678901','d@gmail.com','dddd/hv','tttt','us','2021-09-24 11:17:39',NULL),(9,'Phuong','Nguyen','Priscilla1','1234567','7 RED MAPLE COURT','New Brunswick','E3B 0E1','45678902345','unl@gmail.com','','jj','Canada','2021-09-24 17:56:26',NULL),(10,'e3','ddddddddd','dd','1212','4r5rrgggg','Nunavut','e4r 5t6','45454545456','e@gmail.com','gg/gg/','gggggt','bhhh','2021-09-24 18:05:19',NULL),(11,'p1','nguyen','p1nguyen','1234','35 RED MAPLE COURT','New Brunswick','E3B 0E1','5062301906','e@gmail.com','','ytt','Canada','2021-10-09 01:34:11',NULL),(12,'p2','nguyen','p2n','1234','3 RED MAPLE COURT','New Brunswick','E3B 0E1','2345678901','ee@fmail.com','','33edfggfdfdfdfd','us','2021-10-09 10:22:26',NULL),(13,'p3','nguyen','p3n','1234','3 re st, freddry','Nunavut','E3B 0E1','4567890123','r@gmail.com','ww/ss','ss','canada','2021-10-09 23:42:01',NULL);
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

-- Dump completed on 2021-10-09 21:24:03
