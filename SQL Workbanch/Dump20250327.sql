CREATE DATABASE  IF NOT EXISTS `universita` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universita`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: universita
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `assistente`
--

DROP TABLE IF EXISTS `assistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistente` (
  `id_assistente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_assistente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistente`
--

LOCK TABLES `assistente` WRITE;
/*!40000 ALTER TABLE `assistente` DISABLE KEYS */;
INSERT INTO `assistente` VALUES (1,'Marco','Rossi','marco.rossi@gmail.com'),(2,'Giulia','Bianchi','giulia.bianchi@outlook.com'),(3,'Luca','Ferrari','luca.ferrari@yahoo.com'),(4,'Sofia','Romano','sofia.romano@libero.it'),(5,'Andrea','Colombo','andrea.colombo@hotmail.com'),(6,'Chiara','Conti','chiara.conti@gmail.com'),(7,'Matteo','Gallo','matteo.gallo@outlook.com'),(8,'Alessia','Rizzo','alessia.rizzo@yahoo.com'),(9,'Federico','Marino','federico.marino@libero.it'),(10,'Greta','Greco','greta.greco@hotmail.com'),(11,'Davide','Barbieri','davide.barbieri@gmail.com'),(12,'Elisa','Moretti','elisa.moretti@outlook.com'),(13,'Simone','Fontana','simone.fontana@yahoo.com'),(14,'Valentina','Caruso','valentina.caruso@libero.it'),(15,'Paolo','Mancini','paolo.mancini@azienda.com');
/*!40000 ALTER TABLE `assistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso` (
  `idcorso` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(45) DEFAULT NULL,
  `CFU` int DEFAULT NULL,
  `Semestre` varchar(45) DEFAULT NULL,
  `Aula` varchar(45) DEFAULT NULL,
  `idDocente` int DEFAULT NULL,
  `idFacolta` int DEFAULT NULL,
  PRIMARY KEY (`idcorso`),
  KEY `corso_idDocente` (`idDocente`),
  KEY `corso_idFacolta` (`idFacolta`),
  CONSTRAINT `corso_idDocente` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`),
  CONSTRAINT `corso_idFacolta` FOREIGN KEY (`idFacolta`) REFERENCES `facolta` (`idfacolta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso`
--

LOCK TABLES `corso` WRITE;
/*!40000 ALTER TABLE `corso` DISABLE KEYS */;
INSERT INTO `corso` VALUES (1,'Basi di Dati',9,'2','Aula A1',6,9),(2,'Intelligenza Artificiale',12,'4','Aula Lab. Informatica',6,9),(3,'Letteratura Italiana',6,'1','Aula 101',7,7),(4,'Fisica Quantistica',12,'3','Aula Fermi',4,11),(5,'Machine Learning',6,'5','Aula Turing',6,9),(6,'Diritto Commerciale',9,'2','Aula B203',12,3),(7,'Chimica Organica',6,'1','Lab. Chimica',3,12),(8,'Storia dell\'Arte',6,'4','Aula Magna',7,14),(9,'Economia Aziendale',9,'3','Aula 15',1,4),(10,'Programmazione Avanzata',12,'2','Aula C4',6,9);
/*!40000 ALTER TABLE `corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipartimento`
--

DROP TABLE IF EXISTS `dipartimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipartimento` (
  `codiceDipartimento` int NOT NULL AUTO_INCREMENT,
  `Edificio` varchar(45) DEFAULT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codiceDipartimento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipartimento`
--

LOCK TABLES `dipartimento` WRITE;
/*!40000 ALTER TABLE `dipartimento` DISABLE KEYS */;
INSERT INTO `dipartimento` VALUES (1,'Edificio Leonardo da Vinci','Architettura'),(2,'Edificio Galileo Galilei','Scienze'),(3,'Edificio Marie Curie','Chimica'),(4,'Edificio Albert Einstein','Fisica'),(5,'Edificio Frida Kahlo','Scienze Politiche'),(6,'Edificio Steve Jobs','Informatica'),(7,'Edificio Rita Levi-Montalcini','Lettere'),(8,'Edificio Michelangelo Buonarroti','Archittetura'),(9,'Edificio Margherita Hack','Economia'),(10,'Edificio Enzo Ferrari','Ingegneria'),(11,'Edificio Anna Magnani','Medicina'),(12,'Edificio Dante Alighieri','Giurisprudenza'),(13,'Edificio Nikola Tesla','Psicologia'),(14,'Edificio Maria Montessori','Lingue'),(15,'Edificio Alessandro Volta','Fisica');
/*!40000 ALTER TABLE `dipartimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `idDocente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `id_assistente` int DEFAULT NULL,
  `codiceDipartimento` int DEFAULT NULL,
  PRIMARY KEY (`idDocente`),
  KEY `docente_idassistente` (`id_assistente`),
  KEY `docente_codiceDipartimento` (`codiceDipartimento`),
  CONSTRAINT `docente_codiceDipartimento` FOREIGN KEY (`codiceDipartimento`) REFERENCES `dipartimento` (`codiceDipartimento`),
  CONSTRAINT `docente_idassistente` FOREIGN KEY (`id_assistente`) REFERENCES `assistente` (`id_assistente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Elena','De Luca','elena.deluca@protonmail.com',15,5),(2,'Francesco','Marchetti','francesco.marchetti@fastwebnet.it',12,15),(3,'Beatrice','Lombardi','beatrice.lombardi@email.com',9,12),(4,'Gabriele','Rinaldi','gabriele.rinaldi@tin.it',3,10),(5,'Serena','Pellegrini','serena.pellegrini@alice.it',6,8),(6,'Roberto','Monti','roberto.monti@virgilio.it',10,2),(7,'Alice','Serra','alice.serra@tutanota.com',7,1),(8,'Diego','Fiore','diego.fiore@icloud.com',8,4),(9,'Martina','Marini','martina.marini@live.com',11,9),(10,'Simone','Coppola','simone.coppola@aruba.it',13,13),(11,'Laura','D\'Angelo','laura.dangelo@stud.unifi.it',1,11),(12,'Antonio','Palmieri','antonio.palmieri@unibo.it',14,3),(13,'Silvia','Bernardi','silvia.bernardi@polimi.it',2,6),(14,'Vittorio','Morelli','vittorio.morelli@uniroma3.it',4,7),(15,'Clara','Testa','clara.testa@cnr.it',5,14);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facolta`
--

DROP TABLE IF EXISTS `facolta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facolta` (
  `idfacolta` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Sede` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idfacolta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facolta`
--

LOCK TABLES `facolta` WRITE;
/*!40000 ALTER TABLE `facolta` DISABLE KEYS */;
INSERT INTO `facolta` VALUES (1,'Medicina','Via del Corso 123'),(2,'Ingegneria','Via Nazionale 45'),(3,'Giurisprudenza','Viale Trastevere 78'),(4,'Economia','Via Vittorio Veneto 12'),(5,'Architettura','Via dei Fori Imperiali 9'),(6,'Psicologia','Via Giulia 32'),(7,'Lettere','Via Appia Nuova 101'),(8,'Scienze Politiche','Via Ostiense 56'),(9,'Informatica','Via Tuscolana 204'),(10,'Matematica','Via Cola di Rienzo 88'),(11,'Fisica','Via della Conciliazione 7'),(12,'Chimica','Via Cavour 19'),(13,'Biologia','Via del Babuino 3'),(14,'Storia','Via Margutta 15'),(15,'Filosofia','Via del Tritone 75');
/*!40000 ALTER TABLE `facolta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `matricola` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `AnnoIscrizione` int DEFAULT NULL,
  PRIMARY KEY (`matricola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (180001,'Marco','Ferrari','1999-11-07','marco.ferrari@yahoo.com',2018),(180002,'Federico','Marino','1998-04-12','federico.marino@tin.it',2018),(180003,'Elisa','Moretti','1999-10-11','elisa.moretti@live.com',2018),(190001,'Luca','Rossi','2000-05-15','luca.rossi@gmail.com',2019),(190002,'Chiara','Conti','2000-09-18','chiara.conti@protonmail.com',2019),(200001,'Giulia','Bianchi','2001-08-23','giulia.bianchi@hotmail.com',2020),(200002,'Alessia','Rizzo','2001-12-25','alessia.rizzo@fastwebnet.it',2020),(200003,'Simone','Fontana','2000-07-19','simone.fontana@icloud.com',2020),(200004,'Paolo','Mancini','2001-03-15','paolo.mancini@aruba.it',2020),(210001,'Sofia','Romano','2002-03-30','sofia.romano@libero.it',2021),(210002,'Greta','Greco','2002-06-05','greta.greco@alice.it',2021),(220001,'Andrea','Colombo','2003-01-14','andrea.colombo@outlook.com',2022),(220002,'Davide','Barbieri','2003-02-28','davide.barbieri@virgilio.it',2022),(230001,'Matteo','Galli','2004-07-09','matteo.galli@email.it',2023),(230002,'Valentina','Caruso','2005-04-02','valentina.caruso@studenti.uniroma.it',2023);
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesi`
--

DROP TABLE IF EXISTS `tesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesi` (
  `idTesi` int NOT NULL AUTO_INCREMENT,
  `idDocente` int DEFAULT NULL,
  `matricola` int DEFAULT NULL,
  `voto` int DEFAULT NULL,
  PRIMARY KEY (`idTesi`),
  KEY `tesi_idDocente` (`idDocente`),
  KEY `matricola_Studente` (`matricola`),
  CONSTRAINT `matricola_Studente` FOREIGN KEY (`matricola`) REFERENCES `studente` (`matricola`),
  CONSTRAINT `tesi_idDocente` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesi`
--

LOCK TABLES `tesi` WRITE;
/*!40000 ALTER TABLE `tesi` DISABLE KEYS */;
INSERT INTO `tesi` VALUES (11,5,190001,28),(12,12,200001,30),(13,3,210001,25),(14,8,220001,18),(15,15,190002,27),(16,2,230001,29),(17,7,200002,24),(18,11,180002,22),(19,4,210002,30),(20,9,200004,19);
/*!40000 ALTER TABLE `tesi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 19:39:25
