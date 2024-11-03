-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ppl_coba1
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `community_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Indri','indri@email.com','password1','08123456101','2000-01-01','Sumarecon',NULL,1,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(2,'Agam','agam@email.com','password2','08123456102','2000-01-01','Tahura',NULL,0,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(3,'Agung','agung@email.com','password3','08123456103','2000-01-01','Cihampelas',NULL,1,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(4,'Adit','adit@email.com','password4','08123456104','2000-01-01','Cimahi',NULL,1,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(5,'Gilman','gilman@email.com','password5','08123456105','2000-01-01','Cileunyi',NULL,0,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_points`
--

DROP TABLE IF EXISTS `community_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_points` (
  `points_id` int NOT NULL AUTO_INCREMENT,
  `community_id` int DEFAULT NULL,
  `total_points` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`points_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `community_points_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `community_points_chk_1` CHECK ((`total_points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_points`
--

LOCK TABLES `community_points` WRITE;
/*!40000 ALTER TABLE `community_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `courier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `ktp_url` varchar(255) DEFAULT NULL,
  `kk_url` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `status` enum('Pending','Approved','Reject') DEFAULT 'Pending',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`courier_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nik` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT INTO `courier` VALUES (1,'Haykal','haykal@email.com','password1','08123456701','2000-01-01','Address 1','1234567891','1234567890123451',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(2,'Faqih','faqih@email.com','password2','08123456702','2000-01-01','Address 2','1234567892','1234567890123452',NULL,NULL,NULL,0,'Pending',NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(3,'Fowaz','fowaz@email.com','password3','08123456703','2000-01-01','Address 3','1234567893','1234567890123453',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(4,'Daffa','daffa@email.com','password4','08123456704','2000-01-01','Address 4','1234567894','1234567890123454',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(5,'Ardhi','ardhi@email.com','password5','08123456705','2000-01-01','Address 5','1234567895','1234567890123455',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17');
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_points`
--

DROP TABLE IF EXISTS `courier_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_points` (
  `points_id` int NOT NULL AUTO_INCREMENT,
  `courier_id` int DEFAULT NULL,
  `total_points` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`points_id`),
  KEY `courier_id` (`courier_id`),
  CONSTRAINT `courier_points_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courier_points_chk_1` CHECK ((`total_points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_points`
--

LOCK TABLES `courier_points` WRITE;
/*!40000 ALTER TABLE `courier_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropbox`
--

DROP TABLE IF EXISTS `dropbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dropbox` (
  `dropbox_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `district_address` enum('Bandung Utara','Bandung Selatan','Bandung Timur','Bandung Barat','Cimahi','Kabupaten Bandung','Kabupaten Bandung Barat') DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `capacity` int DEFAULT '0',
  `status` enum('Full','Available') DEFAULT 'Available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dropbox_id`),
  CONSTRAINT `dropbox_chk_1` CHECK ((`capacity` between 0 and 150))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropbox`
--

LOCK TABLES `dropbox` WRITE;
/*!40000 ALTER TABLE `dropbox` DISABLE KEYS */;
INSERT INTO `dropbox` VALUES (1,'Dropbox 1','Jl. Example No.1','Bandung Utara',106.84559900,-6.20876300,0,'Available','2024-11-03 14:23:17','2024-11-03 15:54:42'),(2,'Dropbox 2','Jl. Example No.2','Bandung Selatan',106.84560000,-6.20876400,0,'Available','2024-11-03 14:23:17','2024-11-03 15:54:52'),(3,'Dropbox 3','Jl. Example No.3','Bandung Timur',106.84560100,-6.20876500,0,'Available','2024-11-03 14:23:17','2024-11-03 15:55:00'),(4,'Dropbox 4','Jl. Example No.4','Bandung Barat',106.84560200,-6.20876600,150,'Full','2024-11-03 14:23:17','2024-11-03 14:23:17');
/*!40000 ALTER TABLE `dropbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `management_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `is_admin` tinyint(1) DEFAULT '0',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`management_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'Lutfi','lutfi@email.com','password1','2000-05-15','Jl. Mawar No. 1',NULL,NULL,1,1,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(2,'Fauzi','fauzi@email.com','password2','2000-08-22','Jl. Melati No. 2',NULL,NULL,1,0,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(3,'Malwi','malwi@email.com','password3','2000-12-10','Jl. Anggrek No. 3',NULL,NULL,1,0,NULL,NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_detail`
--

DROP TABLE IF EXISTS `pickup_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_detail` (
  `pickup_id` int DEFAULT NULL,
  `waste_id` int DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `points` int DEFAULT '0',
  KEY `pickup_id` (`pickup_id`),
  KEY `waste_id` (`waste_id`),
  CONSTRAINT `pickup_detail_ibfk_1` FOREIGN KEY (`pickup_id`) REFERENCES `pickup_waste` (`pickup_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pickup_detail_ibfk_2` FOREIGN KEY (`waste_id`) REFERENCES `waste` (`waste_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pickup_detail_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `pickup_detail_chk_2` CHECK ((`points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_detail`
--

LOCK TABLES `pickup_detail` WRITE;
/*!40000 ALTER TABLE `pickup_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_pickup_detail_total_points` BEFORE INSERT ON `pickup_detail` FOR EACH ROW BEGIN
    DECLARE waste_point INT;

    -- Mendapatkan point dari tabel waste berdasarkan waste_id yang dimasukkan
    SELECT point INTO waste_point
    FROM waste
    WHERE waste_id = NEW.waste_id;

    -- Menghitung total points berdasarkan quantity dan point dari waste
    SET NEW.points = waste_point * NEW.quantity;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_dropbox_capacity` AFTER INSERT ON `pickup_detail` FOR EACH ROW BEGIN
    DECLARE new_capacity INT;

    -- Mengambil kapasitas terbaru dari dropbox yang terkait
    SELECT capacity + NEW.quantity INTO new_capacity
    FROM dropbox
    WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);

    -- Memperbarui kapasitas dan status pada tabel dropbox
    IF new_capacity >= 100 THEN
        UPDATE dropbox
        SET capacity = 100, status = 'Full'
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    ELSE
        UPDATE dropbox
        SET capacity = new_capacity
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pickup_waste`
--

DROP TABLE IF EXISTS `pickup_waste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_waste` (
  `pickup_id` int NOT NULL AUTO_INCREMENT,
  `pickup_date` date NOT NULL,
  `pickup_address` varchar(255) NOT NULL,
  `pickup_status` enum('pending','accepted','completed','cancelled') DEFAULT 'pending',
  `dropbox_id` int DEFAULT NULL,
  `courier_id` int DEFAULT NULL,
  `community_id` int DEFAULT NULL,
  `management_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pickup_id`),
  KEY `dropbox_id` (`dropbox_id`),
  KEY `courier_id` (`courier_id`),
  KEY `community_id` (`community_id`),
  KEY `management_id` (`management_id`),
  CONSTRAINT `pickup_waste_ibfk_1` FOREIGN KEY (`dropbox_id`) REFERENCES `dropbox` (`dropbox_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pickup_waste_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pickup_waste_ibfk_3` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pickup_waste_ibfk_4` FOREIGN KEY (`management_id`) REFERENCES `management` (`management_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_waste`
--

LOCK TABLES `pickup_waste` WRITE;
/*!40000 ALTER TABLE `pickup_waste` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_waste` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_pickup_dropbox` BEFORE INSERT ON `pickup_waste` FOR EACH ROW BEGIN
    DECLARE required_quantity INT DEFAULT 1;  -- Jumlah pickup, disesuaikan sesuai kebutuhan

    -- Cek kapasitas dropbox menggunakan fungsi check_dropbox_capacity
    IF check_dropbox_capacity(NEW.dropbox_id, required_quantity) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox is full!!';
    END IF;

    -- Jika kapasitas dropbox cukup, operasi `INSERT` akan berlanjut
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_points_courier_community` AFTER UPDATE ON `pickup_waste` FOR EACH ROW BEGIN
    DECLARE total_points INT DEFAULT 0;

    -- Cek jika status baru adalah 'completed'
    IF NEW.pickup_status = 'completed' THEN
        -- Menghitung total poin dari pickup_detail untuk pickup yang selesai
        SELECT COALESCE(SUM(points), 0) INTO total_points
        FROM pickup_detail
        WHERE pickup_id = NEW.pickup_id;

        -- Update poin untuk community
        IF NEW.community_id IS NOT NULL THEN
            INSERT INTO community_points (community_id, total_points)
            VALUES (NEW.community_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = community_points.total_points + VALUES(total_points);
        END IF;

        -- Update total waste untuk courier
        IF NEW.courier_id IS NOT NULL THEN
            INSERT INTO courier_points (courier_id, total_points)
            VALUES (NEW.courier_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = courier_points.total_points + VALUES(total_points);
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_total_pickup_history`
--

DROP TABLE IF EXISTS `view_total_pickup_history`;
/*!50001 DROP VIEW IF EXISTS `view_total_pickup_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_pickup_history` AS SELECT 
 1 AS `pickup_id`,
 1 AS `pickup_date`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `Drop Box Name`,
 1 AS `district_address`,
 1 AS `waste_type_name`,
 1 AS `total_quantity`,
 1 AS `total_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_community_profile`
--

DROP TABLE IF EXISTS `vw_community_profile`;
/*!50001 DROP VIEW IF EXISTS `vw_community_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_community_profile` AS SELECT 
 1 AS `community_id`,
 1 AS `community_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `date_of_birth`,
 1 AS `address`,
 1 AS `photo`,
 1 AS `is_verified`,
 1 AS `total_points_collected`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_courier_profile`
--

DROP TABLE IF EXISTS `vw_courier_profile`;
/*!50001 DROP VIEW IF EXISTS `vw_courier_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_courier_profile` AS SELECT 
 1 AS `courier_id`,
 1 AS `courier_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `date_of_birth`,
 1 AS `address`,
 1 AS `account_number`,
 1 AS `nik`,
 1 AS `ktp_url`,
 1 AS `kk_url`,
 1 AS `photo`,
 1 AS `is_verified`,
 1 AS `status`,
 1 AS `total_points_collected`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_management_profile`
--

DROP TABLE IF EXISTS `vw_management_profile`;
/*!50001 DROP VIEW IF EXISTS `vw_management_profile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_management_profile` AS SELECT 
 1 AS `management_id`,
 1 AS `management_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `date_of_birth`,
 1 AS `address`,
 1 AS `photo`,
 1 AS `is_active`,
 1 AS `is_admin`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_10_couriers`
--

DROP TABLE IF EXISTS `vw_top_10_couriers`;
/*!50001 DROP VIEW IF EXISTS `vw_top_10_couriers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_10_couriers` AS SELECT 
 1 AS `courier_id`,
 1 AS `courier_name`,
 1 AS `total_pickups`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_10_waste_types`
--

DROP TABLE IF EXISTS `vw_top_10_waste_types`;
/*!50001 DROP VIEW IF EXISTS `vw_top_10_waste_types`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_10_waste_types` AS SELECT 
 1 AS `waste_name`,
 1 AS `total_collected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_waste_and_points`
--

DROP TABLE IF EXISTS `vw_total_waste_and_points`;
/*!50001 DROP VIEW IF EXISTS `vw_total_waste_and_points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_waste_and_points` AS SELECT 
 1 AS `total_waste_collected`,
 1 AS `total_points_collected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_waste_points_per_category`
--

DROP TABLE IF EXISTS `vw_total_waste_points_per_category`;
/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_waste_points_per_category` AS SELECT 
 1 AS `waste_type_name`,
 1 AS `total_waste_collected`,
 1 AS `total_points_collected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_waste_points_per_district`
--

DROP TABLE IF EXISTS `vw_total_waste_points_per_district`;
/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_district`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_waste_points_per_district` AS SELECT 
 1 AS `district_address`,
 1 AS `total_waste_collected`,
 1 AS `total_points_collected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_waste_points_per_dropbox`
--

DROP TABLE IF EXISTS `vw_total_waste_points_per_dropbox`;
/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_dropbox`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_waste_points_per_dropbox` AS SELECT 
 1 AS `dropbox_name`,
 1 AS `total_waste_collected`,
 1 AS `total_points_collected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_waste_type_category`
--

DROP TABLE IF EXISTS `vw_waste_type_category`;
/*!50001 DROP VIEW IF EXISTS `vw_waste_type_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_waste_type_category` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Waste Type`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waste`
--

DROP TABLE IF EXISTS `waste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waste` (
  `waste_id` int NOT NULL AUTO_INCREMENT,
  `waste_name` varchar(255) NOT NULL,
  `point` int DEFAULT '0',
  `waste_type_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`waste_id`),
  KEY `waste_type_id` (`waste_type_id`),
  CONSTRAINT `waste_ibfk_1` FOREIGN KEY (`waste_type_id`) REFERENCES `waste_type` (`waste_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `waste_chk_1` CHECK ((`point` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waste`
--

LOCK TABLES `waste` WRITE;
/*!40000 ALTER TABLE `waste` DISABLE KEYS */;
INSERT INTO `waste` VALUES (1,'Washing Machine',50,1,NULL,'Large household appliance for washing clothes','2024-11-03 14:26:36','2024-11-03 14:26:36'),(2,'Hand Blender',10,2,NULL,'Compact blender for small-scale food preparation','2024-11-03 14:26:36','2024-11-03 14:26:36'),(3,'Laptop',25,3,NULL,'Portable computer device for work and entertainment','2024-11-03 14:26:36','2024-11-03 14:26:36'),(4,'LED Lamp',5,4,NULL,'Energy-saving fluorescent lighting device','2024-11-03 14:26:36','2024-11-03 14:26:36'),(5,'Electronic Toy Car',8,5,NULL,'Battery-powered electronic toy car for children','2024-11-03 14:26:36','2024-11-03 14:26:36'),(6,'LCD Monitor',20,6,NULL,'LCD monitor for computer displays','2024-11-03 14:26:36','2024-11-03 14:26:36'),(7,'Digital Camera',15,7,NULL,'Portable digital camera for capturing photos','2024-11-03 14:26:36','2024-11-03 14:26:36');
/*!40000 ALTER TABLE `waste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waste_type`
--

DROP TABLE IF EXISTS `waste_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waste_type` (
  `waste_type_id` int NOT NULL AUTO_INCREMENT,
  `waste_type_name` enum('Large Household Apllience','Small Household Appliances','IT Equipment','Lamps','Toys','Screens and Monitors','Other Electronic Devices') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`waste_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waste_type`
--

LOCK TABLES `waste_type` WRITE;
/*!40000 ALTER TABLE `waste_type` DISABLE KEYS */;
INSERT INTO `waste_type` VALUES (1,'Large Household Apllience',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(2,'Small Household Appliances',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(3,'IT Equipment',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(4,'Lamps',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(5,'Toys',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(6,'Screens and Monitors',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17'),(7,'Other Electronic Devices',NULL,'2024-11-03 14:23:17','2024-11-03 14:23:17');
/*!40000 ALTER TABLE `waste_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ppl_coba1'
--

--
-- Dumping routines for database 'ppl_coba1'
--
/*!50003 DROP FUNCTION IF EXISTS `check_dropbox_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_dropbox_capacity`(p_dropbox_id INT, p_quantity INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE current_capacity INT;

    -- Ambil kapasitas saat ini untuk dropbox yang ditentukan
    SELECT capacity INTO current_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id
    LIMIT 1;

    -- Mengecek apakah kapasitas akan terlampaui
    IF current_capacity + p_quantity > 1000 THEN
        RETURN FALSE; -- Kapasitas tidak mencukupi
    ELSE
        RETURN TRUE;  -- Kapasitas cukup
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `funct_email_format` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funct_email_format`(email_input VARCHAR(255)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    -- Memeriksa format email.
    -- Memastikan ada teks sebelum '@', diikuti oleh domain, dan ekstensi
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF email_input REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `funct_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funct_phone`(phone_input VARCHAR(15)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    -- Memastikan input hanya terdiri dari angka 0-9
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF phone_input REGEXP '^[0-9]+$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_pickup_waste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_pickup_waste`(
    IN p_pickup_date DATE,
    IN p_pickup_address VARCHAR(255),
    IN p_dropbox_id INT,
    IN p_courier_id INT,
    IN p_community_id INT
)
BEGIN
    DECLARE dropbox_capacity INT;
    DECLARE courier_verified TINYINT(1);
    DECLARE community_verified TINYINT(1);
    DECLARE dropbox_exists INT;
    DECLARE courier_exists INT;
    DECLARE community_exists INT;

    -- 1. Check if the dropbox exists
    SELECT COUNT(*) INTO dropbox_exists
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox does not exist!';
    END IF;

    -- 2. Check if the dropbox is full
    SELECT capacity INTO dropbox_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_capacity >= 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox is full!';
    END IF;

    -- 3. Check if the courier exists and is verified and active
    SELECT COUNT(*) INTO courier_exists
    FROM courier
    WHERE courier_id = p_courier_id AND is_verified = 1 AND status = 'Approved';

    IF courier_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Courier is not verified or approved!';
    END IF;

    -- 4. Check if the community exists and is verified
    SELECT COUNT(*) INTO community_exists
    FROM community
    WHERE community_id = p_community_id AND is_verified = 1;

    IF community_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Community is not verified!';
    END IF;

    -- 5. Insert data into pickup_waste if all conditions are met
    INSERT INTO pickup_waste (
        pickup_date, pickup_address, dropbox_id, courier_id, community_id, pickup_status
    ) VALUES (
        p_pickup_date, p_pickup_address, p_dropbox_id, p_courier_id, p_community_id, 'pending'
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_community` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_community`(
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;

    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM community WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    INSERT INTO community (
        name, email, password, phone, date_of_birth, address,
        photo, is_verified, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_photo, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_courier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_courier`(
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_nik VARCHAR(255),
    IN p_account_number VARCHAR(50),
    IN p_ktp_url VARCHAR(255),
    IN p_kk_url VARCHAR(255),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT;

    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM courier WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    SELECT COUNT(*) INTO phone_exists FROM courier WHERE phone = p_phone;
    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    END IF;

    INSERT INTO courier (
        name, email, password, phone, date_of_birth, address,
        nik, account_number, ktp_url, kk_url, photo, is_verified, status,
        created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_nik, p_account_number, p_ktp_url, p_kk_url, p_photo, 0, 'pending',
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_dropbox` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_dropbox`(
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(255),
    IN p_district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat'),
    IN p_longitude DECIMAL(11,8),
    IN p_latitude DECIMAL(11,8),
    IN p_capacity INT
)
BEGIN
    DECLARE name_exists INT;
    DECLARE address_exists INT;

    -- Cek jika nama dropbox sudah ada
    SELECT COUNT(*) INTO name_exists
    FROM dropbox
    WHERE name = p_name;
    
    IF name_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox name is already registered';
    END IF;

    -- Cek jika alamat dropbox sudah ada
    SELECT COUNT(*) INTO address_exists
    FROM dropbox
    WHERE address = p_address;

    IF address_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox address is already registered';
    END IF;

    -- Pastikan kapasitas antara 0-100, jika tidak atur ke default 0
    IF p_capacity < 0 OR p_capacity > 100 THEN
        SET p_capacity = 0;
    END IF;

    -- Insert data dropbox baru jika semua pemeriksaan lolos
    INSERT INTO dropbox (
        name, address, district_address, longitude, latitude, capacity, status, created_at, updated_at
    ) VALUES (
        p_name, p_address, p_district_address, p_longitude, p_latitude, p_capacity,
        'Available', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_management` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_management`(
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(50),
    IN p_date_of_birth DATE,
    IN p_address VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_photo VARCHAR(255)
)
BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT; 

    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    SELECT COUNT(*) INTO email_exists FROM management WHERE email = p_email;
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    SELECT COUNT(*) INTO phone_exists FROM management WHERE phone = p_phone;
    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    END IF;

    INSERT INTO management (
        name, email, password, date_of_birth, address, phone, photo,
        is_verified, is_admin, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_date_of_birth, p_address, p_phone, p_photo,
        0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reset_auto_increment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_auto_increment`()
BEGIN
    START TRANSACTION;

    ALTER TABLE courier AUTO_INCREMENT = 1;
    ALTER TABLE community AUTO_INCREMENT = 1;
    ALTER TABLE dropbox AUTO_INCREMENT = 1;
    ALTER TABLE management AUTO_INCREMENT = 1;
    ALTER TABLE waste_type AUTO_INCREMENT = 1;
    ALTER TABLE waste AUTO_INCREMENT = 1;
    ALTER TABLE pickup_waste AUTO_INCREMENT = 1;
    ALTER TABLE pickup_detail AUTO_INCREMENT = 1;
    ALTER TABLE courier_points AUTO_INCREMENT = 1;
    ALTER TABLE community_points AUTO_INCREMENT = 1;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_total_pickup_history`
--

/*!50001 DROP VIEW IF EXISTS `view_total_pickup_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_pickup_history` AS select `pw`.`pickup_id` AS `pickup_id`,`pw`.`pickup_date` AS `pickup_date`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`db`.`name` AS `Drop Box Name`,`db`.`district_address` AS `district_address`,`wt`.`waste_type_name` AS `waste_type_name`,sum(`pd`.`quantity`) AS `total_quantity`,sum(`pd`.`points`) AS `total_points` from ((((`pickup_waste` `pw` join `pickup_detail` `pd` on((`pw`.`pickup_id` = `pd`.`pickup_id`))) join `waste` `w` on((`pd`.`waste_id` = `w`.`waste_id`))) join `waste_type` `wt` on((`w`.`waste_type_id` = `wt`.`waste_type_id`))) join `dropbox` `db` on((`pw`.`dropbox_id` = `db`.`dropbox_id`))) group by `pw`.`pickup_id`,`pw`.`pickup_date`,`pw`.`pickup_address`,`pw`.`pickup_status`,`db`.`name`,`db`.`district_address`,`wt`.`waste_type_name` order by `pw`.`pickup_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_community_profile`
--

/*!50001 DROP VIEW IF EXISTS `vw_community_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_community_profile` AS select `cm`.`community_id` AS `community_id`,`cm`.`name` AS `community_name`,`cm`.`email` AS `email`,`cm`.`phone` AS `phone`,`cm`.`date_of_birth` AS `date_of_birth`,`cm`.`address` AS `address`,`cm`.`photo` AS `photo`,`cm`.`is_verified` AS `is_verified`,ifnull(`cp`.`total_points`,0) AS `total_points_collected`,`cm`.`created_at` AS `created_at`,`cm`.`updated_at` AS `updated_at` from (`community` `cm` left join `community_points` `cp` on((`cm`.`community_id` = `cp`.`community_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_courier_profile`
--

/*!50001 DROP VIEW IF EXISTS `vw_courier_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_courier_profile` AS select `c`.`courier_id` AS `courier_id`,`c`.`name` AS `courier_name`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`c`.`date_of_birth` AS `date_of_birth`,`c`.`address` AS `address`,`c`.`account_number` AS `account_number`,`c`.`nik` AS `nik`,`c`.`ktp_url` AS `ktp_url`,`c`.`kk_url` AS `kk_url`,`c`.`photo` AS `photo`,`c`.`is_verified` AS `is_verified`,`c`.`status` AS `status`,ifnull(`cp`.`total_points`,0) AS `total_points_collected`,`c`.`created_at` AS `created_at`,`c`.`updated_at` AS `updated_at` from (`courier` `c` left join `courier_points` `cp` on((`c`.`courier_id` = `cp`.`courier_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_management_profile`
--

/*!50001 DROP VIEW IF EXISTS `vw_management_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_management_profile` AS select `m`.`management_id` AS `management_id`,`m`.`name` AS `management_name`,`m`.`email` AS `email`,`m`.`phone` AS `phone`,`m`.`date_of_birth` AS `date_of_birth`,`m`.`address` AS `address`,`m`.`photo` AS `photo`,(case when (`m`.`is_verified` = 1) then 'YES' else 'NO' end) AS `is_active`,(case when (`m`.`is_admin` = 1) then 'YES' else 'NO' end) AS `is_admin`,`m`.`created_at` AS `created_at`,`m`.`updated_at` AS `updated_at` from `management` `m` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_10_couriers`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_10_couriers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_10_couriers` AS select `c`.`courier_id` AS `courier_id`,`c`.`name` AS `courier_name`,count(`pw`.`pickup_id`) AS `total_pickups` from (`courier` `c` join `pickup_waste` `pw` on((`c`.`courier_id` = `pw`.`courier_id`))) group by `c`.`courier_id` order by `total_pickups` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_10_waste_types`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_10_waste_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_10_waste_types` AS select `w`.`waste_name` AS `waste_name`,coalesce(sum(`pd`.`quantity`),0) AS `total_collected` from (`waste` `w` left join `pickup_detail` `pd` on((`w`.`waste_id` = `pd`.`waste_id`))) group by `w`.`waste_id` order by `total_collected` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_waste_and_points`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_waste_and_points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_waste_and_points` AS select sum(`pd`.`quantity`) AS `total_waste_collected`,sum(`pd`.`points`) AS `total_points_collected` from `pickup_detail` `pd` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_waste_points_per_category`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_waste_points_per_category` AS select `wt`.`waste_type_name` AS `waste_type_name`,coalesce(sum(`pd`.`quantity`),0) AS `total_waste_collected`,coalesce(sum(`pd`.`points`),0) AS `total_points_collected` from ((`waste_type` `wt` join `waste` `w` on((`wt`.`waste_type_id` = `w`.`waste_type_id`))) join `pickup_detail` `pd` on((`w`.`waste_id` = `pd`.`waste_id`))) group by `wt`.`waste_type_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_waste_points_per_district`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_district`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_waste_points_per_district` AS select `d`.`district_address` AS `district_address`,coalesce(sum(`pd`.`quantity`),0) AS `total_waste_collected`,coalesce(sum(`pd`.`points`),0) AS `total_points_collected` from ((`dropbox` `d` left join `pickup_waste` `pw` on((`d`.`dropbox_id` = `pw`.`dropbox_id`))) left join `pickup_detail` `pd` on((`pw`.`pickup_id` = `pd`.`pickup_id`))) group by `d`.`district_address` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_waste_points_per_dropbox`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_waste_points_per_dropbox`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_waste_points_per_dropbox` AS select `d`.`name` AS `dropbox_name`,coalesce(sum(`pd`.`quantity`),0) AS `total_waste_collected`,coalesce(sum(`pd`.`points`),0) AS `total_points_collected` from ((`dropbox` `d` left join `pickup_waste` `pw` on((`d`.`dropbox_id` = `pw`.`dropbox_id`))) left join `pickup_detail` `pd` on((`pw`.`pickup_id` = `pd`.`pickup_id`))) group by `d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_waste_type_category`
--

/*!50001 DROP VIEW IF EXISTS `vw_waste_type_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_waste_type_category` AS select `w`.`waste_id` AS `id`,`w`.`waste_name` AS `Name`,`wt`.`waste_type_name` AS `Waste Type`,`w`.`description` AS `Description` from (`waste` `w` join `waste_type` `wt` on((`w`.`waste_type_id` = `wt`.`waste_type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-03 23:07:35
