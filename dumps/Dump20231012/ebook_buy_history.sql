-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebook
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `buy_history`
--

DROP TABLE IF EXISTS `buy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) DEFAULT NULL,
  `authorName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_history`
--

LOCK TABLES `buy_history` WRITE;
/*!40000 ALTER TABLE `buy_history` DISABLE KEYS */;
INSERT INTO `buy_history` VALUES (1,'Harry Potter and the Half-Blood Prince','J.K. Rowling','aung224','2023-10-05'),(2,'When the Game Was War: The NBA\'s Greatest Season','Rich Cohen','aung224','2023-10-05'),(15,'Elon Musk','Walter Isaacson','nilar','2023-10-05'),(16,'Harry Potter and the Half-Blood Prince','J.K. Rowling','nilar','2023-10-05'),(17,'Harry Potter and the Half-Blood Prince','J.K. Rowling','nilar','2023-10-06'),(18,'Never Let Me Go','Kazuo Ishiguro','nilar','2023-10-08'),(19,'Harry Potter and the Half-Blood Prince','J.K. Rowling','nilar','2023-10-08'),(20,'Never Let Me Go','Kazuo Ishiguro','aung224','2023-10-05'),(21,'Harry Potter and the Philosopher?s Stone','J.K. Rowling','aung224','2023-10-10'),(22,'Harry Potter and the Chamber of Secrets','J.K. Rowling','aung224','2023-10-10'),(23,'Che Guevara','Jon Lee Anderson','aung224','2023-10-11'),(24,'Einstein: His Life and Universe','Walter Isaacson','aung224','2023-10-11'),(25,'Gordon Ramsay\'s Uncharted','Gordon Ramsay','aung224','2023-10-11'),(26,'The Audacity of Hope: Thoughts on Reclaiming the American Dream','Barack Obama','nilar','2023-10-11'),(27,'Love of My Lives','Yamile Saied M?ndez','nilar','2023-10-11'),(28,'Harry Potter and the Half-Blood Prince','J.K. Rowling','nilar','2023-10-11');
/*!40000 ALTER TABLE `buy_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 19:39:47
