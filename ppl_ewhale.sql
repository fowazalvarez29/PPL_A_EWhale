-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ppl_transaction
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
  `phone` varchar(15) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Indri','indri@email.com','password1','08123456101','2000-01-01','Sumarecon',NULL,1,NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(2,'Agam','agam@email.com','password2','08123456102','2000-01-01','Tahura',NULL,0,NULL,NULL,'2024-11-06 13:39:20','2024-11-06 17:15:01'),(3,'Agung','agung@email.com','password3','08123456103','2000-01-01','Cihampelas',NULL,1,NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(4,'Adit','adit@email.com','password4','08123456104','2000-01-01','Cimahi',NULL,1,NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(5,'Gilman','gilman@email.com','password5','08123456105','2000-01-01','Cileunyi',NULL,0,NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20');
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
  `phone` varchar(15) NOT NULL,
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
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `nik` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT INTO `courier` VALUES (1,'Haykal','haykal@email.com','password1','08123456701','2000-01-01','Address 1','1234567891','1234567890123451',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(2,'Faqih','faqih@email.com','password2','08123456702','2000-01-01','Address 2','1234567892','1234567890123452',NULL,NULL,NULL,0,'Pending',NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(3,'Fowaz','fowaz@email.com','password3','08123456703','2000-01-01','Address 3','1234567893','1234567890123453',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(4,'Daffa','daffa@email.com','password4','08123456704','2000-01-01','Address 4','1234567894','1234567890123454',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20'),(5,'Ardhi','ardhi@email.com','password5','08123456705','2000-01-01','Address 5','1234567895','1234567890123455',NULL,NULL,NULL,1,'Approved',NULL,NULL,'2024-11-06 13:39:20','2024-11-06 13:39:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropbox`
--

LOCK TABLES `dropbox` WRITE;
/*!40000 ALTER TABLE `dropbox` DISABLE KEYS */;
INSERT INTO `dropbox` VALUES (1,'Dropbox 1','Jl. Example No.1','Bandung Utara',106.84559900,-6.20876300,10,'Available','2024-11-06 13:27:35','2024-11-06 17:07:44'),(2,'Dropbox 2','Jl. Example No.2','Bandung Selatan',106.84560000,-6.20876400,0,'Available','2024-11-06 13:27:35','2024-11-06 17:02:25'),(3,'Dropbox 3','Jl. Example No.3','Bandung Timur',106.84560100,-6.20876500,75,'Available','2024-11-06 13:27:35','2024-11-06 13:27:35'),(4,'Dropbox 4','Jl. Example No.4','Bandung Barat',106.84560200,-6.20876600,100,'Full','2024-11-06 13:27:35','2024-11-06 17:08:11'),(5,'Dropbox 5','Jl. Example No.5','Cimahi',106.84560300,-6.20876700,99,'Available','2024-11-06 13:27:35','2024-11-06 17:17:39');
/*!40000 ALTER TABLE `dropbox` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_dropbox_capacity` BEFORE UPDATE ON `dropbox` FOR EACH ROW BEGIN
    -- Jika kapasitas kurang dari 100, set status menjadi 'Available'
    IF NEW.capacity < 100 THEN
        SET NEW.status = 'Available';
    ELSE
        SET NEW.status = 'Full';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `phone` varchar(15) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `is_admin` tinyint(1) DEFAULT '0',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`management_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'Lutfi','lutfi@email.com','password1','2000-05-15','Jl. Mawar No. 1','085959666999',NULL,1,1,NULL,NULL,'2024-11-06 13:27:35','2024-11-06 13:27:35'),(2,'Fauzi','fauzi@email.com','password2','2000-08-22','Jl. Melati No. 2','08169696969',NULL,1,0,NULL,NULL,'2024-11-06 13:27:35','2024-11-06 13:27:35'),(3,'Malwi','malwi@email.com','password3','2000-12-10','Jl. Anggrek No. 3','085959666991',NULL,1,0,NULL,NULL,'2024-11-06 13:27:35','2024-11-06 13:27:35');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_check_courier_community_status` BEFORE INSERT ON `pickup_waste` FOR EACH ROW BEGIN
    -- Periksa apakah courier memenuhi syarat
    IF NEW.courier_id IS NOT NULL THEN
        IF NOT is_courier_verified(NEW.courier_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Courier Not Verified!';
        END IF;
    END IF;

    -- Periksa apakah community memenuhi syarat
    IF NEW.community_id IS NOT NULL THEN
        IF NOT is_community_verified(NEW.community_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "You're Not Verified!";
        END IF;
    END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_check_dropbox_capacity` BEFORE INSERT ON `pickup_waste` FOR EACH ROW BEGIN
    DECLARE dropbox_status ENUM('Full', 'Available');

    -- Mendapatkan status dropbox terkait
    SELECT status INTO dropbox_status
    FROM dropbox
    WHERE dropbox_id = NEW.dropbox_id;

    -- Jika status dropbox adalah 'Full', batalkan operasi
    IF dropbox_status = 'Full' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add pickup request: Dropbox is full.';
    END IF;
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
        SELECT SUM(points) INTO total_points
        FROM pickup_detail
        WHERE pickup_id = NEW.pickup_id;

        -- Update poin untuk community
        IF NEW.community_id IS NOT NULL THEN
            INSERT INTO community_points (community_id, total_points)
            VALUES (NEW.community_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = total_points + VALUES(total_points);
        END IF;

        -- Update total waste untuk courier
        IF NEW.courier_id IS NOT NULL THEN
            INSERT INTO courier_points (courier_id, total_points)
            VALUES (NEW.courier_id, total_points)
            ON DUPLICATE KEY UPDATE total_points = total_points + VALUES(total_points);
        END IF;
    END IF;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_dropbox_capacity` AFTER UPDATE ON `pickup_waste` FOR EACH ROW BEGIN
    DECLARE new_capacity INT;
    
    -- Periksa jika status berubah menjadi 'completed'
    IF NEW.pickup_status = 'completed' AND OLD.pickup_status <> 'completed' THEN
        -- Ambil kapasitas terbaru dari dropbox terkait dan tambahkan 1
        SELECT capacity + 1 INTO new_capacity
        FROM dropbox
        WHERE dropbox_id = NEW.dropbox_id;
        
        -- Perbarui kapasitas dan status pada tabel dropbox
        IF new_capacity >= 100 THEN
            UPDATE dropbox
            SET capacity = 100, status = 'Full'
            WHERE dropbox_id = NEW.dropbox_id;
        ELSE
            UPDATE dropbox
            SET capacity = new_capacity
            WHERE dropbox_id = NEW.dropbox_id;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_accepted_pickups`
--

DROP TABLE IF EXISTS `vw_accepted_pickups`;
/*!50001 DROP VIEW IF EXISTS `vw_accepted_pickups`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_accepted_pickups` AS SELECT 
 1 AS `pickup_id`,
 1 AS `community_name`,
 1 AS `courier_name`,
 1 AS `pickup_date`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `dropbox_name`*/;
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
-- Temporary view structure for view `vw_dropbox_status`
--

DROP TABLE IF EXISTS `vw_dropbox_status`;
/*!50001 DROP VIEW IF EXISTS `vw_dropbox_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dropbox_status` AS SELECT 
 1 AS `dropbox_id`,
 1 AS `dropbox_name`,
 1 AS `address`,
 1 AS `district_address`,
 1 AS `capacity`,
 1 AS `status`,
 1 AS `capacity_status`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_history_courier`
--

DROP TABLE IF EXISTS `vw_history_courier`;
/*!50001 DROP VIEW IF EXISTS `vw_history_courier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_history_courier` AS SELECT 
 1 AS `pickup_id`,
 1 AS `pickup_date`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `Drop Box Name`,
 1 AS `district_address`,
 1 AS `waste_type_names`,
 1 AS `waste_name`,
 1 AS `total_quantity`,
 1 AS `total_points`*/;
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
-- Temporary view structure for view `vw_pickup_requests`
--

DROP TABLE IF EXISTS `vw_pickup_requests`;
/*!50001 DROP VIEW IF EXISTS `vw_pickup_requests`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pickup_requests` AS SELECT 
 1 AS `pickup_id`,
 1 AS `community_name`,
 1 AS `pickup_date`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `dropbox_name`,
 1 AS `dropbox_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pickup_tracking`
--

DROP TABLE IF EXISTS `vw_pickup_tracking`;
/*!50001 DROP VIEW IF EXISTS `vw_pickup_tracking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pickup_tracking` AS SELECT 
 1 AS `pickup_id`,
 1 AS `community_name`,
 1 AS `courier_name`,
 1 AS `pickup_date`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `dropbox_name`,
 1 AS `request_date`,
 1 AS `last_updated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pickup_waste`
--

DROP TABLE IF EXISTS `vw_pickup_waste`;
/*!50001 DROP VIEW IF EXISTS `vw_pickup_waste`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pickup_waste` AS SELECT 
 1 AS `pickup_id`,
 1 AS `pickup_address`,
 1 AS `pickup_status`,
 1 AS `pickup_date`,
 1 AS `community_id`,
 1 AS `name`,
 1 AS `address`,
 1 AS `waste_id`,
 1 AS `waste_names`,
 1 AS `waste_image`,
 1 AS `waste_description`,
 1 AS `waste_type_id`,
 1 AS `waste_type_names`,
 1 AS `waste_type_images`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top_10_communities`
--

DROP TABLE IF EXISTS `vw_top_10_communities`;
/*!50001 DROP VIEW IF EXISTS `vw_top_10_communities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top_10_communities` AS SELECT 
 1 AS `community_id`,
 1 AS `community_name`,
 1 AS `total_pickups`*/;
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
INSERT INTO `waste` VALUES (1,'Washing Machine',50,1,NULL,'Large household appliance for washing clothes','2024-11-06 17:17:15','2024-11-06 17:17:15'),(2,'Hand Blender',10,2,NULL,'Compact blender for small-scale food preparation','2024-11-06 17:17:15','2024-11-06 17:17:15'),(3,'Laptop',25,3,NULL,'Portable computer device for work and entertainment','2024-11-06 17:17:15','2024-11-06 17:17:15'),(4,'Fluorescent Lamp',5,4,NULL,'Energy-saving fluorescent lighting device','2024-11-06 17:17:15','2024-11-06 17:17:15'),(5,'Electronic Toy Car',8,5,NULL,'Battery-powered electronic toy car for children','2024-11-06 17:17:15','2024-11-06 17:17:15'),(6,'LCD Monitor',20,6,NULL,'LCD monitor for computer displays','2024-11-06 17:17:15','2024-11-06 17:17:15'),(7,'Digital Camera',15,7,NULL,'Portable digital camera for capturing photos','2024-11-06 17:17:15','2024-11-06 17:17:15');
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
INSERT INTO `waste_type` VALUES (1,'Large Household Apllience',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(2,'Small Household Appliances',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(3,'IT Equipment',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(4,'Lamps',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(5,'Toys',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(6,'Screens and Monitors',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01'),(7,'Other Electronic Devices',NULL,'2024-11-06 17:17:01','2024-11-06 17:17:01');
/*!40000 ALTER TABLE `waste_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ppl_transaction'
--

--
-- Dumping routines for database 'ppl_transaction'
--
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
/*!50003 DROP FUNCTION IF EXISTS `funct_password_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funct_password_policy`(password VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE isValid INT DEFAULT 1;

    -- Cek panjang minimal 8 karakter
    IF LENGTH(password) < 8 THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan huruf kapital
    IF password NOT REGEXP '[A-Z]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan huruf kecil
    IF password NOT REGEXP '[a-z]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan angka
    IF password NOT REGEXP '[0-9]' THEN
        SET isValid = 0;
    END IF;

    -- Cek keberadaan karakter spesial
    IF password NOT REGEXP '[^a-zA-Z0-9]' THEN
        SET isValid = 0;
    END IF;

    RETURN isValid;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `funct_phone`(
    phone_input VARCHAR(15)
    ) RETURNS tinyint(1)
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
/*!50003 DROP FUNCTION IF EXISTS `is_community_verified` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_community_verified`(communityId INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE verified TINYINT;

    -- Pastikan query hanya mengembalikan satu baris
    SELECT is_verified INTO verified
    FROM community
    WHERE community_id = communityId
    LIMIT 1;

    -- Kembalikan TRUE jika community terverifikasi
    RETURN (verified = 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_courier_verified` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_courier_verified`(courierId INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE verified TINYINT;

    -- Pastikan query hanya mengembalikan satu baris
    SELECT is_verified INTO verified
    FROM courier
    WHERE courier_id = courierId
    LIMIT 1;

    -- Kembalikan TRUE jika courier terverifikasi
    RETURN (verified = 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_dropbox` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dropbox`(
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

    -- 1. Check apakah dropbox ada
    SELECT COUNT(*) INTO dropbox_exists
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox does not exist!';
    END IF;

    -- 2. Check apakah dropbox full
    SELECT capacity INTO dropbox_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_capacity >= 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox is full!';
    END IF;

    -- 3. Check apakah courier exists dan is verified
    SELECT COUNT(*) INTO courier_exists
    FROM courier
    WHERE courier_id = p_courier_id AND is_verified = 1 AND status = 'Approved';

    IF courier_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Courier is not verified or approved!';
    END IF;

    -- 4. Check apakah community exists dan is verified
    SELECT COUNT(*) INTO community_exists
    FROM community
    WHERE community_id = p_community_id AND is_verified = 1;

    IF community_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "You're not verified!";
    END IF;

    -- 5. Insert data into pickup_waste jika semua conditions terpenuhi
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
/*!50003 DROP PROCEDURE IF EXISTS `add_to_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_cart`(
    IN p_community_id INT,
    IN p_waste_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE existing_quantity INT DEFAULT 0;

    -- Check if the item already exists in the cart
    SELECT quantity INTO existing_quantity
    FROM pickup_detail
    WHERE community_id = p_community_id AND waste_id = p_waste_id;

    IF existing_quantity IS NOT NULL THEN
        -- Update the quantity if item exists
        UPDATE pickup_detail
        SET quantity = quantity + p_quantity
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    ELSE
        -- Insert new item if it does not exist
        INSERT INTO pickup_detail (community_id, waste_id, quantity)
        VALUES (p_community_id, p_waste_id, p_quantity);
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_waste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_waste`(
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    INSERT INTO waste (waste_name, point, waste_type_id, image, description)
    VALUES (p_waste_name, p_point, p_waste_type_id, p_image, p_description);
    SELECT 'Waste item added successfully.' AS result_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_waste_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_waste_type`(
    IN p_waste_type_name ENUM(
        'Large Household Appliance', 
        'Small Household Appliances', 
        'IT Equipment', 
        'Lamps', 
        'Toys', 
        'Screens and Monitors', 
        'Other Electronic Devices'),
    IN p_image VARCHAR(255)
)
BEGIN
    INSERT INTO waste_type (waste_type_name, image)
    VALUES (p_waste_type_name, p_image);
    SELECT 'Waste type added successfully.' AS result_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approval_management` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approval_management`(
    IN p_management_id INT
)
BEGIN
    -- Validasi jika management_id ada
    DECLARE id_exists INT;

    SELECT COUNT(*) INTO id_exists
    FROM management
    WHERE management_id = p_management_id;

    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Update status is_verified menjadi 1 untuk approval
        UPDATE management
        SET is_verified = 1
        WHERE management_id = p_management_id;

        -- Tampilkan pesan sukses
        SELECT 'Management user approved successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approve_community_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_community_registration`(
    IN p_community_id INT,
    IN p_approve TINYINT
)
BEGIN
    -- Jika p_approve = 1, set is_verified menjadi 1; jika p_approve = 0, set is_verified menjadi 0 (ditolak)
    UPDATE community
    SET is_verified = p_approve
    WHERE community_id = p_community_id;

    -- Kembalikan pesan sukses
    SELECT CASE 
        WHEN p_approve = 1 THEN 'Community registration approved successfully.'
        ELSE 'Community registration rejected.'
    END AS result_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approve_courier_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_courier_registration`(
    IN p_courier_id INT,
    IN p_approve ENUM('Pending', 'Approved', 'Reject')
)
BEGIN
    DECLARE is_files_complete BOOLEAN;

    -- Periksa kelengkapan berkas, yaitu NIK, ktp_url, dan kk_url harus tidak NULL
    SET is_files_complete = (SELECT 
        CASE 
            WHEN nik IS NOT NULL AND ktp_url IS NOT NULL AND kk_url IS NOT NULL THEN TRUE 
            ELSE FALSE 
        END
    FROM courier
    WHERE courier_id = p_courier_id);

    -- Jika berkas lengkap, lanjutkan dengan update status
    IF is_files_complete THEN
        UPDATE courier
        SET status = p_approve,
            is_verified = IF(p_approve = 'Approved', 1, 0)
        WHERE courier_id = p_courier_id;
        
        -- Kembalikan pesan sukses
        SELECT CASE 
            WHEN p_approve = 'Approved' THEN 'Courier registration approved successfully.'
            WHEN p_approve = 'Reject' THEN 'Courier registration rejected.'
            ELSE 'Courier registration set to pending.'
        END AS result_message;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Courier documents are incomplete. Please check NIK, KTP URL, and KK URL.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_community` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_community`(
    IN p_community_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel community
    SELECT COUNT(*) INTO id_exists
    FROM community
    WHERE community_id = p_community_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data community berdasarkan ID
        DELETE FROM community
        WHERE community_id = p_community_id;

        -- Tampilkan pesan sukses
        SELECT 'Community member deleted successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_courier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_courier`(
    IN p_courier_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel courier
    SELECT COUNT(*) INTO id_exists
    FROM courier
    WHERE courier_id = p_courier_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data courier berdasarkan ID
        DELETE FROM courier
        WHERE courier_id = p_courier_id;

        -- Tampilkan pesan sukses
        SELECT 'Courier deleted successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_dropbox` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dropbox`(
    IN p_dropbox_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM dropbox WHERE dropbox_id = p_dropbox_id) THEN
        DELETE FROM dropbox WHERE dropbox_id = p_dropbox_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox not found';
    END IF;

    ALTER TABLE dropbox AUTO_INCREMENT = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_management` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_management`(
    IN p_management_id INT
)
BEGIN
    -- Variabel untuk memvalidasi keberadaan ID
    DECLARE id_exists INT;

    -- Mengecek apakah ID ada dalam tabel management
    SELECT COUNT(*) INTO id_exists
    FROM management
    WHERE management_id = p_management_id;

    -- Jika ID tidak ditemukan, berikan pesan kesalahan
    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Hapus data management berdasarkan ID
        DELETE FROM management
        WHERE management_id = p_management_id;

        -- Tampilkan pesan sukses
        SELECT 'Management user deleted successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_waste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_waste`(
    IN p_waste_id INT
)
BEGIN
    DECLARE waste_exists INT;

    -- Cek apakah waste_id ada
    SELECT COUNT(*) INTO waste_exists
    FROM waste
    WHERE waste_id = p_waste_id;

    IF waste_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        DELETE FROM waste
        WHERE waste_id = p_waste_id;
        SELECT 'Waste item deleted successfully.' AS result_message;
        ALTER TABLE waste AUTO_INCREMENT = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_waste_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_waste_type`(
    IN p_waste_type_id INT
)
BEGIN
    DECLARE waste_type_exists INT;

    -- Cek apakah waste_type_id ada
    SELECT COUNT(*) INTO waste_type_exists
    FROM waste_type
    WHERE waste_type_id = p_waste_type_id;

    IF waste_type_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        DELETE FROM waste_type
        WHERE waste_type_id = p_waste_type_id;
        SELECT 'Waste type deleted successfully.' AS result_message;
        ALTER TABLE waste_type AUTO_INCREMENT = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manage_waste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_waste`(
    IN p_action ENUM('add', 'update', 'delete'),
    IN p_waste_id INT,
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    CASE p_action
        WHEN 'add' THEN
            INSERT INTO waste (waste_name, point, waste_type_id, image, description)
            VALUES (p_waste_name, p_point, p_waste_type_id, p_image, p_description);
            SELECT 'Waste item added successfully.' AS result_message;

        WHEN 'update' THEN
            UPDATE waste
            SET waste_name = p_waste_name,
                point = p_point,
                waste_type_id = p_waste_type_id,
                image = p_image,
                description = p_description
            WHERE waste_id = p_waste_id;
            SELECT 'Waste item updated successfully.' AS result_message;

        WHEN 'delete' THEN
            DELETE FROM waste
            WHERE waste_id = p_waste_id;
            SELECT 'Waste item deleted successfully.' AS result_message;

        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid action.';
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manage_waste_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manage_waste_type`(
    IN p_action ENUM('add', 'update', 'delete'),
    IN p_waste_type_id INT,
    IN p_waste_type_name ENUM(
        'Large Household Appliance', 
        'Small Household Appliances', 
        'IT Equipment', 
        'Lamps', 
        'Toys', 
        'Screens and Monitors', 
        'Other Electronic Devices'),
    IN p_image VARCHAR(255)
)
BEGIN
    CASE p_action
        WHEN 'add' THEN
            INSERT INTO waste_type (waste_type_name, image)
            VALUES (p_waste_type_name, p_image);
            SELECT 'Waste type added successfully.' AS result_message;

        WHEN 'update' THEN
            UPDATE waste_type
            SET waste_type_name = p_waste_type_name,
                image = p_image
            WHERE waste_type_id = p_waste_type_id;
            SELECT 'Waste type updated successfully.' AS result_message;

        WHEN 'delete' THEN
            DELETE FROM waste_type
            WHERE waste_type_id = p_waste_type_id;
            SELECT 'Waste type deleted successfully.' AS result_message;
            ALTER TABLE waste_type AUTO_INCREMENT = 1;

        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid action.';
    END CASE;
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
    DECLARE pass_valid TINYINT(1);
    
    -- Validasi Email
    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Validasi Nomor Telepon
    SET phone_valid = funct_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
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
    DECLARE pass_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    DECLARE phone_exists INT;

    -- Validasi Email
    SET email_valid = funct_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
    END IF;

    -- Validasi Nomor Telepon
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
    DECLARE pass_valid TINYINT(1);
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

    -- Validasi Password
    SET pass_valid = funct_password_policy(p_password);
    IF pass_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must contain at least 8 characters and include Upercase, Lowercase, Number and Special Character!';
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
        is_active, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_date_of_birth, p_address, p_phone, p_photo,
        1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_from_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_from_cart`(
    IN p_community_id INT,
    IN p_waste_id INT
)
BEGIN
    -- Remove item from cart
    DELETE FROM pickup_detail
    WHERE community_id = p_community_id AND waste_id = p_waste_id;

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
/*!50003 DROP PROCEDURE IF EXISTS `set_as_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_as_admin`(
    IN p_management_id INT
)
BEGIN
    -- Validasi jika management_id ada
    DECLARE id_exists INT;

    SELECT COUNT(*) INTO id_exists
    FROM management
    WHERE management_id = p_management_id;

    IF id_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Id not found!';
    ELSE
        -- Update status is_admin menjadi 1 untuk menjadikan admin
        UPDATE management
        SET is_admin = 1
        WHERE management_id = p_management_id;

        -- Tampilkan pesan sukses
        SELECT 'Management user set as admin successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cart_quantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cart_quantity`(
    IN p_community_id INT,
    IN p_waste_id INT,
    IN p_quantity INT
)
BEGIN
    IF new_quantity > 0 THEN
        -- Update quantity if new quantity is greater than zero
        UPDATE pickup_detail
        SET quantity = p_quantity
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    ELSE
        -- Remove item if new quantity is zero or less
        DELETE FROM pickup_detail
        WHERE community_id = p_community_id AND waste_id = p_waste_id;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_courier_documents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_courier_documents`(
    IN p_courier_id INT,
    IN p_ktp_url VARCHAR(255),
    IN p_kk_url VARCHAR(255)
)
BEGIN
    DECLARE message VARCHAR(255);

    -- Periksa apakah courier_id ada dalam tabel
    IF EXISTS (SELECT 1 FROM courier WHERE courier_id = p_courier_id) THEN
        -- Update dokumen KTP dan KK
        UPDATE courier
        SET 
            ktp_url = p_ktp_url,
            kk_url = p_kk_url,
            status = 'Pending'  -- Set status menjadi Pending untuk validasi ulang
        WHERE 
            courier_id = p_courier_id;

        -- Pesan sukses
        SET message = 'Document has been successfully uploaded';
    ELSE
        -- Jika courier_id tidak ditemukan, kembalikan pesan error
        SET message = 'Courier ID not found!';
    END IF;

    -- Kembalikan pesan hasil
    SELECT message AS result_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dropbox` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dropbox`(
    IN p_dropbox_id INT,
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(255),
    IN p_district_address ENUM('Bandung Utara', 'Bandung Selatan', 'Bandung Timur', 'Bandung Barat', 'Cimahi', 'Kabupaten Bandung', 'Kabupaten Bandung Barat'),
    IN p_longitude DECIMAL(11, 8),
    IN p_latitude DECIMAL(11, 8),
    IN p_capacity INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM dropbox WHERE dropbox_id = p_dropbox_id) THEN
        IF p_capacity <= 150 THEN
            UPDATE dropbox
            SET name = p_name,
                address = p_address,
                district_address = p_district_address,
                longitude = p_longitude,
                latitude = p_latitude,
                capacity = p_capacity,
                status = CASE WHEN p_capacity >= 100 THEN 'Full' ELSE 'Available' END
            WHERE dropbox_id = p_dropbox_id;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Capacity cannot exceed 150';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Dropbox not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dropbox_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dropbox_capacity`(
    IN p_dropbox_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE new_capacity INT;
    
    -- Ambil kapasitas saat ini dari dropbox
    SELECT capacity INTO new_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;
    
    -- Tambahkan atau kurangi kapasitas berdasarkan p_quantity
    SET new_capacity = new_capacity + p_quantity;
    
    -- Pastikan kapasitas tidak melebihi batas maksimum (100) atau kurang dari 0
    IF new_capacity > 100 THEN
        SET new_capacity = 100;
    ELSEIF new_capacity < 0 THEN
        SET new_capacity = 0;
    END IF;

    -- Perbarui kapasitas pada dropbox
    UPDATE dropbox
    SET capacity = new_capacity
    WHERE dropbox_id = p_dropbox_id;
    
    -- Perbarui status sesuai dengan kapasitas baru
    IF new_capacity >= 100 THEN
        UPDATE dropbox
        SET status = 'Full'
        WHERE dropbox_id = p_dropbox_id;
    ELSE
        UPDATE dropbox
        SET status = 'Available'
        WHERE dropbox_id = p_dropbox_id;
    END IF;
    
    -- Tampilkan pesan berhasil
    SELECT CONCAT('Dropbox capacity updated to ', new_capacity, ' and status set to ', 
                  IF(new_capacity >= 100, 'Full', 'Available')) AS result_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_waste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_waste`(
    IN p_waste_id INT,
    IN p_waste_name VARCHAR(255),
    IN p_point INT,
    IN p_waste_type_id INT,
    IN p_image VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    DECLARE waste_exists INT;

    -- Cek apakah waste_id ada
    SELECT COUNT(*) INTO waste_exists
    FROM waste
    WHERE waste_id = p_waste_id;

    IF waste_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        UPDATE waste
        SET waste_name = p_waste_name,
            point = p_point,
            waste_type_id = p_waste_type_id,
            image = p_image,
            description = p_description
        WHERE waste_id = p_waste_id;
        SELECT 'Waste item updated successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_waste_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_waste_type`(
    IN p_waste_type_id INT,
    IN p_waste_type_name ENUM(
        'Large Household Appliance', 
        'Small Household Appliances',
        'IT Equipment', 
        'Lamps', 
        'Toys', 
        'Screens and Monitors', 
        'Other Electronic Devices'),
    IN p_image VARCHAR(255)
)
BEGIN
    DECLARE waste_type_exists INT;

    -- Cek apakah waste_type_id ada
    SELECT COUNT(*) INTO waste_type_exists
    FROM waste_type
    WHERE waste_type_id = p_waste_type_id;

    IF waste_type_exists = 0 THEN
        SELECT 'Id not found!' AS result_message;
    ELSE
        UPDATE waste_type
        SET waste_type_name = p_waste_type_name,
            image = p_image
        WHERE waste_type_id = p_waste_type_id;
        SELECT 'Waste type updated successfully.' AS result_message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_accepted_pickups`
--

/*!50001 DROP VIEW IF EXISTS `vw_accepted_pickups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_accepted_pickups` AS select `pw`.`pickup_id` AS `pickup_id`,`c`.`name` AS `community_name`,`co`.`name` AS `courier_name`,`pw`.`pickup_date` AS `pickup_date`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`d`.`name` AS `dropbox_name` from (((`pickup_waste` `pw` join `community` `c` on((`pw`.`community_id` = `c`.`community_id`))) join `courier` `co` on((`pw`.`courier_id` = `co`.`courier_id`))) left join `dropbox` `d` on((`pw`.`dropbox_id` = `d`.`dropbox_id`))) where (`pw`.`pickup_status` = 'accepted') */;
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
/*!50001 VIEW `vw_community_profile` AS select `cm`.`community_id` AS `community_id`,`cm`.`name` AS `community_name`,`cm`.`email` AS `email`,`cm`.`phone` AS `phone`,`cm`.`date_of_birth` AS `date_of_birth`,`cm`.`address` AS `address`,`cm`.`photo` AS `photo`,`cm`.`is_verified` AS `is_verified`,ifnull(sum(`cp`.`total_points`),0) AS `total_points_collected`,`cm`.`created_at` AS `created_at`,`cm`.`updated_at` AS `updated_at` from (`community` `cm` left join `community_points` `cp` on((`cm`.`community_id` = `cp`.`community_id`))) group by `cm`.`community_id`,`cm`.`name`,`cm`.`email`,`cm`.`phone`,`cm`.`date_of_birth`,`cm`.`address`,`cm`.`photo`,`cm`.`is_verified`,`cm`.`created_at`,`cm`.`updated_at` */;
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
/*!50001 VIEW `vw_courier_profile` AS select `c`.`courier_id` AS `courier_id`,`c`.`name` AS `courier_name`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`c`.`date_of_birth` AS `date_of_birth`,`c`.`address` AS `address`,`c`.`account_number` AS `account_number`,`c`.`nik` AS `nik`,`c`.`ktp_url` AS `ktp_url`,`c`.`kk_url` AS `kk_url`,`c`.`photo` AS `photo`,`c`.`is_verified` AS `is_verified`,`c`.`status` AS `status`,ifnull(sum(`cp`.`total_points`),0) AS `total_points_collected`,`c`.`created_at` AS `created_at`,`c`.`updated_at` AS `updated_at` from (`courier` `c` left join `courier_points` `cp` on((`c`.`courier_id` = `cp`.`courier_id`))) group by `c`.`courier_id`,`c`.`name`,`c`.`email`,`c`.`phone`,`c`.`date_of_birth`,`c`.`address`,`c`.`account_number`,`c`.`nik`,`c`.`ktp_url`,`c`.`kk_url`,`c`.`photo`,`c`.`is_verified`,`c`.`status`,`c`.`created_at`,`c`.`updated_at` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dropbox_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_dropbox_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dropbox_status` AS select `dropbox`.`dropbox_id` AS `dropbox_id`,`dropbox`.`name` AS `dropbox_name`,`dropbox`.`address` AS `address`,`dropbox`.`district_address` AS `district_address`,`dropbox`.`capacity` AS `capacity`,`dropbox`.`status` AS `status`,(case when (`dropbox`.`capacity` >= 100) then 'Full' else 'Available' end) AS `capacity_status`,`dropbox`.`created_at` AS `created_at`,`dropbox`.`updated_at` AS `updated_at` from `dropbox` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_history_courier`
--

/*!50001 DROP VIEW IF EXISTS `vw_history_courier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_history_courier` AS select `pw`.`pickup_id` AS `pickup_id`,`pw`.`pickup_date` AS `pickup_date`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`db`.`name` AS `Drop Box Name`,`db`.`district_address` AS `district_address`,group_concat(distinct `wt`.`waste_type_name` separator ',') AS `waste_type_names`,group_concat(distinct `w`.`waste_name` separator ',') AS `waste_name`,group_concat(distinct `pd`.`quantity` separator ',') AS `total_quantity`,group_concat(distinct `pd`.`points` separator ',') AS `total_points` from ((((`pickup_detail` `pd` join `pickup_waste` `pw` on((`pd`.`pickup_id` = `pw`.`pickup_id`))) join `waste` `w` on((`pd`.`waste_id` = `w`.`waste_id`))) join `waste_type` `wt` on((`w`.`waste_type_id` = `wt`.`waste_type_id`))) join `dropbox` `db` on((`pw`.`dropbox_id` = `db`.`dropbox_id`))) group by `pw`.`pickup_id`,`pw`.`pickup_date`,`pw`.`pickup_address`,`pw`.`pickup_status`,`db`.`name`,`db`.`district_address` order by `pw`.`pickup_date` desc */;
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
-- Final view structure for view `vw_pickup_requests`
--

/*!50001 DROP VIEW IF EXISTS `vw_pickup_requests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pickup_requests` AS select `pw`.`pickup_id` AS `pickup_id`,`c`.`name` AS `community_name`,`pw`.`pickup_date` AS `pickup_date`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`d`.`name` AS `dropbox_name`,`d`.`address` AS `dropbox_address` from ((`pickup_waste` `pw` join `community` `c` on((`pw`.`community_id` = `c`.`community_id`))) left join `dropbox` `d` on((`pw`.`dropbox_id` = `d`.`dropbox_id`))) where (`pw`.`pickup_status` = 'pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pickup_tracking`
--

/*!50001 DROP VIEW IF EXISTS `vw_pickup_tracking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pickup_tracking` AS select `pw`.`pickup_id` AS `pickup_id`,`c`.`name` AS `community_name`,`co`.`name` AS `courier_name`,`pw`.`pickup_date` AS `pickup_date`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`d`.`name` AS `dropbox_name`,`pw`.`created_at` AS `request_date`,`pw`.`updated_at` AS `last_updated` from (((`pickup_waste` `pw` join `community` `c` on((`pw`.`community_id` = `c`.`community_id`))) left join `courier` `co` on((`pw`.`courier_id` = `co`.`courier_id`))) left join `dropbox` `d` on((`pw`.`dropbox_id` = `d`.`dropbox_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pickup_waste`
--

/*!50001 DROP VIEW IF EXISTS `vw_pickup_waste`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pickup_waste` AS select `pw`.`pickup_id` AS `pickup_id`,`pw`.`pickup_address` AS `pickup_address`,`pw`.`pickup_status` AS `pickup_status`,`pw`.`pickup_date` AS `pickup_date`,`cm`.`community_id` AS `community_id`,`cm`.`name` AS `name`,`cm`.`address` AS `address`,group_concat(distinct `w`.`waste_id` separator ',') AS `waste_id`,group_concat(distinct `w`.`waste_name` separator ',') AS `waste_names`,group_concat(distinct `w`.`image` separator ',') AS `waste_image`,group_concat(distinct `w`.`description` separator ',') AS `waste_description`,group_concat(distinct `wt`.`waste_type_id` separator ',') AS `waste_type_id`,group_concat(distinct `wt`.`waste_type_name` separator ',') AS `waste_type_names`,group_concat(distinct `wt`.`image` separator ',') AS `waste_type_images` from (((((`pickup_detail` `pd` join `pickup_waste` `pw` on((`pd`.`pickup_id` = `pw`.`pickup_id`))) join `waste` `w` on((`pd`.`waste_id` = `w`.`waste_id`))) join `waste_type` `wt` on((`w`.`waste_type_id` = `wt`.`waste_type_id`))) join `dropbox` `db` on((`pw`.`dropbox_id` = `db`.`dropbox_id`))) join `community` `cm` on((`pw`.`community_id` = `cm`.`community_id`))) group by `pw`.`pickup_id`,`pw`.`pickup_date`,`pw`.`pickup_address`,`pw`.`pickup_status`,`db`.`name`,`db`.`district_address` order by `pw`.`pickup_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top_10_communities`
--

/*!50001 DROP VIEW IF EXISTS `vw_top_10_communities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top_10_communities` AS select `cm`.`community_id` AS `community_id`,`cm`.`name` AS `community_name`,count(`pw`.`pickup_id`) AS `total_pickups` from (`community` `cm` join `pickup_waste` `pw` on((`cm`.`community_id` = `pw`.`community_id`))) group by `cm`.`community_id` order by `total_pickups` desc limit 10 */;
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

-- Dump completed on 2024-11-07  0:18:04
