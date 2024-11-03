-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2024 at 05:57 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppl_transaction`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `01_register_courier` (IN `p_name` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_password` VARCHAR(255), IN `p_phone` VARCHAR(15), IN `p_date_of_birth` DATE, IN `p_address` VARCHAR(255), IN `p_nik` VARCHAR(255), IN `p_account_number` VARCHAR(50), IN `p_ktp_url` VARCHAR(255), IN `p_kk_url` VARCHAR(255), IN `p_photo` VARCHAR(255))   BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    -- DECLARE phone_exists INT;

    -- Check email format
    SET email_valid = func_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Check phone format
    SET phone_valid = func_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Check if email already exists
    SELECT COUNT(*) INTO email_exists
    FROM courier
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Check if phone number already exists
    -- SELECT COUNT(*) INTO phone_exists
    -- FROM courier
    -- WHERE phone = p_phone;

    -- IF phone_exists > 0 THEN
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    -- END IF;

    -- Insert new courier if all checks pass
    INSERT INTO courier (
        name, email, password, phone, date_of_birth, address,
        nik, account_number, ktp_url, kk_url, photo, is_verified, is_active,
        created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_nik, p_account_number, p_ktp_url, p_kk_url, p_photo, 0, 1,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `02_register_community` (IN `p_name` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_password` VARCHAR(255), IN `p_phone` VARCHAR(15), IN `p_date_of_birth` DATE, IN `p_address` VARCHAR(255), IN `p_photo` VARCHAR(255))   BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;

    -- Check email format
    SET email_valid = func_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Check phone format
    SET phone_valid = func_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Check if email jika sudah ada
    SELECT COUNT(*) INTO email_exists
    FROM community
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Insert new community jika semua CHECK terpenuhi
    INSERT INTO community (
        name, email, password, phone, date_of_birth, address,
        photo, is_verified, created_at, updated_at
    ) VALUES (
        p_name, p_email, p_password, p_phone, p_date_of_birth, p_address,
        p_photo, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `03_register_management` (IN `p_name` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_password` VARCHAR(50), IN `p_date_of_birth` DATE, IN `p_address` VARCHAR(255), IN `p_phone` VARCHAR(15), IN `p_photo` VARCHAR(255))   BEGIN
    DECLARE email_valid TINYINT(1);
    DECLARE phone_valid TINYINT(1);
    DECLARE email_exists INT;
    -- DECLARE phone_exists INT; 

    -- Check email format
    SET email_valid = func_email_format(p_email);
    IF email_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;

    -- Check phone format
    SET phone_valid = func_phone(p_phone);
    IF phone_valid = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number can only contain numbers';
    END IF;

    -- Check if email already exists
    SELECT COUNT(*) INTO email_exists
    FROM management
    WHERE email = p_email;
    
    IF email_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is already registered';
    END IF;

    -- Check if phone number already exists
    -- SELECT COUNT(*) INTO phone_exists
    -- FROM management
    -- WHERE phone = p_phone;

    -- IF phone_exists > 0 THEN
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number is already registered';
    -- END IF;

    -- Insert new management record if all checks pass
    -- Masukkan data ke tabel management
        INSERT INTO management (
            name, email, password, date_of_birth, address, phone, photo)
        VALUES (
            p_name, p_email, p_password, p_date_of_birth, p_address, p_phone, p_photo);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `04_register_dropbox` (IN `p_name` VARCHAR(50), IN `p_address` VARCHAR(50), IN `p_longitude` VARCHAR(255), IN `p_latitude` VARCHAR(255), IN `p_capacity` INT)   BEGIN
    DECLARE name_exists INT;
    DECLARE address_exists INT;

    -- Check if dropbox name already exists
    SELECT COUNT(*) INTO name_exists
    FROM dropbox
    WHERE name = p_name;
    
    IF name_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox name is already registered';
    END IF;

    -- Check if dropbox address already exists
    SELECT COUNT(*) INTO address_exists
    FROM dropbox
    WHERE address = p_address;

    IF address_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dropbox address is already registered';
    END IF;

    -- Insert new dropbox record if all checks pass
    INSERT INTO dropbox (
        name, address, longitude, latitude, capacity, status, created_at, updated_at
    ) VALUES (
        p_name, p_address, p_longitude, p_latitude, 
        IF(p_capacity BETWEEN 0 AND 1000, p_capacity, 0), -- Ensure capacity is within 0-1000
        'Available', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `05_add_pickup_waste` (IN `p_pickup_date` DATE, IN `p_pickup_address` VARCHAR(255), IN `p_district_address` ENUM('Bandung Utara','Bandung Selatan','Bandung Timur','Bandung Barat','Cimahi','Kabupaten Bandung','Kabupaten Bandung Barat'), IN `p_dropbox_id` INT, IN `p_courier_id` INT, IN `p_community_id` INT)   BEGIN
    DECLARE dropbox_capacity INT;
    DECLARE courier_verified TINYINT(1);
    DECLARE community_verified TINYINT(1);


    -- 1. Check apakah drop box full?
    SELECT capacity INTO dropbox_capacity
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    IF dropbox_capacity >= 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Drop box is full!';
    END IF;

    -- 2. Verifikasi kurir apakah verified?
    SELECT is_verified INTO courier_verified
    FROM courier
    WHERE courier_id = p_courier_id AND is_active = 1;

    IF courier_verified = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Courier is not verified or inactive!';
    END IF;

    -- 3. Verifikasi community apakah verified?
    SELECT is_verified INTO community_verified
    FROM community
    WHERE community_id = p_community_id;

    IF community_verified = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Community is not verified!';
    END IF;

    -- 4. Insert data into pickup_waste jika semua kondisi terpenuhi
    INSERT INTO pickup_waste (pickup_date, pickup_address, district_address, dropbox_id, courier_id, community_id, pickup_status)
    VALUES (p_pickup_date, p_pickup_address, p_district_address, p_dropbox_id, p_courier_id, p_community_id, 'pending');

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `01_funct_email_format` (`email_input` VARCHAR(255)) RETURNS TINYINT(1) DETERMINISTIC BEGIN
    -- Memeriksa format email.
    -- Memastikan ada teks sebelum '@', diikuti oleh domain, dan ekstensi
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF email_input REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `02_funct_phone` (`phone_input` VARCHAR(15)) RETURNS TINYINT(1) DETERMINISTIC BEGIN
    -- Menggunakan regex untuk memastikan input hanya terdiri dari angka 0-9
    DECLARE is_valid TINYINT(1) DEFAULT 0;

    IF phone_input REGEXP '^[0-9]+$' THEN
        SET is_valid = 1;
    END IF;

    RETURN is_valid;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `03_funct_check_dropbox_status` (`p_dropbox_id` INT) RETURNS VARCHAR(50) CHARSET utf8mb4 DETERMINISTIC BEGIN
    DECLARE status VARCHAR(50);

    -- Ambil status dari tabel dropbox berdasarkan dropbox_id
    SELECT status INTO status
    FROM dropbox
    WHERE dropbox_id = p_dropbox_id;

    RETURN status;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE `community` (
  `community_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`community_id`, `name`, `email`, `password`, `phone`, `date_of_birth`, `address`, `photo`, `is_verified`, `otp_code`, `otp_expiry`, `created_at`, `updated_at`) VALUES
(1, 'Indri', 'indri@email.com', 'password1', '08123456101', '2000-01-01', 'Sumarecon', NULL, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(2, 'Agam', 'agam@email.com', 'password2', '08123456102', '2000-01-01', 'Tahura', NULL, 0, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(3, 'Agung', 'agung@email.com', 'password3', '08123456103', '2000-01-01', 'Cihampelas', NULL, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(4, 'Adit', 'adit@email.com', 'password4', '08123456104', '2000-01-01', 'Cimahi', NULL, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(5, 'Gilman', 'gilman@email.com', 'password5', '08123456105', '2000-01-01', 'Cileunyi', NULL, 0, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(6, 'Amran', 'amran@example.com', 'securepassword', '081234567891', '1990-08-20', 'Bougenville 7, Bandung', 'http://example.com/photo.jpg', 0, NULL, NULL, '2024-11-03 03:58:26', '2024-11-03 03:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `community_points`
--

CREATE TABLE `community_points` (
  `points_id` int NOT NULL,
  `community_id` int DEFAULT NULL,
  `total_points` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `ktp_url` varchar(255) DEFAULT NULL,
  `kk_url` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `name`, `email`, `password`, `phone`, `date_of_birth`, `address`, `account_number`, `nik`, `ktp_url`, `kk_url`, `photo`, `is_verified`, `is_active`, `otp_code`, `otp_expiry`, `created_at`, `updated_at`) VALUES
(1, 'Haykal', 'haykal@email.com', 'password1', '08123456701', '2000-01-01', 'Address 1', '1234567891', '1234567890123451', NULL, NULL, NULL, 1, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(2, 'Faqih', 'faqih@email.com', 'password2', '08123456702', '2000-01-01', 'Address 2', '1234567892', '1234567890123452', NULL, NULL, NULL, 0, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(3, 'Fowaz', 'fowaz@email.com', 'password3', '08123456703', '2000-01-01', 'Address 3', '1234567893', '1234567890123453', NULL, NULL, NULL, 1, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(4, 'Daffa', 'daffa@email.com', 'password4', '08123456704', '2000-01-01', 'Address 4', '1234567894', '1234567890123454', NULL, NULL, NULL, 1, 0, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(5, 'Ardhi', 'ardhi@email.com', 'password5', '08123456705', '2000-01-01', 'Address 5', '1234567895', '1234567890123455', NULL, NULL, NULL, 1, 1, NULL, NULL, '2024-11-03 03:23:29', '2024-11-03 03:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `courier_points`
--

CREATE TABLE `courier_points` (
  `points_id` int NOT NULL,
  `courier_id` int DEFAULT NULL,
  `total_waste` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `dropbox`
--

CREATE TABLE `dropbox` (
  `dropbox_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `capacity` int DEFAULT '0',
  `status` enum('Full','Available') DEFAULT 'Available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `dropbox`
--

INSERT INTO `dropbox` (`dropbox_id`, `name`, `address`, `longitude`, `latitude`, `capacity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dropbox 1', 'Bandung Utara', '106.84559900', '-6.20876300', 500, 'Available', '2024-11-03 03:23:29', '2024-11-03 05:38:18'),
(2, 'Dropbox 2', 'Bandung Selatan', '106.84560000', '-6.20876400', 750, 'Available', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(3, 'Dropbox 3', 'Bandung Timur', '106.84560100', '-6.20876500', 250, 'Available', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(4, 'Dropbox 4', 'Bandung Barat', '106.84560200', '-6.20876600', 1000, 'Full', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(5, 'Dropbox 5', 'Cimahi', '106.84560300', '-6.20876700', 600, 'Available', '2024-11-03 03:23:29', '2024-11-03 03:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `management_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`management_id`, `name`, `email`, `password`, `date_of_birth`, `address`, `phone`, `photo`, `is_active`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'Lutfi', 'lutfi@email.com', 'password1', '2000-05-15', 'Jl. Mawar No. 1', '085969696969', NULL, 1, 1, '2024-11-03 03:23:29', '2024-11-03 03:50:25'),
(2, 'Fauzi', 'fauzi@email.com', 'password2', '2000-08-22', 'Jl. Melati No. 2', '0859666666', NULL, 1, 0, '2024-11-03 03:23:29', '2024-11-03 03:50:39'),
(3, 'Malwi', 'malwi@email.com', 'password3', '2000-12-10', 'Jl. Anggrek No. 3', '085966666671', NULL, 1, 0, '2024-11-03 03:23:29', '2024-11-03 03:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_detail`
--

CREATE TABLE `pickup_detail` (
  `pickup_id` int NOT NULL,
  `waste_id` int NOT NULL,
  `quantity` int DEFAULT '0',
  `points` int DEFAULT '0'
) ;

--
-- Triggers `pickup_detail`
--
DELIMITER $$
CREATE TRIGGER `01_tr_pickup_detail` BEFORE INSERT ON `pickup_detail` FOR EACH ROW BEGIN
    DECLARE waste_point INT;

    -- Mendapatkan point dari tabel waste berdasarkan waste_id yang dimasukkan
    SELECT point INTO waste_point
    FROM waste
    WHERE waste_id = NEW.waste_id;

    -- Menghitung total points berdasarkan quantity dan point dari waste
    SET NEW.points = waste_point * NEW.quantity;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `02_tr_dropbox_capacity` AFTER INSERT ON `pickup_detail` FOR EACH ROW BEGIN
    DECLARE new_capacity INT;

    -- Mengambil kapasitas terbaru dari dropbox yang terkait
    SELECT capacity + NEW.quantity INTO new_capacity
    FROM dropbox
    WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);

    -- Memperbarui kapasitas dan status pada tabel dropbox
    IF new_capacity >= 1000 THEN
        UPDATE dropbox
        SET capacity = 1000, status = 'Full'
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    ELSE
        UPDATE dropbox
        SET capacity = new_capacity
        WHERE dropbox_id = (SELECT dropbox_id FROM pickup_waste WHERE pickup_id = NEW.pickup_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_waste`
--

CREATE TABLE `pickup_waste` (
  `pickup_id` int NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_address` varchar(255) NOT NULL,
  `district_address` enum('Bandung Utara','Bandung Selatan','Bandung Timur','Bandung Barat','Cimahi','Kabupaten Bandung','Kabupaten Bandung Barat') DEFAULT NULL,
  `pickup_status` enum('pending','accepted','completed','cancelled') DEFAULT 'pending',
  `dropbox_id` int DEFAULT NULL,
  `courier_id` int DEFAULT NULL,
  `community_id` int DEFAULT NULL,
  `management_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `pickup_waste`
--
DELIMITER $$
CREATE TRIGGER `03_tr_pickup_dropbox` BEFORE INSERT ON `pickup_waste` FOR EACH ROW BEGIN
    DECLARE dropbox_status VARCHAR(50);

    -- Mengambil status dropbox menggunakan fungsi check_dropbox_status
    SET dropbox_status = check_dropbox_status(NEW.dropbox_id);

    -- Jika status dropbox adalah 'Full', batalkan operasi INSERT dengan pesan error
    IF dropbox_status = 'Full' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Drop box is Full!';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `04_tr_points_courier_community` AFTER UPDATE ON `pickup_waste` FOR EACH ROW BEGIN
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
            INSERT INTO courier_points (courier_id, total_waste)
            VALUES (NEW.courier_id, total_points)
            ON DUPLICATE KEY UPDATE total_waste = total_points + VALUES(total_points);
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `waste`
--

CREATE TABLE `waste` (
  `waste_id` int NOT NULL,
  `waste_name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `point` int DEFAULT '0',
  `waste_type_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `waste`
--

INSERT INTO `waste` (`waste_id`, `waste_name`, `category`, `point`, `waste_type_id`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Lithium Battery', 'Battery', 10, 1, NULL, 'Lithium-based battery used in electronics', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(2, 'Alkaline Battery', 'Battery', 8, 1, NULL, 'Common household battery', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(3, 'Car Battery', 'Battery', 15, 1, NULL, 'Large lead-acid battery used in vehicles', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(4, 'Smartphone', 'Mobile Device', 20, 2, NULL, 'Used or broken smartphone', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(5, 'Feature Phone', 'Mobile Device', 10, 2, NULL, 'Non-smartphone mobile device', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(6, 'Tablet', 'Mobile Device', 25, 2, NULL, 'Tablet device used for browsing and media', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(7, 'Desktop Computer', 'Computer', 30, 3, NULL, 'Full desktop computer setup', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(8, 'Laptop', 'Computer', 25, 3, NULL, 'Portable computer device', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(9, 'PC Monitor', 'Computer', 15, 3, NULL, 'Computer display monitor', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(10, 'CRT TV', 'Television', 20, 4, NULL, 'Old-style CRT television', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(11, 'LED TV', 'Television', 30, 4, NULL, 'Modern LED television', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(12, 'Plasma TV', 'Television', 25, 4, NULL, 'Older plasma screen television', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(13, 'Microwave', 'Small Appliance', 15, 5, NULL, 'Kitchen microwave appliance', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(14, 'Blender', 'Small Appliance', 10, 5, NULL, 'Kitchen blender for food preparation', '2024-11-03 03:23:49', '2024-11-03 03:23:49'),
(15, 'Toaster', 'Small Appliance', 8, 5, NULL, 'Small kitchen appliance for toasting bread', '2024-11-03 03:23:49', '2024-11-03 03:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `waste_type`
--

CREATE TABLE `waste_type` (
  `waste_type_id` int NOT NULL,
  `waste_type_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `waste_type`
--

INSERT INTO `waste_type` (`waste_type_id`, `waste_type_name`, `created_at`, `updated_at`) VALUES
(1, 'Batteries', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(2, 'Mobile Phones', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(3, 'Computers', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(4, 'Televisions', '2024-11-03 03:23:29', '2024-11-03 03:23:29'),
(5, 'Small Appliances', '2024-11-03 03:23:29', '2024-11-03 03:23:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`community_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `community_points`
--
ALTER TABLE `community_points`
  ADD PRIMARY KEY (`points_id`),
  ADD UNIQUE KEY `community_id` (`community_id`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `courier_points`
--
ALTER TABLE `courier_points`
  ADD PRIMARY KEY (`points_id`),
  ADD UNIQUE KEY `courier_id` (`courier_id`);

--
-- Indexes for table `dropbox`
--
ALTER TABLE `dropbox`
  ADD PRIMARY KEY (`dropbox_id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`management_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pickup_detail`
--
ALTER TABLE `pickup_detail`
  ADD PRIMARY KEY (`pickup_id`,`waste_id`),
  ADD KEY `waste_id` (`waste_id`);

--
-- Indexes for table `pickup_waste`
--
ALTER TABLE `pickup_waste`
  ADD PRIMARY KEY (`pickup_id`),
  ADD KEY `dropbox_id` (`dropbox_id`),
  ADD KEY `courier_id` (`courier_id`),
  ADD KEY `community_id` (`community_id`),
  ADD KEY `management_id` (`management_id`);

--
-- Indexes for table `waste`
--
ALTER TABLE `waste`
  ADD PRIMARY KEY (`waste_id`),
  ADD KEY `waste_type_id` (`waste_type_id`);

--
-- Indexes for table `waste_type`
--
ALTER TABLE `waste_type`
  ADD PRIMARY KEY (`waste_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `community`
--
ALTER TABLE `community`
  MODIFY `community_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `community_points`
--
ALTER TABLE `community_points`
  MODIFY `points_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courier_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courier_points`
--
ALTER TABLE `courier_points`
  MODIFY `points_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dropbox`
--
ALTER TABLE `dropbox`
  MODIFY `dropbox_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
  MODIFY `management_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pickup_waste`
--
ALTER TABLE `pickup_waste`
  MODIFY `pickup_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waste`
--
ALTER TABLE `waste`
  MODIFY `waste_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waste_type`
--
ALTER TABLE `waste_type`
  MODIFY `waste_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `community_points`
--
ALTER TABLE `community_points`
  ADD CONSTRAINT `community_points_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courier_points`
--
ALTER TABLE `courier_points`
  ADD CONSTRAINT `courier_points_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pickup_detail`
--
ALTER TABLE `pickup_detail`
  ADD CONSTRAINT `pickup_detail_ibfk_1` FOREIGN KEY (`pickup_id`) REFERENCES `pickup_waste` (`pickup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pickup_detail_ibfk_2` FOREIGN KEY (`waste_id`) REFERENCES `waste` (`waste_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pickup_waste`
--
ALTER TABLE `pickup_waste`
  ADD CONSTRAINT `pickup_waste_ibfk_1` FOREIGN KEY (`dropbox_id`) REFERENCES `dropbox` (`dropbox_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pickup_waste_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pickup_waste_ibfk_3` FOREIGN KEY (`community_id`) REFERENCES `community` (`community_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pickup_waste_ibfk_4` FOREIGN KEY (`management_id`) REFERENCES `management` (`management_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `waste`
--
ALTER TABLE `waste`
  ADD CONSTRAINT `waste_ibfk_1` FOREIGN KEY (`waste_type_id`) REFERENCES `waste_type` (`waste_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
