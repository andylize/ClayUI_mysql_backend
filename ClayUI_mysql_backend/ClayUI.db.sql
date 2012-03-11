-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ClayUI
-- ------------------------------------------------------
-- Server version	5.1.61

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
-- Table structure for table `AppPartData`
--

DROP TABLE IF EXISTS `AppPartData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppPartData` (
  `ApplicationID` int(11) NOT NULL,
  `AppPartID` int(11) NOT NULL,
  `DataTableName` varchar(50) NOT NULL DEFAULT '',
  `Version` int(11) DEFAULT '0',
  PRIMARY KEY (`ApplicationID`,`AppPartID`),
  KEY `fk_AppPartData_AppParts` (`ApplicationID`,`AppPartID`),
  CONSTRAINT `fk_AppPartData_AppParts` FOREIGN KEY (`ApplicationID`, `AppPartID`) REFERENCES `AppParts` (`ApplicationID`, `AppPartID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AppParts`
--

DROP TABLE IF EXISTS `AppParts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppParts` (
  `ApplicationID` int(11) NOT NULL,
  `AppPartID` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ApplicationID`,`AppPartID`),
  KEY `fk_AppParts_Applications` (`ApplicationID`),
  CONSTRAINT `fk_AppParts_Applications` FOREIGN KEY (`ApplicationID`) REFERENCES `Applications` (`ApplicationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Applications`
--

DROP TABLE IF EXISTS `Applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Applications` (
  `ApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationName` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClayUI_Demo.Contacts`
--

DROP TABLE IF EXISTS `ClayUI_Demo.Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClayUI_Demo.Contacts` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `EmailAddress` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataTypes`
--

DROP TABLE IF EXISTS `DataTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataTypes` (
  `DataTypeID` int(11) NOT NULL,
  `DataTypeDescr` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`DataTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElementOptions`
--

DROP TABLE IF EXISTS `ElementOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElementOptions` (
  `ElementOptionID` int(11) NOT NULL,
  `ElementID` int(11) NOT NULL,
  `ApplicationID` int(11) NOT NULL,
  `AppPartID` int(11) NOT NULL,
  `Value` varchar(255) NOT NULL DEFAULT '0',
  `Description` varchar(255) DEFAULT NULL,
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0',
  `Version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ElementOptionID`,`ElementID`,`ApplicationID`,`AppPartID`),
  KEY `fk_ElementOptions_Elements` (`ElementID`,`ApplicationID`,`AppPartID`),
  CONSTRAINT `fk_ElementOptions_Elements` FOREIGN KEY (`ElementID`, `ApplicationID`, `AppPartID`) REFERENCES `Elements` (`ElementID`, `ApplicationID`, `AppPartID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElementTypes`
--

DROP TABLE IF EXISTS `ElementTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElementTypes` (
  `ElementTypeID` int(11) NOT NULL,
  `ElementTypeDescr` varchar(45) NOT NULL,
  PRIMARY KEY (`ElementTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elements`
--

DROP TABLE IF EXISTS `Elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elements` (
  `ElementID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) NOT NULL,
  `AppPartID` int(11) NOT NULL,
  `ElementName` varchar(50) NOT NULL DEFAULT '',
  `ElementType` int(11) NOT NULL DEFAULT '0',
  `DataType` int(11) NOT NULL DEFAULT '0',
  `Label` varchar(50) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `IsStored` bit(1) NOT NULL DEFAULT b'0',
  `ListOrder` int(11) NOT NULL DEFAULT '0',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0',
  `Version` int(11) NOT NULL,
  `DataLength` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ElementID`,`ApplicationID`,`AppPartID`),
  KEY `fk_Elements_AppParts` (`ApplicationID`,`AppPartID`),
  KEY `fk_Elements_DataTypes` (`DataType`),
  KEY `fk_Elements_ElementTypes` (`ElementType`),
  CONSTRAINT `fk_Elements_AppParts` FOREIGN KEY (`ApplicationID`, `AppPartID`) REFERENCES `AppParts` (`ApplicationID`, `AppPartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Elements_DataTypes` FOREIGN KEY (`DataType`) REFERENCES `DataTypes` (`DataTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Elements_ElementTypes` FOREIGN KEY (`ElementType`) REFERENCES `ElementTypes` (`ElementTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExampleElementDataTable`
--

DROP TABLE IF EXISTS `ExampleElementDataTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExampleElementDataTable` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `Element1` varchar(45) DEFAULT NULL,
  `Element2` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-11 16:22:49
