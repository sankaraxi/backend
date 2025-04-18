-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aon
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Domain'),(2,'Apptitude'),(4,'Communication');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocube_role`
--

DROP TABLE IF EXISTS `cocube_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cocube_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocube_role`
--

LOCK TABLES `cocube_role` WRITE;
/*!40000 ALTER TABLE `cocube_role` DISABLE KEYS */;
INSERT INTO `cocube_role` VALUES (1,'Admin'),(2,'Question_creator'),(3,'user'),(4,'Frontend Dev'),(5,'Fullstack Dev');
/*!40000 ALTER TABLE `cocube_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocube_user`
--

DROP TABLE IF EXISTS `cocube_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cocube_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phonenumber` bigint DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `assigned_question` varchar(10) DEFAULT NULL,
  `docker_port` int DEFAULT NULL,
  `output_port` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `cocube_user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `cocube_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocube_user`
--

LOCK TABLES `cocube_user` WRITE;
/*!40000 ALTER TABLE `cocube_user` DISABLE KEYS */;
INSERT INTO `cocube_user` VALUES (1,'instructor',9874563210,'instructor@gmail.com','instructor@123',2,NULL,NULL,NULL),(2,'student',9876543210,'student@gmail.com','student@123',3,'a1l1q1',NULL,NULL),(3,'admin',9087654321,'admin@gmail.com','admin@123',1,'',NULL,NULL),(4,'frontend',8745963210,'frontend@kggl.com','frontend@123',4,'a1l1q1',NULL,NULL),(5,'fullstack',758496321,'fullstack@kggl.com','fullstack@123',5,NULL,NULL,NULL),(6,'demouser1',8907654321,'demouser1@kggl.com','demouser1@123',4,'a1l1q1',8084,5177),(7,'demouser2',6543217890,'demouser2@kggl.com','demouser2@123',4,'a1l1q2',8082,5175),(8,'demouser3',3543217890,'demouser3@kggl.com','demouser3@123',4,'a1l1q3',8080,5173),(9,'demouser4',6543217890,'demouser4@kggl.com','demouser4@123',4,'a1l1q3',NULL,NULL);
/*!40000 ALTER TABLE `cocube_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite`
--

DROP TABLE IF EXISTS `invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite`
--

LOCK TABLES `invite` WRITE;
/*!40000 ALTER TABLE `invite` DISABLE KEYS */;
INSERT INTO `invite` VALUES (1,'johnpaul.j@kggeniuslabs.com\n'),(2,'johnpaul.j@kggeniuslabs.com'),(3,'johnpaul.j@kggeniuslabs.com'),(4,'johnpaul.j@kggeniuslabs.com'),(5,'johnpaul.j@kggeniuslabs.com'),(6,'johnpaul.j@kggeniuslabs.com'),(7,'johnpaul.j@kggeniuslabs.com'),(8,'johnpaul.j@kggeniuslabs.com'),(9,'johnpaul.j@kggeniuslabs.com'),(10,'johnpaul.j@kggeniuslabs.com'),(11,'sankarspydy@gmail.com'),(12,'sankarspydy@gmail.com'),(13,'sankarspydy@gmail.com'),(14,'sankarspydy@gmail.com'),(15,'sankarspydy@gmail.com'),(16,'sankarspydy@gmail.com');
/*!40000 ALTER TABLE `invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_master`
--

DROP TABLE IF EXISTS `log_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_master` (
  `activity_code` int NOT NULL,
  `activity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`activity_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_master`
--

LOCK TABLES `log_master` WRITE;
/*!40000 ALTER TABLE `log_master` DISABLE KEYS */;
INSERT INTO `log_master` VALUES (1,'Logged In'),(2,'Start the Assessment'),(3,'Assessment Submitted'),(4,'Completed the Assessment'),(5,'Logged out');
/*!40000 ALTER TABLE `log_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` varchar(10) NOT NULL,
  `question` longblob NOT NULL,
  `testcase` json NOT NULL,
  `category_id` int DEFAULT NULL,
  `subcategory_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('10101',_binary '<p>Create a login page with 2 heading tag of h1 and h2 and 3 input box with the type of text, checkbox, email</p>','[{\"name\": \"login page\", \"elements\": [{\"value\": \"\", \"tagName\": \"h1\", \"attributes\": []}, {\"value\": \"login\", \"tagName\": \"h2\", \"attributes\": []}, {\"value\": \"\", \"tagName\": \"input\", \"attributes\": [{\"name\": \"type\", \"value\": \"text\"}]}, {\"value\": \"\", \"tagName\": \"input\", \"attributes\": [{\"name\": \"type\", \"value\": \"checkbox\"}]}, {\"value\": \"\", \"tagName\": \"input\", \"attributes\": [{\"name\": \"type\", \"value\": \"email\"}]}]}]',1,'101'),('10102',_binary '<p>Create a HTML file with H1, H2 , P and Textbox. The Style of H1 is blue in color</p>','[{\"name\": \"index\", \"elements\": [{\"value\": \"blue\", \"tagName\": \"h1\", \"attributes\": [{\"name\": \"id\", \"value\": \"class_h1\"}]}, {\"value\": \"right\", \"tagName\": \"p\", \"attributes\": [{\"name\": \"className\", \"value\": \"align\"}]}]}]',1,'101'),('10103',_binary '<p>Bike service application Overview This application is for owners of Bike service stations. It helps the owners to list all the services they offer. Customers can choose one or more services to book Example: John owns a service station. He provides the following services: - General service check-up - Oil change - Water wash John’s customers can register for an account with their email address and mobile number. They can choose a service. Book the service at a particular date. Once the customer booked a service, John receives an email notification with details about the service requested by the customer. Once the service is completed, john will mark the specific booking (of a customer) as “ ready for delivery” The customer will receive an email saying that his bike is ready for delivery. Once delivered, John will mark the booking as “completed” Specifications: Bike station owner: - Should be able to create / edit / delete all his services and their details - View a list of all bookings ( pending, ready for delivery and completed) - View details of each booking - Mark a booking as ready for delivery - Mark a booking as completed - Receive an email whenever a booking is made Customers - Should be able to register for an account with his email address and mobile number - Book a service at a particular date - See the status of his booking - See all his previous bookings - Receive an email as soon as his booking is ready for deliver</p>','[{\"name\": \"home page\", \"elements\": [{\"value\": \"Bike Service\", \"tagName\": \"h1\", \"attributes\": []}, {\"value\": \"General Service CheckUp\", \"tagName\": \"li\", \"attributes\": []}]}]',1,'101'),('10104',_binary '<p>&nbsp;&lt;div class=\"container mt-5\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h1 class=\"text-center\"&gt;CRM Application Project Description&lt;/h1&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Objective&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Develop a CRM application using the MERN stack (MySQL, Express.js, React.js, and Node.js). The application will include role-based login functionality for Admin, Manager, BDM (Business Development Manager), and BDE (Business Development Executive). Each user will be able to register with their company domain email and roles, and reporting persons will be dynamically loaded from the database.&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Requirements&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;User Roles:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Admin:&lt;/strong&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Can add users belonging to the Manager, BDM, and BDE roles.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Cannot add other Admins.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Manager, BDM, BDE:&lt;/strong&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Can register with a company domain email (e.g., manager@abccollege.com).&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Cannot register with generic email providers (e.g., manager@gmail.com).&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Registration Form:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;The registration form must include the following fields:&lt;/p&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Name:&lt;/strong&gt; Text field for the user\'s name.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Phone Number:&lt;/strong&gt; Numeric field for the user\'s phone number.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Email ID:&lt;/strong&gt; Email field for the user\'s email address.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Reporting Person:&lt;/strong&gt; Dropdown menu dynamically populated with users from the Admin, Manager, and BDM roles.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Role:&lt;/strong&gt; Dropdown menu with roles (BDE, BDM, Manager).&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Password:&lt;/strong&gt; Password field for the user\'s password.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Employee Code:&lt;/strong&gt; Text field for the user\'s employee code.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Functional Requirements&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;User Registration:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Users must register with a company domain email address.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Validation to ensure the email is not from a generic email provider.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Form submission should save user details to the MySQL database.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Login Functionality:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Users can log in with their email and password.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Access should be restricted based on roles (e.g., only Admin can add users).&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Dynamic Dropdown Data:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;The Reporting Person and Role dropdowns should load data dynamically from the database.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Technical Specifications&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Frontend:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;React.js:&lt;/strong&gt; For building the user interface.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;React Router:&lt;/strong&gt; For handling routing between different pages (e.g., login, registration, dashboard).&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Form Validation:&lt;/strong&gt; Implement form validation to ensure correct data input.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Backend:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Node.js:&lt;/strong&gt; For server-side operations.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;Express.js:&lt;/strong&gt; For building the REST API.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;MySQL:&lt;/strong&gt; For the database to store user details and roles.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;strong&gt;JWT (JSON Web Tokens):&lt;/strong&gt; For handling authentication and authorization.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Project Steps&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Setup Environment:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Install Node.js and MySQL.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Set up a new React.js project.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Initialize a new Node.js project with Express.js.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Create Database:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Design the database schema.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Create the necessary tables in MySQL.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Backend Development:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Set up Express.js server.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Implement REST API endpoints for user registration, login, and fetching dynamic dropdown data.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Implement JWT for authentication.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h3&gt;Frontend Development:&lt;/h3&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Develop the registration and login forms using React.js.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Implement form validation.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Fetch dynamic data for dropdowns from the backend.&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p><br></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;section class=\"mt-4\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;h2&gt;Evaluation Criteria&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Performance Testing&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Page load Time&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Page Responsiveness&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Registration with gmail ID&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Admin Registration within Admin Login&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;Registration with company ID&lt;/li&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/section&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p>','[{\"name\": \"crm\", \"elements\": [{\"value\": \"\", \"tagName\": \"p\", \"attributes\": [{\"name\": \"className\", \"value\": \"check\"}]}]}]',1,'101');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `result_data` json DEFAULT NULL,
  `result_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `fk_result_user` (`userid`),
  CONSTRAINT `fk_result_user` FOREIGN KEY (`userid`) REFERENCES `cocube_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,8,'{\"AvgLoadTime\": 2983, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 5, \"category\": \"Required\"}]}','2025-04-18 04:09:31'),(2,8,'{\"AvgLoadTime\": 3148.5, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 04:42:23'),(3,8,'{\"AvgLoadTime\": 3201, \"EvaluationDetails\": [{\"name\": \"Page Layout in Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Page splitting - fraction\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Gap between Fraction\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card Padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Border for the card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Height inside card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Width inside card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 05:13:35'),(4,8,'{\"AvgLoadTime\": 2692, \"EvaluationDetails\": [{\"name\": \"Page Layout in Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Page splitting - fraction\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Gap between Fraction\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card Padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Border for the card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Height inside card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Width inside card\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 10:03:01'),(5,8,'{\"AvgLoadTime\": 2705, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 13:56:01'),(6,8,'{\"AvgLoadTime\": 4569, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 13:58:44'),(7,8,'{\"AvgLoadTime\": 4342.5, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 14:16:45'),(8,8,'{\"AvgLoadTime\": 3325, \"EvaluationDetails\": [{\"name\": \"Layout - Grid\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"grid-template-columns\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"grid gap 20px\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"card padding \", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"card border \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"image height\", \"score\": 5, \"category\": \"Essential\"}, {\"name\": \"Concurrent Load Time\", \"score\": 5, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Grid Layout\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements - Product Title Alignment\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 5, \"category\": \"Required\"}]}','2025-04-18 14:27:59'),(9,7,'{\"AvgLoadTime\": 1105, \"EvaluationDetails\": [{\"name\": \"Concurrent Load Time\", \"score\": 10, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"container - background color\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"container : padding\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"sub-text width\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"sub-text margin\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"sub-text padding\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"sub-text position\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image width\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Display\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Image Margin\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Page Layout with Grid\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page - Border Radius\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 15:06:27'),(10,6,'{\"AvgLoadTime\": 1113.5, \"EvaluationDetails\": [{\"name\": \"Concurrent Load Time\", \"score\": 10, \"category\": \"Efficiency\"}, {\"name\": \"Responsiveness\", \"score\": 20, \"category\": \"Efficiency\"}, {\"name\": \"Background Image Min height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Background Image - Positioning with display\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card Allignment - Horizantal\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card allignment - Vertical \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card rounded corner\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card padding\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card Width - Responsive\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card visual appearence\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Card Text alignment\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Profile Picture width \", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"Profile Picture - Height\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \" Profile Picture - Rounded Corner\", \"score\": 0, \"category\": \"Essential\"}, {\"name\": \"CSS Style - Smoothness & Performance\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"Aesthetics Elements\", \"score\": 0, \"category\": \"Required\"}, {\"name\": \"HTML Semantics - Basic Structure - HTML Structure Validation\", \"score\": 5, \"category\": \"Required\"}, {\"name\": \"CSS - Structure of a Page\", \"score\": 0, \"category\": \"Required\"}]}','2025-04-18 15:35:01');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_questions`
--

DROP TABLE IF EXISTS `sample_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_questions`
--

LOCK TABLES `sample_questions` WRITE;
/*!40000 ALTER TABLE `sample_questions` DISABLE KEYS */;
INSERT INTO `sample_questions` VALUES (1,'<h1 class=\"text-center text-2xl font-bold\">CRM Application Project Description</h1>\n<section class=\"mt-4\">\n<h2 class=\"text-xl font-semibold\">Objective</h2>\n<p>Develop a CRM application using the MERN stack. The application will include role-based login functionality for Admin, Manager, BDM (Business Development Manager), and BDE (Business Development Executive). Each user will register with a company domain email, and reporting persons will be dynamically loaded from the database.</p>\n</section>\n<section class=\"mt-4\">\n<h2 class=\"text-xl font-semibold\">Requirements</h2>\n<h3 class=\"text-lg font-medium\">User Roles:</h3>\n<ul class=\"list-disc pl-5\">\n<li><strong>Admin:</strong>\n<ul class=\"list-disc pl-5\">\n<li>Can add users belonging to the Manager, BDM, and BDE roles.</li>\n<li>Cannot add other Admins.</li>\n</ul>\n</li>\n<li><strong>Manager, BDM, BDE:</strong>\n<ul class=\"list-disc pl-5\">\n<li>Can register with a company domain email (e.g., manager@abccollege.com).</li>\n<li>Cannot register with generic email providers (e.g., manager@gmail.com).</li>\n</ul>\n</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2 class=\"text-xl font-semibold\">Functional Requirements</h2>\n<h3 class=\"text-lg font-medium\">User Registration:</h3>\n<ul class=\"list-disc pl-5\">\n<li>Users must register with a company domain email address.</li>\n<li>Validation to ensure the email is not from a generic email provider.</li>\n<li>Form submission should save user details to the MySQL database.</li>\n</ul>\n<h3 class=\"text-lg font-medium\">Login Functionality:</h3>\n<ul class=\"list-disc pl-5\">\n<li>Users can log in with their email and password.</li>\n<li>Access should be restricted based on roles (e.g., only Admin can add users).</li>\n</ul>\n<h3 class=\"text-lg font-medium\">Dynamic Dropdown Data:</h3>\n<ul class=\"list-disc pl-5\">\n<li>The Reporting Person and Role dropdowns should load data dynamically from the database.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2 class=\"text-xl font-semibold\">Technical Specifications</h2>\n<h3 class=\"text-lg font-medium\">Frontend:</h3>\n<ul class=\"list-disc pl-5\">\n<li><strong>React.js:</strong>&nbsp;For building the user interface.</li>\n<li><strong>React Router:</strong>&nbsp;For handling routing between different pages (e.g., login, registration, dashboard).</li>\n<li><strong>Form Validation:</strong>&nbsp;Implement form validation to ensure correct data input.</li>\n</ul>\n<h3 class=\"text-lg font-medium\">Backend:</h3>\n<ul class=\"list-disc pl-5\">\n<li><strong>Node.js:</strong>&nbsp;For server-side operations.</li>\n<li><strong>Express.js:</strong>&nbsp;For building the REST API.</li>\n<li><strong>MySQL:</strong>&nbsp;For the database to store user details and roles.</li>\n<li><strong>JWT (JSON Web Tokens):</strong>&nbsp;For handling authentication and authorization.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2 class=\"text-xl font-semibold\">Evaluation Criteria</h2>\n<ul class=\"list-disc pl-5\">\n<li>Performance Testing</li>\n<li>Page Load Time</li>\n<li>Page Responsiveness</li>\n<li>Registration with Gmail ID</li>\n<li>Admin Registration within Admin Login</li>\n<li>Registration with Company ID</li>\n</ul>\n</section>'),(2,'<h1 class=\"text-center\">CRM Application Project Description</h1>\n<section class=\"mt-4\">\n<h2>Objective</h2>\n<p>Develop a CRM application using the MERN stack (MySQL, Express.js, React.js, and Node.js). The application will include role-based login functionality for Admin, Manager, BDM (Business Development Manager), and BDE (Business Development Executive). Each user will be able to register with their company domain email and roles, and reporting persons will be dynamically loaded from the database.</p>\n</section>\n<section class=\"mt-4\">\n<h2>Requirements</h2>\n<h3>User Roles:</h3>\n<ul>\n<li><strong>Admin:</strong>\n<ul>\n<li>Can add users belonging to the Manager, BDM, and BDE roles.</li>\n<li>Cannot add other Admins.</li>\n</ul>\n</li>\n<li><strong>Manager, BDM, BDE:</strong>\n<ul>\n<li>Can register with a company domain email (e.g., manager@abccollege.com).</li>\n<li>Cannot register with generic email providers (e.g., manager@gmail.com).</li>\n</ul>\n</li>\n</ul>\n<h3>Registration Form:</h3>\n<p>The registration form must include the following fields:</p>\n<ul>\n<li><strong>Name:</strong>&nbsp;Text field for the user\'s name.</li>\n<li><strong>Phone Number:</strong>&nbsp;Numeric field for the user\'s phone number.</li>\n<li><strong>Email ID:</strong>&nbsp;Email field for the user\'s email address.</li>\n<li><strong>Reporting Person:</strong>&nbsp;Dropdown menu dynamically populated with users from the Admin, Manager, and BDM roles.</li>\n<li><strong>Role:</strong>&nbsp;Dropdown menu with roles (BDE, BDM, Manager).</li>\n<li><strong>Password:</strong>&nbsp;Password field for the user\'s password.</li>\n<li><strong>Employee Code:</strong>&nbsp;Text field for the user\'s employee code.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2>Functional Requirements</h2>\n<h3>User Registration:</h3>\n<ul>\n<li>Users must register with a company domain email address.</li>\n<li>Validation to ensure the email is not from a generic email provider.</li>\n<li>Form submission should save user details to the MySQL database.</li>\n</ul>\n<h3>Login Functionality:</h3>\n<ul>\n<li>Users can log in with their email and password.</li>\n<li>Access should be restricted based on roles (e.g., only Admin can add users).</li>\n</ul>\n<h3>Dynamic Dropdown Data:</h3>\n<ul>\n<li>The Reporting Person and Role dropdowns should load data dynamically from the database.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2>Technical Specifications</h2>\n<h3>Frontend:</h3>\n<ul>\n<li><strong>React.js:</strong>&nbsp;For building the user interface.</li>\n<li><strong>React Router:</strong>&nbsp;For handling routing between different pages (e.g., login, registration, dashboard).</li>\n<li><strong>Form Validation:</strong>&nbsp;Implement form validation to ensure correct data input.</li>\n</ul>\n<h3>Backend:</h3>\n<ul>\n<li><strong>Node.js:</strong>&nbsp;For server-side operations.</li>\n<li><strong>Express.js:</strong>&nbsp;For building the REST API.</li>\n<li><strong>MySQL:</strong>&nbsp;For the database to store user details and roles.</li>\n<li><strong>JWT (JSON Web Tokens):</strong>&nbsp;For handling authentication and authorization.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2>Project Steps</h2>\n<h3>Setup Environment:</h3>\n<ul>\n<li>Install Node.js and MySQL.</li>\n<li>Set up a new React.js project.</li>\n<li>Initialize a new Node.js project with Express.js.</li>\n</ul>\n<h3>Create Database:</h3>\n<ul>\n<li>Design the database schema.</li>\n<li>Create the necessary tables in MySQL.</li>\n</ul>\n<h3>Backend Development:</h3>\n<ul>\n<li>Set up Express.js server.</li>\n<li>Implement REST API endpoints for user registration, login, and fetching dynamic dropdown data.</li>\n<li>Implement JWT for authentication.</li>\n</ul>\n<h3>Frontend Development:</h3>\n<ul>\n<li>Develop the registration and login forms using React.js.</li>\n<li>Implement form validation.</li>\n<li>Fetch dynamic data for dropdowns from the backend.</li>\n</ul>\n</section>\n<section class=\"mt-4\">\n<h2>Evaluation Criteria</h2>\n<ul>\n<li>Performance Testing</li>\n<li>Page load Time</li>\n<li>Page Responsiveness</li>\n<li>Registration with gmail ID</li>\n<li>Admin Registration within Admin Login</li>\n<li>Registration with company ID</li>\n</ul>\n</section>');
/*!40000 ALTER TABLE `sample_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `subcategory_id` varchar(10) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES ('101','FrontEnd',1),('102','backend',1),('103','mysql',1),('104','javascript',1),('201','number system',2);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_log` (
  `userid` int DEFAULT NULL,
  `log_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_code` int DEFAULT NULL,
  `log_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`log_id`),
  KEY `fk_user` (`userid`),
  KEY `fk_activity` (`activity_code`),
  CONSTRAINT `fk_activity` FOREIGN KEY (`activity_code`) REFERENCES `log_master` (`activity_code`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `cocube_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (8,'2025-04-17 13:23:26','2025-04-17 13:23:26',1,1),(6,'2025-04-17 15:42:31','2025-04-17 15:42:31',1,2),(6,'2025-04-17 15:42:42','2025-04-17 15:42:42',2,3),(6,'2025-04-17 16:11:14','2025-04-17 16:11:14',4,4),(6,'2025-04-17 16:11:14','2025-04-17 16:11:14',5,5),(6,'2025-04-17 16:18:17','2025-04-17 16:18:17',1,6),(6,'2025-04-17 16:18:27','2025-04-17 16:18:27',2,7),(6,'2025-04-17 16:22:44','2025-04-17 16:22:44',3,8),(6,'2025-04-17 16:22:57','2025-04-17 16:22:57',3,9),(6,'2025-04-17 16:23:35','2025-04-17 16:23:35',4,10),(6,'2025-04-17 16:23:35','2025-04-17 16:23:35',5,11),(8,'2025-04-17 16:34:10','2025-04-17 16:34:10',1,12),(8,'2025-04-17 16:34:22','2025-04-17 16:34:22',2,13),(8,'2025-04-17 16:38:43','2025-04-17 16:38:43',3,14),(8,'2025-04-17 16:49:30','2025-04-17 16:49:30',3,15),(8,'2025-04-17 16:50:19','2025-04-17 16:50:19',3,16),(8,'2025-04-17 16:51:44','2025-04-17 16:51:44',3,17),(8,'2025-04-17 16:53:06','2025-04-17 16:53:06',3,18),(8,'2025-04-17 16:54:26','2025-04-17 16:54:26',3,19),(6,'2025-04-17 16:57:17','2025-04-17 16:57:17',1,20),(6,'2025-04-17 16:57:35','2025-04-17 16:57:35',5,21),(6,'2025-04-17 16:57:35','2025-04-17 16:57:35',4,22),(6,'2025-04-17 16:57:56','2025-04-17 16:57:56',1,23),(6,'2025-04-17 16:58:18','2025-04-17 16:58:18',2,24),(6,'2025-04-17 17:01:12','2025-04-17 17:01:12',5,25),(6,'2025-04-17 17:01:12','2025-04-17 17:01:12',4,26),(8,'2025-04-17 17:01:37','2025-04-17 17:01:37',1,27),(8,'2025-04-17 17:01:48','2025-04-17 17:01:48',2,28),(8,'2025-04-17 17:09:10','2025-04-17 17:09:10',1,29),(8,'2025-04-17 17:09:22','2025-04-17 17:09:22',2,30),(8,'2025-04-17 17:11:11','2025-04-17 17:11:11',2,31),(8,'2025-04-17 17:48:23','2025-04-17 17:48:23',4,32),(8,'2025-04-17 17:48:23','2025-04-17 17:48:23',5,33),(6,'2025-04-18 03:57:17','2025-04-18 03:57:17',1,34),(7,'2025-04-18 03:57:40','2025-04-18 03:57:40',1,35),(7,'2025-04-18 03:58:26','2025-04-18 03:58:26',2,36),(7,'2025-04-18 03:59:22','2025-04-18 03:59:22',4,37),(7,'2025-04-18 03:59:22','2025-04-18 03:59:22',5,38),(8,'2025-04-18 03:59:33','2025-04-18 03:59:33',1,39),(8,'2025-04-18 03:59:43','2025-04-18 03:59:43',2,40),(8,'2025-04-18 04:27:08','2025-04-18 04:27:08',4,41),(8,'2025-04-18 04:27:08','2025-04-18 04:27:08',5,42),(8,'2025-04-18 04:33:06','2025-04-18 04:33:06',1,43),(8,'2025-04-18 04:33:19','2025-04-18 04:33:19',2,44),(8,'2025-04-18 04:35:21','2025-04-18 04:35:21',4,45),(8,'2025-04-18 04:35:21','2025-04-18 04:35:21',5,46),(8,'2025-04-18 04:35:22','2025-04-18 04:35:22',3,47),(8,'2025-04-18 04:37:31','2025-04-18 04:37:31',1,48),(8,'2025-04-18 04:37:42','2025-04-18 04:37:42',2,49),(8,'2025-04-18 04:42:23','2025-04-18 04:42:23',3,50),(8,'2025-04-18 05:13:35','2025-04-18 05:13:35',3,51),(8,'2025-04-18 05:15:23','2025-04-18 05:15:23',4,52),(8,'2025-04-18 05:15:23','2025-04-18 05:15:23',5,53),(8,'2025-04-18 05:15:52','2025-04-18 05:15:52',1,54),(8,'2025-04-18 05:16:04','2025-04-18 05:16:04',2,55),(8,'2025-04-18 05:20:33','2025-04-18 05:20:33',3,56),(8,'2025-04-18 06:18:55','2025-04-18 06:18:55',4,57),(8,'2025-04-18 06:18:55','2025-04-18 06:18:55',5,58),(8,'2025-04-18 06:18:57','2025-04-18 06:18:57',3,59),(8,'2025-04-18 08:54:32','2025-04-18 08:54:32',1,60),(8,'2025-04-18 09:14:59','2025-04-18 09:14:59',1,61),(8,'2025-04-18 09:15:16','2025-04-18 09:15:16',2,62),(8,'2025-04-18 09:20:37','2025-04-18 09:20:37',1,63),(8,'2025-04-18 09:21:28','2025-04-18 09:21:28',2,64),(8,'2025-04-18 09:38:23','2025-04-18 09:38:23',4,65),(8,'2025-04-18 09:38:23','2025-04-18 09:38:23',5,66),(8,'2025-04-18 09:39:12','2025-04-18 09:39:12',1,67),(8,'2025-04-18 09:39:38','2025-04-18 09:39:38',2,68),(8,'2025-04-18 09:40:19','2025-04-18 09:40:19',3,69),(8,'2025-04-18 09:40:19','2025-04-18 09:40:19',3,70),(8,'2025-04-18 09:44:27','2025-04-18 09:44:27',3,71),(8,'2025-04-18 09:45:43','2025-04-18 09:45:43',3,72),(8,'2025-04-18 09:46:05','2025-04-18 09:46:05',3,73),(8,'2025-04-18 09:47:02','2025-04-18 09:47:02',3,74),(8,'2025-04-18 09:47:11','2025-04-18 09:47:11',3,75),(8,'2025-04-18 09:47:46','2025-04-18 09:47:46',3,76),(8,'2025-04-18 09:48:12','2025-04-18 09:48:12',3,77),(8,'2025-04-18 09:48:24','2025-04-18 09:48:24',3,78),(8,'2025-04-18 09:49:16','2025-04-18 09:49:16',3,79),(8,'2025-04-18 09:53:30','2025-04-18 09:53:30',3,80),(8,'2025-04-18 09:57:45','2025-04-18 09:57:45',3,81),(8,'2025-04-18 09:58:04','2025-04-18 09:58:04',3,82),(8,'2025-04-18 10:01:25','2025-04-18 10:01:25',3,83),(8,'2025-04-18 10:03:01','2025-04-18 10:03:01',3,84),(8,'2025-04-18 10:13:58','2025-04-18 10:13:58',4,85),(8,'2025-04-18 10:13:58','2025-04-18 10:13:58',5,86),(8,'2025-04-18 10:14:00','2025-04-18 10:14:00',3,87),(8,'2025-04-18 10:14:43','2025-04-18 10:14:43',1,88),(8,'2025-04-18 10:14:55','2025-04-18 10:14:55',2,89),(8,'2025-04-18 10:32:12','2025-04-18 10:32:12',1,90),(8,'2025-04-18 10:41:50','2025-04-18 10:41:50',4,91),(8,'2025-04-18 10:41:50','2025-04-18 10:41:50',5,92),(8,'2025-04-18 10:42:18','2025-04-18 10:42:18',1,93),(8,'2025-04-18 10:42:28','2025-04-18 10:42:28',2,94),(8,'2025-04-18 10:43:10','2025-04-18 10:43:10',3,95),(8,'2025-04-18 10:43:48','2025-04-18 10:43:48',3,96),(8,'2025-04-18 10:44:38','2025-04-18 10:44:38',3,97),(8,'2025-04-18 10:48:51','2025-04-18 10:48:51',3,98),(8,'2025-04-18 11:38:21','2025-04-18 11:38:21',1,99),(8,'2025-04-18 11:38:37','2025-04-18 11:38:37',2,100),(8,'2025-04-18 11:39:08','2025-04-18 11:39:08',5,101),(8,'2025-04-18 11:39:08','2025-04-18 11:39:08',4,102),(8,'2025-04-18 11:39:09','2025-04-18 11:39:09',3,103),(8,'2025-04-18 11:40:00','2025-04-18 11:40:00',1,104),(8,'2025-04-18 11:40:19','2025-04-18 11:40:19',2,105),(8,'2025-04-18 11:41:00','2025-04-18 11:41:00',3,106),(9,'2025-04-18 12:03:11','2025-04-18 12:03:11',1,107),(8,'2025-04-18 12:35:16','2025-04-18 12:35:16',4,108),(8,'2025-04-18 12:35:16','2025-04-18 12:35:16',5,109),(8,'2025-04-18 12:35:17','2025-04-18 12:35:17',3,110),(9,'2025-04-18 12:36:22','2025-04-18 12:36:22',2,111),(9,'2025-04-18 12:38:25','2025-04-18 12:38:25',3,112),(9,'2025-04-18 12:38:46','2025-04-18 12:38:46',4,113),(9,'2025-04-18 12:38:46','2025-04-18 12:38:46',5,114),(9,'2025-04-18 12:38:50','2025-04-18 12:38:50',5,115),(9,'2025-04-18 12:38:50','2025-04-18 12:38:50',4,116),(8,'2025-04-18 12:53:13','2025-04-18 12:53:13',1,117),(8,'2025-04-18 12:53:25','2025-04-18 12:53:25',2,118),(8,'2025-04-18 12:54:06','2025-04-18 12:54:06',3,119),(8,'2025-04-18 13:41:45','2025-04-18 13:41:45',4,120),(8,'2025-04-18 13:41:45','2025-04-18 13:41:45',5,121),(8,'2025-04-18 13:41:47','2025-04-18 13:41:47',3,122),(8,'2025-04-18 13:50:44','2025-04-18 13:50:44',1,123),(8,'2025-04-18 13:50:59','2025-04-18 13:50:59',2,124),(8,'2025-04-18 13:54:11','2025-04-18 13:54:11',3,125),(8,'2025-04-18 13:56:01','2025-04-18 13:56:01',3,126),(8,'2025-04-18 13:58:44','2025-04-18 13:58:44',3,127),(8,'2025-04-18 14:16:45','2025-04-18 14:16:45',3,128),(8,'2025-04-18 14:16:55','2025-04-18 14:16:55',4,129),(8,'2025-04-18 14:16:55','2025-04-18 14:16:55',5,130),(8,'2025-04-18 14:17:42','2025-04-18 14:17:42',1,131),(8,'2025-04-18 14:17:53','2025-04-18 14:17:53',2,132),(8,'2025-04-18 14:21:21','2025-04-18 14:21:21',1,133),(8,'2025-04-18 14:21:55','2025-04-18 14:21:55',2,134),(8,'2025-04-18 14:27:59','2025-04-18 14:27:59',3,135),(8,'2025-04-18 14:37:08','2025-04-18 14:37:08',5,136),(8,'2025-04-18 14:37:08','2025-04-18 14:37:08',4,137),(7,'2025-04-18 14:54:58','2025-04-18 14:54:58',1,138),(7,'2025-04-18 14:55:26','2025-04-18 14:55:26',2,139),(7,'2025-04-18 14:58:12','2025-04-18 14:58:12',2,140),(7,'2025-04-18 15:01:02','2025-04-18 15:01:02',5,141),(7,'2025-04-18 15:01:02','2025-04-18 15:01:02',4,142),(7,'2025-04-18 15:02:01','2025-04-18 15:02:01',1,143),(7,'2025-04-18 15:02:13','2025-04-18 15:02:13',2,144),(7,'2025-04-18 15:06:27','2025-04-18 15:06:27',3,145),(7,'2025-04-18 15:06:47','2025-04-18 15:06:47',4,146),(7,'2025-04-18 15:06:47','2025-04-18 15:06:47',5,147),(6,'2025-04-18 15:07:41','2025-04-18 15:07:41',1,148),(6,'2025-04-18 15:07:54','2025-04-18 15:07:54',2,149),(6,'2025-04-18 15:14:17','2025-04-18 15:14:17',5,150),(6,'2025-04-18 15:14:17','2025-04-18 15:14:17',4,151),(6,'2025-04-18 15:14:53','2025-04-18 15:14:53',1,152),(6,'2025-04-18 15:15:04','2025-04-18 15:15:04',2,153),(6,'2025-04-18 15:16:04','2025-04-18 15:16:04',4,154),(6,'2025-04-18 15:16:04','2025-04-18 15:16:04',5,155),(6,'2025-04-18 15:16:21','2025-04-18 15:16:21',1,156),(6,'2025-04-18 15:16:31','2025-04-18 15:16:31',2,157),(6,'2025-04-18 15:33:25','2025-04-18 15:33:25',1,158),(6,'2025-04-18 15:33:35','2025-04-18 15:33:35',2,159),(6,'2025-04-18 15:35:01','2025-04-18 15:35:01',3,160),(6,'2025-04-18 15:37:07','2025-04-18 15:37:07',4,161),(6,'2025-04-18 15:37:07','2025-04-18 15:37:07',5,162),(6,'2025-04-18 15:37:11','2025-04-18 15:37:11',5,163),(6,'2025-04-18 15:37:11','2025-04-18 15:37:11',4,164);
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18 21:24:52
