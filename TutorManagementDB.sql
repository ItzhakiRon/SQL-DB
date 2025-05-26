CREATE DATABASE  IF NOT EXISTS `tutormanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tutormanagement`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: tutormanagement
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseCode` int NOT NULL,
  `CourseName` varchar(255) NOT NULL,
  `LecturerID` int NOT NULL,
  PRIMARY KEY (`CourseCode`),
  KEY `LecturerID` (`LecturerID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `lecturers` (`LecturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (101,'Introduction to Programming',123456789),(202,'Electric Circuits',234567891),(303,'Linear Algebra',345678912),(404,'Quantum Mechanics',456789123),(505,'Organic Chemistry',567891234),(606,'Data Structures',678912345),(707,'Algorithms',789123456),(808,'Advanced Calculus',891234567),(909,'Statistics',912345678),(1010,'Inorganic Chemistry',112233445),(1111,'Macroeconomics',223344556),(1212,'Financial Markets',334455667),(1313,'Medical Ethics',445566778),(1414,'Public Health',556677889),(1515,'Entrepreneurship',667788990);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentCode` int NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  PRIMARY KEY (`DepartmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science'),(2,'Electrical Engineering'),(3,'Mathematics'),(4,'Physics'),(5,'Chemistry'),(6,'Biology'),(7,'Economics'),(8,'Psychology'),(9,'Middle Eastern Studies'),(10,'History'),(11,'Linguistics'),(12,'Environmental Sciences'),(13,'Medical Sciences'),(14,'Communication Studies'),(15,'Business Administration');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackCode` int NOT NULL,
  `TutorID` int NOT NULL,
  `Grade` int NOT NULL,
  PRIMARY KEY (`FeedbackCode`),
  KEY `TutorID` (`TutorID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`TutorID`) REFERENCES `tutors` (`TutorID`),
  CONSTRAINT `chk_grade_range` CHECK (((`Grade` >= 1) and (`Grade` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (40001,207654321,5),(40002,207654322,4),(40003,207654323,5),(40004,207654324,3),(40005,207654325,4),(40006,207654326,4),(40007,207654327,5),(40008,207654328,4),(40009,207654329,5),(40010,207654330,3),(40011,207654321,5),(40012,207654323,5),(40013,207654327,5),(40014,207654321,4),(40015,207654323,2),(40016,207654336,5),(40017,207654337,4),(40018,207654338,5),(40019,207654339,4),(40020,207654340,5),(40021,207654341,3),(40022,207654342,4),(40023,207654343,5),(40024,207654344,4),(40025,207654345,5),(40026,207654346,4),(40027,207654347,5),(40028,207654348,3),(40029,207654349,4),(40030,207654350,5),(40031,207654351,4),(40032,207654352,5),(40033,207654353,4),(40034,207654354,3),(40035,207654355,5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `LecturerID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `DepartmentCode` int NOT NULL,
  PRIMARY KEY (`LecturerID`),
  KEY `DepartmentCode` (`DepartmentCode`),
  CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `departments` (`DepartmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (112233445,'Eitan','Rosenfeld','eitan.rosenfeld@university.il','050-0123456',5),(123456789,'Moshe','Cohen','moshe.cohen@university.il','052-1234567',1),(223344556,'Ayelet','Golan','ayelet.golan@university.il','053-1234567',7),(234567891,'Yael','Levy','yael.levy@university.il','054-2345678',2),(334455667,'Noam','Shamir','noam.shamir@university.il','052-2345678',7),(345678912,'David','Goldstein','david.goldstein@university.il','053-3456789',3),(445566778,'Talia','Aharoni','talia.aharoni@university.il','054-3456789',13),(456789123,'Tamar','Friedman','tamar.friedman@university.il','052-4567890',4),(556677889,'Shai','Malka','shai.malka@university.il','050-4567890',13),(567891234,'Avi','Shapira','avi.shapira@university.il','050-5678901',5),(667788990,'Dana','Mizrachi','dana.mizrachi@university.il','053-5678901',15),(678912345,'Shira','Katz','shira.katz@university.il','054-6789012',1),(789123456,'Noa','Weiss','noa.weiss@university.il','053-7890123',1),(891234567,'Yoav','Alon','yoav.alon@university.il','052-8901234',3),(912345678,'Michal','Ben-David','michal.bendavid@university.il','054-9012345',3);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `MeetingCode` int NOT NULL,
  `MeetingDate` date NOT NULL,
  `MeetingLength` int NOT NULL,
  `StudentID` int NOT NULL,
  `TutorID` int NOT NULL,
  PRIMARY KEY (`MeetingCode`),
  KEY `StudentID` (`StudentID`),
  KEY `TutorID` (`TutorID`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`TutorID`) REFERENCES `tutors` (`TutorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (20001,'2025-03-15',60,302145678,207654321),(20002,'2025-03-16',90,302145679,207654322),(20003,'2025-03-17',60,302145680,207654323),(20004,'2025-03-18',120,302145681,207654324),(20005,'2025-03-19',60,302145682,207654325),(20006,'2025-03-20',90,302145683,207654326),(20007,'2025-03-21',60,302145684,207654327),(20008,'2025-03-22',120,302145685,207654328),(20009,'2025-03-23',60,302145686,207654329),(20010,'2025-03-24',90,302145687,207654330),(20011,'2025-03-25',60,302145678,207654322),(20012,'2025-03-26',120,302145679,207654323),(20013,'2025-03-27',60,302145680,207654321),(20014,'2025-03-28',90,302145681,207654325),(20015,'2025-03-29',60,302145686,207654330),(20016,'2025-04-01',60,302145693,207654336),(20017,'2025-04-02',90,302145694,207654337),(20018,'2025-04-03',120,302145695,207654338),(20019,'2025-04-04',60,302145696,207654339),(20020,'2025-04-05',90,302145697,207654340),(20021,'2025-04-06',120,302145698,207654341),(20022,'2025-04-07',60,302145699,207654342),(20023,'2025-04-08',90,302145700,207654343),(20024,'2025-04-09',120,302145701,207654344),(20025,'2025-04-10',60,302145702,207654345),(20026,'2025-04-22',60,302145693,207654336),(20027,'2025-04-23',90,302145694,207654337),(20028,'2025-04-24',120,302145695,207654338),(20029,'2025-04-25',60,302145696,207654339),(20030,'2025-04-26',90,302145697,207654340),(20031,'2025-05-02',60,302145693,207654336),(20032,'2025-05-03',90,302145694,207654337),(20033,'2025-05-04',120,302145695,207654338),(20034,'2025-05-05',60,302145696,207654339),(20035,'2025-05-06',90,302145697,207654340);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterMeetingComplete` AFTER INSERT ON `meetings` FOR EACH ROW BEGIN
    DECLARE meetingCount INT;
    DECLARE feedbackExists INT;

    -- Check if this is the student's third or more meeting with this tutor
    SELECT COUNT(*) INTO meetingCount
    FROM meetings
    WHERE StudentID = NEW.StudentID AND TutorID = NEW.TutorID;

    -- Check if feedback already exists
    SELECT COUNT(*) INTO feedbackExists
    FROM feedback
    WHERE TutorID = NEW.TutorID AND FeedbackCode IN (
        SELECT MAX(FeedbackCode) 
        FROM feedback 
        GROUP BY TutorID 
        HAVING TutorID = NEW.TutorID
    );

    -- If ≥ 3 meetings and no recent feedback, create feedback request
    IF meetingCount >= 3 AND (
        feedbackExists = 0 OR DATEDIFF(CURDATE(), (
            SELECT MAX(m.MeetingDate) 
            FROM meetings m
            JOIN feedback f ON m.TutorID = f.TutorID
            WHERE m.TutorID = NEW.TutorID AND m.StudentID = NEW.StudentID
        )) > 30
    ) THEN
        -- Insert into feedback_requests table (assuming it exists)
        INSERT INTO feedback_requests (StudentID, TutorID, MeetingCode, RequestDate, Completed)
        VALUES (NEW.StudentID, NEW.TutorID, NEW.MeetingCode, CURDATE(), 0);

        -- Optionally log the request
        INSERT INTO system_logs (LogDate, LogType, Description)
        VALUES (
            NOW(),
            'FEEDBACK_REQUEST',
            CONCAT('Automatic feedback request created for meeting #', NEW.MeetingCode)
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `StudyYear` int NOT NULL,
  `GroupCode` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `GroupCode` (`GroupCode`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`GroupCode`) REFERENCES `studygroups` (`GroupCode`),
  CONSTRAINT `chk_student_id` CHECK (regexp_like(`StudentID`,_utf8mb4'^[0-9]{9}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (302145678,'Dan','Avraham','050-1112233','dan.avraham@student.il',2,1001),(302145679,'Maya','Biton','052-2223344','maya.biton@student.il',3,1001),(302145680,'Omer','Dagan','054-3334455','omer.dagan@student.il',1,1001),(302145681,'Roni','Efrat','053-4445566','roni.efrat@student.il',4,1003),(302145682,'Tal','Friedman','050-5556677','tal.friedman@student.il',2,1003),(302145683,'Liora','Gal','052-6667788','liora.gal@student.il',3,1005),(302145684,'Amir','Hadar','054-7778899','amir.hadar@student.il',1,1005),(302145685,'Sharon','Israeli','053-8889900','sharon.israeli@student.il',4,1005),(302145686,'Yuval','Koren','050-9990011','yuval.koren@student.il',2,1007),(302145687,'Naomi','Levi','052-0001122','naomi.levi@student.il',3,1007),(302145688,'Eyal','Mizrachi','054-1112233','eyal.mizrachi@student.il',1,1009),(302145689,'Reut','Nir','053-2223344','reut.nir@student.il',4,1009),(302145690,'Itai','Peretz','050-3334455','itai.peretz@student.il',2,1011),(302145691,'Hila','Rotem','052-4445566','hila.rotem@student.il',3,1013),(302145692,'Gilad','Shaked','054-5556677','gilad.shaked@student.il',1,1015),(302145693,'Sarah','Goldstein','050-8881234','sarah.goldstein@student.il',1,1001),(302145694,'David','Levin','052-7772345','david.levin@student.il',2,1002),(302145695,'Rachel','Hoffman','053-6663456','rachel.hoffman@student.il',3,1003),(302145696,'Noam','Shavit','050-5554567','noam.shavit@student.il',1,1004),(302145697,'Tamar','Golan','052-4445678','tamar.golan@student.il',4,1005),(302145698,'Ido','Berkovich','053-3336789','ido.berkovich@student.il',2,1001),(302145699,'Noa','Weiss','050-2227890','noa.weiss@student.il',3,1002),(302145700,'Amir','Eitan','052-1118901','amir.eitan@student.il',2,1003),(302145701,'Shira','Katz','053-9990123','shira.katz@student.il',4,1004),(302145702,'Yonatan','Mizrahi','050-8881234','yonatan.mizrahi@student.il',1,1005),(302145703,'Hadar','Dagan','052-7772345','hadar.dagan@student.il',3,1001),(302145704,'Tomer','Shaked','053-6663456','tomer.shaked@student.il',2,1002),(302145705,'Michal','Rubin','050-5554567','michal.rubin@student.il',4,1003),(302145706,'Eyal','Levi','052-4445678','eyal.levi@student.il',1,1004),(302145707,'Dana','Navon','053-3336789','dana.navon@student.il',2,1005),(302145708,'Ori','Harel','050-2227890','ori.harel@student.il',3,1001),(302145709,'Maya','Segev','052-1118901','maya.segev@student.il',2,1002),(302145710,'Gil','Adler','053-9990123','gil.adler@student.il',4,1003),(302145711,'Meirav','Stern','050-8881234','meirav.stern@student.il',1,1004),(302145712,'Roee','Goldman','052-7772345','roee.goldman@student.il',3,1005);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studygroups`
--

DROP TABLE IF EXISTS `studygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studygroups` (
  `GroupCode` int NOT NULL,
  `GroupName` varchar(255) NOT NULL,
  `LecturerID` int NOT NULL,
  PRIMARY KEY (`GroupCode`),
  KEY `LecturerID` (`LecturerID`),
  CONSTRAINT `studygroups_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `lecturers` (`LecturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studygroups`
--

LOCK TABLES `studygroups` WRITE;
/*!40000 ALTER TABLE `studygroups` DISABLE KEYS */;
INSERT INTO `studygroups` VALUES (1001,'Technion Elite',123456789),(1002,'Hebrew U Engineers',234567891),(1003,'Tel Aviv Math Stars',345678912),(1004,'Weizmann Physicists',456789123),(1005,'Chemistry Innovators',567891234),(1006,'Computer Science Club',678912345),(1007,'Economics Analysts',223344556),(1008,'Psychology Thinkers',891234567),(1009,'Middle East Scholars',912345678),(1010,'History Chroniclers',112233445),(1011,'Language Experts',334455667),(1012,'Environmental Advocates',789123456),(1013,'Medical Pioneers',445566778),(1014,'Communication Specialists',556677889),(1015,'Business Leaders',667788990);
/*!40000 ALTER TABLE `studygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorassignments`
--

DROP TABLE IF EXISTS `tutorassignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutorassignments` (
  `AssignmentCode` int NOT NULL,
  `StudentID` int NOT NULL,
  `TutorID` int NOT NULL,
  `RequestDate` date NOT NULL,
  `AssignmentDate` date NOT NULL,
  PRIMARY KEY (`AssignmentCode`),
  KEY `StudentID` (`StudentID`),
  KEY `TutorID` (`TutorID`),
  CONSTRAINT `tutorassignments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `tutorassignments_ibfk_2` FOREIGN KEY (`TutorID`) REFERENCES `tutors` (`TutorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorassignments`
--

LOCK TABLES `tutorassignments` WRITE;
/*!40000 ALTER TABLE `tutorassignments` DISABLE KEYS */;
INSERT INTO `tutorassignments` VALUES (30001,302145678,207654321,'2025-03-01','2025-03-05'),(30002,302145679,207654322,'2025-03-02','2025-03-06'),(30003,302145680,207654323,'2025-03-03','2025-03-07'),(30004,302145681,207654324,'2025-03-04','2025-03-08'),(30005,302145682,207654325,'2025-03-05','2025-03-09'),(30006,302145683,207654326,'2025-03-06','2025-03-10'),(30007,302145684,207654327,'2025-03-07','2025-03-11'),(30008,302145685,207654328,'2025-03-08','2025-03-12'),(30009,302145686,207654329,'2025-03-09','2025-03-13'),(30010,302145687,207654330,'2025-03-10','2025-03-14'),(30011,302145678,207654322,'2025-03-11','2025-03-15'),(30012,302145679,207654323,'2025-03-12','2025-03-16'),(30013,302145680,207654321,'2025-03-13','2025-03-17'),(30014,302145681,207654325,'2025-03-14','2025-03-18'),(30015,302145686,207654330,'2025-03-15','2025-03-19'),(30016,302145693,207654336,'2025-03-20','2025-03-23'),(30017,302145694,207654337,'2025-03-21','2025-03-25'),(30018,302145695,207654338,'2025-03-22','2025-03-27'),(30019,302145696,207654339,'2025-03-23','2025-03-30'),(30020,302145697,207654340,'2025-03-24','2025-03-28'),(30021,302145698,207654341,'2025-03-25','2025-03-29'),(30022,302145699,207654342,'2025-03-26','2025-03-31'),(30023,302145700,207654343,'2025-03-27','2025-04-01'),(30024,302145701,207654344,'2025-03-28','2025-04-02'),(30025,302145702,207654345,'2025-03-29','2025-04-03'),(30026,302145703,207654346,'2025-03-30','2025-04-01'),(30027,302145704,207654347,'2025-03-31','2025-04-02'),(30028,302145705,207654348,'2025-04-01','2025-04-03'),(30029,302145706,207654349,'2025-04-02','2025-04-06'),(30030,302145707,207654350,'2025-04-03','2025-04-07'),(30031,302145708,207654351,'2025-04-04','2025-04-08'),(30032,302145709,207654352,'2025-04-05','2025-04-09'),(30033,302145710,207654353,'2025-04-06','2025-04-10'),(30034,302145711,207654354,'2025-04-07','2025-04-11'),(30035,302145712,207654355,'2025-04-08','2025-04-12');
/*!40000 ALTER TABLE `tutorassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors` (
  `TutorID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `StudyYear` int NOT NULL,
  `Expertise` varchar(255) NOT NULL,
  `GroupCode` int NOT NULL,
  PRIMARY KEY (`TutorID`),
  KEY `GroupCode` (`GroupCode`),
  CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`GroupCode`) REFERENCES `studygroups` (`GroupCode`),
  CONSTRAINT `chk_phone_number` CHECK (regexp_like(`Phone`,_utf8mb4'^05[0-9]-[0-9]{7}$')),
  CONSTRAINT `chk_Tutor_id` CHECK (regexp_like(`TutorID`,_utf8mb4'^[0-9]{9}$')),
  CONSTRAINT `chk_valid_email` CHECK (regexp_like(`Email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` VALUES (207654321,'Yotam','Azoulay','yotam.azoulay@tutor.il','050-6667788',4,'Programming Languages',1001),(207654322,'Lilach','Barak','lilach.barak@tutor.il','052-7778899',5,'Circuit Design',1001),(207654323,'Nadav','Cohen','nadav.cohen@tutor.il','054-8889900',3,'Calculus',1001),(207654324,'Einat','Dror','einat.dror@tutor.il','053-9990011',4,'Theoretical Physics',1003),(207654325,'Ron','Eliyahu','ron.eliyahu@tutor.il','050-0001122',5,'Biochemistry',1003),(207654326,'Tamar','Fahima','tamar.fahima@tutor.il','052-1112233',4,'Genetics',1005),(207654327,'Ido','Gabbay','ido.gabbay@tutor.il','054-2223344',5,'Financial Economics',1005),(207654328,'Neta','Hoffman','neta.hoffman@tutor.il','053-3334455',3,'Clinical Psychology',1007),(207654329,'Ari','Israeli','ari.israeli@tutor.il','050-4445566',4,'Arab-Israeli Conflict',1007),(207654330,'Shani','Jacobson','shani.jacobson@tutor.il','052-5556677',5,'Ancient History',1007),(207654331,'Roee','Kaplan','roee.kaplan@tutor.il','054-6667788',4,'Semitic Languages',1009),(207654332,'Meirav','Lavan','meirav.lavan@tutor.il','053-7778899',5,'Sustainability',1009),(207654333,'Amit','Navon','amit.navon@tutor.il','050-8889900',3,'Anatomy',1011),(207654334,'Orit','Paz','orit.paz@tutor.il','052-9990011',4,'Digital Communication',1013),(207654335,'Doron','Rimon','doron.rimon@tutor.il','054-0001122',5,'Marketing',1015),(207654336,'Daniel','Schwartz','daniel.schwartz@tutor.il','050-1231234',4,'Machine Learning',1001),(207654337,'Einat','Levy','einat.levy@tutor.il','052-2342345',5,'Electrical Circuits',1002),(207654338,'Assaf','Cohen','assaf.cohen@tutor.il','053-3453456',4,'Linear Algebra',1003),(207654339,'Ella','Barak','ella.barak@tutor.il','050-4564567',3,'Quantum Physics',1004),(207654340,'Roi','Gal','roi.gal@tutor.il','052-5675678',5,'Organic Chemistry',1005),(207654341,'Moran','Admoni','moran.admoni@tutor.il','053-6786789',4,'Molecular Biology',1001),(207654342,'Tal','Avital','tal.avital@tutor.il','050-7897890',3,'Macroeconomics',1002),(207654343,'Sharon','Gross','sharon.gross@tutor.il','052-8908901',4,'Cognitive Psychology',1003),(207654344,'Doron','Segal','doron.segal@tutor.il','053-9019012',5,'Middle Eastern History',1004),(207654345,'Neta','Karni','neta.karni@tutor.il','050-1231234',3,'Algorithms',1005),(207654346,'Boaz','Miller','boaz.miller@tutor.il','052-2342345',5,'Digital Systems',1001),(207654347,'Ayelet','Bloch','ayelet.bloch@tutor.il','053-3453456',4,'Calculus',1002),(207654348,'Itai','Peretz','itai.peretz@tutor.il','050-4564567',3,'Thermodynamics',1003),(207654349,'Shani','Ziv','shani.ziv@tutor.il','052-5675678',5,'Biochemistry',1004),(207654350,'Yaniv','Rozen','yaniv.rozen@tutor.il','053-6786789',4,'Genetics',1005),(207654351,'Hila','Shoham','hila.shoham@tutor.il','050-7897890',3,'Game Theory',1001),(207654352,'Matan','Gur','matan.gur@tutor.il','052-8908901',4,'Social Psychology',1002),(207654353,'Liat','Alon','liat.alon@tutor.il','053-9019012',5,'International Relations',1003),(207654354,'Amit','Kaplan','amit.kaplan@tutor.il','050-1231234',3,'Data Structures',1004),(207654355,'Dafna','Even','dafna.even@tutor.il','052-2342345',5,'Signal Processing',1005);
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tutormanagement'
--

--
-- Dumping routines for database 'tutormanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `RemoveInactiveTutorAssignments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveInactiveTutorAssignments`(
    IN cutoffDays INT,
    OUT deletedCount INT
)
BEGIN
    -- Ensure data integrity
    DECLARE cutoffDate DATE;
    SET cutoffDate = DATE_SUB(CURDATE(), INTERVAL cutoffDays DAY);

    -- Create temporary table for logging
    CREATE TEMPORARY TABLE IF NOT EXISTS deleted_assignments AS
    SELECT 
        ta.*, 
        CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
        CONCAT(t.FirstName, ' ', t.LastName) AS TutorName
    FROM tutorassignments ta
    JOIN students s ON ta.StudentID = s.StudentID
    JOIN tutors t ON ta.TutorID = t.TutorID
    WHERE ta.AssignmentDate < cutoffDate
    AND NOT EXISTS (
        SELECT 1 FROM meetings m
        WHERE m.StudentID = ta.StudentID
          AND m.TutorID = ta.TutorID
          AND m.MeetingDate > cutoffDate
    );

    -- Get count
    SELECT COUNT(*) INTO deletedCount FROM deleted_assignments;

    -- Delete records
    DELETE ta FROM tutorassignments ta
    WHERE ta.AssignmentDate < cutoffDate
    AND NOT EXISTS (
        SELECT 1 FROM meetings m
        WHERE m.StudentID = ta.StudentID
          AND m.TutorID = ta.TutorID
          AND m.MeetingDate > cutoffDate
    );

    -- Return summary
    SELECT CONCAT(deletedCount, ' inactive tutor assignments removed from before ', cutoffDate) AS Result;

    -- Log detailed records if needed
    SELECT * FROM deleted_assignments;

    -- Clean up
    DROP TEMPORARY TABLE IF EXISTS deleted_assignments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTutorExpertise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTutorExpertise`(
    IN tutorID INT,
    IN newExpertise VARCHAR(255)
)
BEGIN
    -- Declare variables for notification
    DECLARE tutorName VARCHAR(200);
    DECLARE oldExpertise VARCHAR(255);

    -- Get current information
    SELECT CONCAT(FirstName, ' ', LastName), Expertise
    INTO tutorName, oldExpertise
    FROM tutors
    WHERE TutorID = tutorID;

    -- Update the expertise
    UPDATE tutors
    SET Expertise = newExpertise,
        Email = CASE
            WHEN Email LIKE '%@tutor.il' THEN Email
            ELSE CONCAT(
                LOWER(REPLACE(FirstName, ' ', '')), '.', 
                LOWER(REPLACE(LastName, ' ', '')), '@tutor.il'
            )
        END
    WHERE TutorID = tutorID;

    -- Log the change
    INSERT INTO system_logs (LogDate, LogType, Description)
    VALUES (
        NOW(),
        'EXPERTISE_UPDATE',
        CONCAT('Tutor: ', tutorName, ' expertise updated from "', oldExpertise, '" to "', newExpertise, '"')
    );

    -- Return success message
    SELECT CONCAT('Successfully updated expertise for ', tutorName, ' to ', newExpertise, '') AS Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07  1:50:32
