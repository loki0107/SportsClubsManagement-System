-- MySQL dump 10.13  Distrib 9.3.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: SportsClubManagement
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach_grade`
--

DROP TABLE IF EXISTS `coach_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_grade` (
  `coach_id` int NOT NULL,
  `coach_name` varchar(255) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_grade`
--

LOCK TABLES `coach_grade` WRITE;
/*!40000 ALTER TABLE `coach_grade` DISABLE KEYS */;
INSERT INTO `coach_grade` VALUES (1,'John Smith','A'),(2,'Mike Johnson','A'),(3,'Sarah Wilson','A'),(4,'Robert Brown','A'),(6,'New Coach','A'),(7,'Rohit','A'),(8,'Meera Singh','A');
/*!40000 ALTER TABLE `coach_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_history`
--

DROP TABLE IF EXISTS `coach_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_history` (
  `coach_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `old_specialization` varchar(100) DEFAULT NULL,
  `pro_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_history`
--

LOCK TABLES `coach_history` WRITE;
/*!40000 ALTER TABLE `coach_history` DISABLE KEYS */;
INSERT INTO `coach_history` VALUES (1,'John Smith','Football','2025-04-17 08:49:43');
/*!40000 ALTER TABLE `coach_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `experience` int DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `sport_id` int DEFAULT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE KEY `contact_info` (`contact_info`),
  CONSTRAINT `coaches_chk_1` CHECK ((`experience` >= 0)),
  CONSTRAINT `coaches_chk_2` CHECK ((`salary` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'John Smith',10,'john@gmail.com','New Specialization',66000.00,'2022-01-15',1),(2,'Mike Johnson',8,'mike@gmail.com','Basketball',55000.00,'2021-05-10',2),(3,'Sarah Wilson',7,'sarah@gmail.com','Defense',40000.00,'2023-03-18',3),(4,'Robert Brown',12,'robert@gmail.com','Hockey',77000.00,'2020-11-20',3),(6,'New Coach',5,'newcoach@example.com','Fitness',5951.25,'2024-01-10',NULL),(7,'Rohit',7,NULL,'Offense',50000.00,NULL,3),(8,'Meera Singh',6,NULL,'Defense',52000.00,NULL,3),(10,'Emma Hayes',12,NULL,'Football',75000.00,NULL,NULL);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_specialization_update` BEFORE UPDATE ON `coaches` FOR EACH ROW BEGIN
    IF OLD.specialization <> NEW.specialization THEN
        INSERT INTO coach_history (coach_id, name, old_specialization, pro_date)
        VALUES (OLD.coach_id, OLD.name, OLD.specialization, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `coachv2`
--

DROP TABLE IF EXISTS `coachv2`;
/*!50001 DROP VIEW IF EXISTS `coachv2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coachv2` AS SELECT 
 1 AS `id`,
 1 AS `coach_name`,
 1 AS `salary_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coachv3`
--

DROP TABLE IF EXISTS `coachv3`;
/*!50001 DROP VIEW IF EXISTS `coachv3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coachv3` AS SELECT 
 1 AS `id`,
 1 AS `full_name`,
 1 AS `expertise`,
 1 AS `coach_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `equipment_id` int NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `condition_status` varchar(100) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `last_serviced` date DEFAULT NULL,
  PRIMARY KEY (`equipment_id`),
  CONSTRAINT `equipment_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Football',30,'Good','2024-01-10','Nike','2024-06-01'),(2,'Basketball',10,'Excellent','2024-02-15','Adidas','2024-06-10'),(3,'Cricket Bat',15,'Average','2024-03-20','Puma','2024-06-20'),(4,'Hockey Stick',12,'Good','2024-04-25','Reebok','2024-06-25'),(5,'Tennis Racket',8,'Excellent','2024-05-30','Yonex','2024-07-01');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FanRegistrations`
--

DROP TABLE IF EXISTS `FanRegistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FanRegistrations` (
  `fan_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `favorite_team` int DEFAULT NULL,
  `membership_level` varchar(50) DEFAULT NULL,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fan_id`),
  UNIQUE KEY `email` (`email`),
  KEY `favorite_team` (`favorite_team`),
  CONSTRAINT `fanregistrations_ibfk_1` FOREIGN KEY (`favorite_team`) REFERENCES `Teams` (`team_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FanRegistrations`
--

LOCK TABLES `FanRegistrations` WRITE;
/*!40000 ALTER TABLE `FanRegistrations` DISABLE KEYS */;
INSERT INTO `FanRegistrations` VALUES (1,'David Miller','david@gmail.com','9876543210',1,'Gold','2025-03-07 09:28:06'),(2,'Emma Watson','emma@gmail.com','9876543211',2,'Silver','2025-03-07 09:28:06'),(3,'John Cena','john@gmail.com','9876543212',3,'Gold','2025-03-07 09:28:06'),(4,'Robert Downey','robert@gmail.com','9876543213',NULL,'Platinum','2025-03-07 09:28:06'),(5,'Chris Evans','chris@gmail.com','9876543214',5,'Silver','2025-03-07 09:28:06'),(6,'Fiona Black','fiona@example.com','2221113333',3,'Gold','2024-04-07 00:00:00'),(7,'George Blue','george@example.com','7778889999',1,'Silver','2024-04-07 00:00:00'),(8,'Hannah Ray','hannah@example.com','1112223334',2,'Platinum','2024-04-07 00:00:00'),(9,'Ian Steel','ian@example.com','9990001111',2,'Bronze','2024-04-07 00:00:00'),(10,'Jane Moon','jane@example.com','1231231231',3,'Gold','2024-04-07 00:00:00'),(12,'Beyoncé','bey@example.com','9993837735',5,'Gold','2025-04-28 00:16:42'),(210,'Simran Kapoor','simran.k@example.com','9876543210',NULL,NULL,'2025-04-28 08:39:46');
/*!40000 ALTER TABLE `FanRegistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matches` (
  `match_id` int NOT NULL,
  `tournament_id` int DEFAULT NULL,
  `team1_id` int DEFAULT NULL,
  `team2_id` int DEFAULT NULL,
  `match_date` date DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `tournament_id` (`tournament_id`),
  KEY `team1_id` (`team1_id`),
  KEY `team2_id` (`team2_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `Tournaments` (`tournament_id`) ON DELETE CASCADE,
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team1_id`) REFERENCES `Teams` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`team2_id`) REFERENCES `Teams` (`team_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
INSERT INTO `Matches` VALUES (1,1,1,2,'2024-06-20','Wembley Stadium','Draw'),(2,2,2,1,'2024-04-25','Camp Nou','Barcelona'),(3,3,3,3,'2024-09-10','Eden Gardens','India'),(5,5,5,5,'2024-05-05','Allianz Arena','Bayern Munich');
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalRecords`
--

DROP TABLE IF EXISTS `MedicalRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedicalRecords` (
  `record_id` int NOT NULL,
  `player_id` int DEFAULT NULL,
  `injury_type` varchar(255) DEFAULT NULL,
  `severity` varchar(100) DEFAULT NULL,
  `recovery_time` int DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `treatment_notes` text,
  PRIMARY KEY (`record_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `medicalrecords_chk_1` CHECK ((`recovery_time` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalRecords`
--

LOCK TABLES `MedicalRecords` WRITE;
/*!40000 ALTER TABLE `MedicalRecords` DISABLE KEYS */;
INSERT INTO `MedicalRecords` VALUES (1,1,'Knee Injury','Moderate',30,'Dr. Smith','Rest Required'),(2,2,'Ankle Sprain','Minor',10,'Dr. Johnson','Physiotherapy'),(3,3,'Shoulder Injury','Severe',60,'Dr. Wilson','Surgery'),(4,4,'Hamstring Strain','Moderate',25,'Dr. Brown','Rest & Ice'),(5,5,'Elbow Injury','Minor',15,'Dr. Davis','Physiotherapy');
/*!40000 ALTER TABLE `MedicalRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Memberships`
--

DROP TABLE IF EXISTS `Memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Memberships` (
  `membership_id` int NOT NULL,
  `club_id` int DEFAULT NULL,
  `member_name` varchar(255) NOT NULL,
  `membership_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `fees_paid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`membership_id`),
  CONSTRAINT `memberships_chk_1` CHECK ((`fees_paid` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Memberships`
--

LOCK TABLES `Memberships` WRITE;
/*!40000 ALTER TABLE `Memberships` DISABLE KEYS */;
INSERT INTO `Memberships` VALUES (1,1,'David Miller','Gold','2024-01-01','2025-01-01',1000.00),(2,2,'Emma Watson','Silver','2024-02-01','2025-02-01',800.00),(3,3,'John Cena','Gold','2024-03-01','2025-03-01',1200.00),(4,4,'Robert Downey','Platinum','2024-04-01','2025-04-01',1500.00),(5,5,'Chris Evans','Silver','2024-05-01','2025-05-01',900.00);
/*!40000 ALTER TABLE `Memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Merchandise`
--

DROP TABLE IF EXISTS `Merchandise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Merchandise` (
  `merchandise_id` int NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`merchandise_id`),
  CONSTRAINT `merchandise_chk_1` CHECK ((`price` > 0)),
  CONSTRAINT `merchandise_chk_2` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Merchandise`
--

LOCK TABLES `Merchandise` WRITE;
/*!40000 ALTER TABLE `Merchandise` DISABLE KEYS */;
INSERT INTO `Merchandise` VALUES (1,'Real Madrid Jersey','Clothing',1000.00,50,'Nike','2025-03-07 03:58:06'),(2,'Barcelona Cap','Accessories',500.00,100,'Adidas','2025-03-07 03:58:06'),(3,'Cricket Bat','Equipment',2000.00,20,'Puma','2025-03-07 03:58:06'),(4,'Lakers Jacket','Clothing',1500.00,30,'Reebok','2025-03-07 03:58:06'),(5,'Bayern Scarf','Accessories',700.00,40,'Puma','2025-03-07 03:58:06');
/*!40000 ALTER TABLE `Merchandise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!50001 DROP VIEW IF EXISTS `pay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pay` AS SELECT 
 1 AS `name`,
 1 AS `monthly_salary`,
 1 AS `annual_salary`,
 1 AS `sport_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_fans`
--

DROP TABLE IF EXISTS `payment_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_fans` (
  `fan_name` varchar(255) DEFAULT NULL,
  `fan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_fans`
--

LOCK TABLES `payment_fans` WRITE;
/*!40000 ALTER TABLE `payment_fans` DISABLE KEYS */;
INSERT INTO `payment_fans` VALUES ('David Miller',1),('Emma Watson',2),('John Cena',3),('Robert Downey',4),('Chris Evans',5),('Fiona Black',6),('George Blue',7),('Ian Steel',9);
/*!40000 ALTER TABLE `payment_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `payment_id` int NOT NULL,
  `fan_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fan_id` (`fan_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fan_id`) REFERENCES `FanRegistrations` (`fan_id`) ON DELETE CASCADE,
  CONSTRAINT `payments_chk_1` CHECK ((`amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,1,1000.00,'2025-03-07 09:28:06','Credit Card','Paid','REF001'),(2,2,500.00,'2025-03-07 09:28:06','UPI','Paid','REF002'),(3,3,2000.00,'2025-03-07 09:28:06','Debit Card','Pending','REF003'),(4,4,1500.00,'2025-03-07 09:28:06','Net Banking','Paid','REF004'),(5,5,500.00,'2025-03-07 09:28:06','PayPal','Pending','REF005'),(6,6,110.00,'2024-04-07 09:15:00','Credit Card','Success','REF1006'),(7,7,90.00,'2024-04-07 10:20:00','Debit Card','Success','REF1007'),(8,9,60.00,'2024-04-07 11:30:00','UPI','Success','REF1008');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Players` (
  `player_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `position` varchar(100) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `contact_info` (`contact_info`),
  KEY `players_fk` (`team_id`),
  CONSTRAINT `players_fk` FOREIGN KEY (`team_id`) REFERENCES `Teams` (`team_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Teams` (`team_id`) ON DELETE SET NULL,
  CONSTRAINT `players_chk_1` CHECK ((`age` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,'Lionel Messi',36,'Male',2,'Forward','messi@gmail.com'),(2,'Cristiano Ronaldo',39,'Male',1,'Forward','ronaldo@gmail.com'),(3,'Virat Kohli',35,'Male',3,'Batsman','kohli@gmail.com'),(4,'LeBron James',39,'Male',NULL,'Guard','lebron@gmail.com'),(5,'Thomas Muller',34,'Male',5,'Midfielder','muller@gmail.com'),(6,'LEO MESSI',36,'Male',2,'Forward','leo@example.com'),(101,'ARYAN VERMA',22,'Male',5,'Midfielder',NULL);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_player_name_uppercase` BEFORE INSERT ON `players` FOR EACH ROW BEGIN
    SET NEW.name = UPPER(NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Sponsors`
--

DROP TABLE IF EXISTS `Sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsors` (
  `sponsor_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `contract_start` date DEFAULT NULL,
  `contract_end` date DEFAULT NULL,
  `amount_funded` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sponsor_id`),
  UNIQUE KEY `contact_info` (`contact_info`),
  CONSTRAINT `sponsors_chk_1` CHECK ((`amount_funded` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsors`
--

LOCK TABLES `Sponsors` WRITE;
/*!40000 ALTER TABLE `Sponsors` DISABLE KEYS */;
INSERT INTO `Sponsors` VALUES (1,'Nike','Sports','nike@gmail.com','2023-01-10','2025-01-10',100000.00),(2,'Adidas','Sports','adidas@gmail.com','2023-02-15','2025-02-15',120000.00),(3,'Red Bull','Beverages','redbull@gmail.com','2023-03-20','2025-03-20',80000.00),(4,'Pepsi','Beverages','pepsi@gmail.com','2023-04-25','2025-04-25',90000.00),(5,'Puma','Sports','puma@gmail.com','2023-05-30','2025-05-30',110000.00);
/*!40000 ALTER TABLE `Sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stadiums`
--

DROP TABLE IF EXISTS `Stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stadiums` (
  `stadium_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `surface` varchar(100) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `rental_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`stadium_id`),
  CONSTRAINT `stadiums_chk_1` CHECK ((`capacity` > 0)),
  CONSTRAINT `stadiums_chk_2` CHECK ((`rental_cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stadiums`
--

LOCK TABLES `Stadiums` WRITE;
/*!40000 ALTER TABLE `Stadiums` DISABLE KEYS */;
INSERT INTO `Stadiums` VALUES (1,'Wembley Stadium','London',90000,'Grass','City Council',5000.00),(2,'Camp Nou','Barcelona',99354,'Grass','FC Barcelona',6000.00),(3,'Eden Gardens','Chennai',68000,'Grass','Cricket Association',4500.00),(4,'Yankee Stadium','New York',50000,'Artificial','NY Yankees',7000.00),(5,'Allianz Arena','Munich',75000,'Grass','FC Bayern',5500.00);
/*!40000 ALTER TABLE `Stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teams` (
  `team_id` int NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `coach_id` int DEFAULT NULL,
  `sport_type` varchar(100) DEFAULT NULL,
  `formation` varchar(100) DEFAULT NULL,
  `home_ground` varchar(300) DEFAULT NULL,
  `founded_date` date DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`),
  UNIQUE KEY `team_name_uk` (`team_name`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `Coaches` (`coach_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES (1,'Real Madrid',1,'Football','4-3-3','London','1902-03-06'),(2,'Barcelona',2,'Football','4-4-2','DALLAS','1899-11-29'),(3,'India Cricket',3,'Cricket','Test','CHICAGO','1928-06-25'),(5,'Bayern Munich',NULL,'Football','4-2-3-1','NEW YORK','1900-02-27'),(6,'Storm Raiders',2,'Basketball','3-2 Zone','Sunset Court','2015-05-20');
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams1`
--

DROP TABLE IF EXISTS `Teams1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teams1` (
  `team_id` int NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `coach_id` int DEFAULT NULL,
  `sport_type` varchar(100) DEFAULT NULL,
  `formation` varchar(100) DEFAULT NULL,
  `home_ground` varchar(300) DEFAULT NULL,
  `founded_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams1`
--

LOCK TABLES `Teams1` WRITE;
/*!40000 ALTER TABLE `Teams1` DISABLE KEYS */;
INSERT INTO `Teams1` VALUES (1,'Real Madrid',1,'Football','4-3-3','NEW YORK','1902-03-06'),(2,'Barcelona',2,'Football','4-4-2','DALLAS','1899-11-29'),(3,'India Cricket',3,'Cricket','Test','NEW YORK','1928-06-25'),(5,'Bayern Munich',5,'Football','4-2-3-1','NEW YORK','1900-02-27');
/*!40000 ALTER TABLE `Teams1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_buyers`
--

DROP TABLE IF EXISTS `ticket_buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_buyers` (
  `fan_name` varchar(255) DEFAULT NULL,
  `fan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_buyers`
--

LOCK TABLES `ticket_buyers` WRITE;
/*!40000 ALTER TABLE `ticket_buyers` DISABLE KEYS */;
INSERT INTO `ticket_buyers` VALUES ('David Miller',1),('Emma Watson',2),('John Cena',3),('Chris Evans',5),('Fiona Black',6),('Hannah Ray',8),('Jane Moon',10);
/*!40000 ALTER TABLE `ticket_buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `ticket_id` int NOT NULL,
  `match_id` int DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `seat_number` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `Matches` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (1,1,'David Miller','A101',2000.00,'2025-03-07 09:28:06','Paid'),(2,2,'Emma Watson','B202',1500.00,'2025-03-07 09:28:06','Paid'),(3,3,'John Cena','C303',3000.00,'2025-03-07 09:28:06','Pending'),(6,3,'Fiona Black','D1',100.00,'2024-04-07 12:00:00','Paid'),(7,1,'Hannah Ray','E2',85.00,'2024-04-07 13:15:00','Paid'),(8,2,'Jane Moon','F3',95.00,'2024-04-07 14:45:00','Paid');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tournaments`
--

DROP TABLE IF EXISTS `Tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tournaments` (
  `tournament_id` int NOT NULL,
  `tournament_name` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `prize_amount` decimal(10,2) DEFAULT NULL,
  `sponsor_id` int DEFAULT NULL,
  PRIMARY KEY (`tournament_id`),
  KEY `sponsor_id` (`sponsor_id`),
  CONSTRAINT `tournaments_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `Sponsors` (`sponsor_id`) ON DELETE SET NULL,
  CONSTRAINT `tournaments_chk_1` CHECK ((`prize_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tournaments`
--

LOCK TABLES `Tournaments` WRITE;
/*!40000 ALTER TABLE `Tournaments` DISABLE KEYS */;
INSERT INTO `Tournaments` VALUES (1,'Champions League','2024-06-10','2024-07-15','London',1000000.00,1),(2,'La Liga','2024-04-20','2024-05-25','Barcelona',750000.00,2),(3,'Cricket World Cup','2024-09-05','2024-10-30','Kolkata',2000000.00,3),(4,'NBA Finals','2024-06-01','2024-06-15','New York',500000.00,4),(5,'Bundesliga','2024-05-01','2024-06-10','Munich',800000.00,5);
/*!40000 ALTER TABLE `Tournaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainingSessions`
--

DROP TABLE IF EXISTS `TrainingSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrainingSessions` (
  `session_id` int NOT NULL,
  `team_id` int DEFAULT NULL,
  `coach_id` int DEFAULT NULL,
  `session_date` datetime DEFAULT NULL,
  `focus_area` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `team_id` (`team_id`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `trainingsessions_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Teams` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT `trainingsessions_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `Coaches` (`coach_id`) ON DELETE CASCADE,
  CONSTRAINT `trainingsessions_chk_1` CHECK ((`duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainingSessions`
--

LOCK TABLES `TrainingSessions` WRITE;
/*!40000 ALTER TABLE `TrainingSessions` DISABLE KEYS */;
INSERT INTO `TrainingSessions` VALUES (1,1,1,'2024-03-10 10:00:00','Fitness',120,'Wembley Stadium'),(2,2,2,'2024-03-12 09:00:00','Defensive Drills',90,'Camp Nou'),(3,3,3,'2024-03-15 08:00:00','Batting Practice',150,'Eden Gardens');
/*!40000 ALTER TABLE `TrainingSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `coachv2`
--

/*!50001 DROP VIEW IF EXISTS `coachv2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coachv2` (`id`,`coach_name`,`salary_amount`) AS select `coaches`.`coach_id` AS `coach_id`,`coaches`.`name` AS `name`,`coaches`.`salary` AS `salary` from `coaches` where (`coaches`.`sport_id` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coachv3`
--

/*!50001 DROP VIEW IF EXISTS `coachv3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coachv3` (`id`,`full_name`,`expertise`,`coach_salary`) AS select `coaches`.`coach_id` AS `coach_id`,`coaches`.`name` AS `name`,`coaches`.`specialization` AS `specialization`,`coaches`.`salary` AS `salary` from `coaches` where (`coaches`.`sport_id` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay`
--

/*!50001 DROP VIEW IF EXISTS `pay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay` AS select `coaches`.`name` AS `name`,`coaches`.`salary` AS `monthly_salary`,(`coaches`.`salary` * 12) AS `annual_salary`,`coaches`.`sport_id` AS `sport_id` from `coaches` */;
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

-- Dump completed on 2025-05-04 14:00:05
