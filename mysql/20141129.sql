-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: honux77
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(64) DEFAULT NULL,
  `course_desc` varchar(255) DEFAULT NULL,
  `lecturer` char(12) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `lecturer` (`lecturer`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`lecturer`) REFERENCES `user` (`uid`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`lecturer`) REFERENCES `user` (`uid`),
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`lecturer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'데이터베이스 베이직','관계형데이터베이스 및 mysql의 기초를 학습합니다. 프로그래밍에 대한 기초 경험이 필요합니다.','honux'),(2,'포인터의 기초','C언어를 배울 때 좌절하게 되는 큰 요인인 포인터에 대해 조금은 쉽게 접근해 봤습니다.','honux');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(64) DEFAULT NULL,
  `html` text,
  `cid` int(11) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `depth` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lid`),
  KEY `cid` (`cid`),
  KEY `prev_lid` (`line`),
  CONSTRAINT `lecture_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'과목소개',NULL,1,1,1),(2,'MySQL 설치 및 사용법',NULL,1,2,1),(3,'MySQL CRUD',NULL,1,3,1),(4,'Join',NULL,1,5,1),(5,'Database Modeling',NULL,1,4,1);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main` (
  `mid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `type` char(16) DEFAULT NULL,
  `udate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES (1,'데이터베이스 베이직','http://opentutorials.org/module/1256','관계형데이터베이스 및 mysql의 기초를 학습합니다. 프로그래밍에 대한 기초 경험이 필요합니다.','생활코딩','2014-11-20'),(2,'포인터의 기초','http://opentutorials.org/module/1034','C언어를 배울 때 좌절하게 되는 큰 요인인 포인터에 대해 조금은 쉽게 접근해 봤습니다.','생활코딩','2014-07-24'),(0,'git을 배워 봅시다.','https://honux77.wordpress.com/2014/11/12/git%EC%9D%84-%EB%B0%B0%EC%9B%8C-%EB%B4%85%EC%8B%9C%EB%8B%A4/','개발자들가 되서 실무를 시작하면 보통 VCS – version control system, 우리말로는 형상관리 시스템이라고도 합니다.- 라는 걸 사용해야 합니다...','블로그','2014-11-12');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` char(12) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `role` char(3) DEFAULT NULL,
  `email` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('honux','정호영','ATS','honux@naver.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome`
--

DROP TABLE IF EXISTS `welcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welcome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  `page` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome`
--

LOCK TABLES `welcome` WRITE;
/*!40000 ALTER TABLE `welcome` DISABLE KEYS */;
INSERT INTO `welcome` VALUES (1,'이것저것 개발자의 홈페이지','index'),(2,'누구나 배울 수 있어요.','lecture');
/*!40000 ALTER TABLE `welcome` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-29 15:54:20
