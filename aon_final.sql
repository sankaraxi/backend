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
  `employee_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `cocube_user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `cocube_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocube_user`
--

LOCK TABLES `cocube_user` WRITE;
/*!40000 ALTER TABLE `cocube_user` DISABLE KEYS */;
INSERT INTO `cocube_user` VALUES (1,'instructor',9874563210,'instructor@gmail.com','instructor@123',2,NULL,NULL,NULL,NULL),(2,'student',9876543210,'student@gmail.com','student@123',3,'a1l1q1',NULL,NULL,NULL),(3,'admin',9087654321,'admin@gmail.com','admin@123',1,'',NULL,NULL,NULL),(4,'frontend',8745963210,'frontend@kggl.com','frontend@123',4,'a1l1q1',NULL,NULL,NULL),(5,'fullstack',758496321,'fullstack@kggl.com','fullstack@123',5,NULL,NULL,NULL,NULL),(6,'demouser1',8907654321,'user1@kggeniuslabs.com','demouser1@123',4,'a1l1q1',8084,5177,'25KG01'),(7,'demouser2',6543217890,'user2@kggeniuslabs.com','demouser2@123',4,'a1l1q2',8082,5175,'25KG02'),(8,'demouser3',3543217890,'user3@kggeniuslabs.com','demouser3@123',4,'a1l1q3',8080,5173,'25KG03'),(9,'demouser4',6543217890,'user4@kggeniuslabs.com','demouser4@123',4,'a1l1q1',8086,5179,'25KG04'),(10,'demouser5',4388217890,'user5@kggeniuslabs.com','demouser5@123',4,'a1l1q2',8088,5181,'25KG05'),(11,'demouser6',8821789043,'user6@kggeniuslabs.com','demouser6@123',4,'a1l1q3',8090,5183,'25KG06'),(12,'demouser7',2178904334,'user7@kggeniuslabs.com','demouser7@123',4,'a1l1q1',8092,5185,'25KG07'),(13,'demouser8',7890433412,'user8@kggeniuslabs.com','demouser8@123',4,'a1l1q2',8094,5187,'25KG08'),(14,'demouser9',9043341200,'user9@kggeniuslabs.com','demouser9@123',4,'a1l1q3',8096,5189,'25KG09');
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
  `overall_result` json DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `fk_result_user` (`userid`),
  CONSTRAINT `fk_result_user` FOREIGN KEY (`userid`) REFERENCES `cocube_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreference`
--

DROP TABLE IF EXISTS `userreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `employeeNo` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employeeNo` (`employeeNo`),
  KEY `fk_user_reference_user` (`userId`),
  CONSTRAINT `fk_user_reference_user` FOREIGN KEY (`userId`) REFERENCES `cocube_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreference`
--

LOCK TABLES `userreference` WRITE;
/*!40000 ALTER TABLE `userreference` DISABLE KEYS */;
INSERT INTO `userreference` VALUES (1,6,'test','21test','2025-04-30 04:02:43'),(7,6,'liveflix','21t3','2025-04-30 04:06:30'),(8,6,'Sankar','21AIB31','2025-04-30 04:11:36'),(9,6,'21test','21test3','2025-04-30 04:12:10'),(10,8,'shiju','2025kgg','2025-04-30 04:22:39'),(11,7,'TestUser','test21','2025-04-30 05:05:34'),(12,7,'test2','test2','2025-04-30 05:15:13'),(13,9,'demo4','demo4','2025-04-30 09:04:21'),(14,12,'Test','ddgf5','2025-05-01 15:44:17'),(15,12,'test','test1','2025-05-01 16:35:01'),(16,13,'test','test45','2025-05-01 16:58:09'),(17,13,'tes432','test223','2025-05-01 17:15:24'),(18,12,'test','423d','2025-05-01 17:21:52'),(19,11,'liveflix','host213','2025-05-01 17:27:23'),(20,14,'testew','e234','2025-05-01 18:07:03'),(21,11,'fdfd','e345','2025-05-01 18:24:42');
/*!40000 ALTER TABLE `userreference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02  0:04:27
