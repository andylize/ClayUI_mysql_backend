-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ClayUI
-- ------------------------------------------------------
-- Server version	5.1.61-log

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
  `AppPartName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'1',
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
  `IsEnabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ApplicationID`,`ApplicationName`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClayUI_Demo.1.Contacts`
--

DROP TABLE IF EXISTS `ClayUI_Demo.1.Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClayUI_Demo.1.Contacts` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `2.FirstName` datetime DEFAULT NULL,
  `4.EmailAddress` varchar(25) DEFAULT NULL,
  `8.State` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ClayUI_Demo.2.Products`
--

DROP TABLE IF EXISTS `ClayUI_Demo.2.Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClayUI_Demo.2.Products` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `57.NewElement` varchar(25) DEFAULT NULL,
  `65.SKU` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `DataTypeDescrConst` varchar(45) NOT NULL,
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
  `ElementOptionID` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
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
  `ElementTypeDescrConst` varchar(45) NOT NULL,
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
  `IsStored` bit(1) NOT NULL DEFAULT b'1',
  `ListOrder` int(11) NOT NULL DEFAULT '0',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'1',
  `Version` int(11) NOT NULL DEFAULT '0',
  `DataLength` int(11) NOT NULL DEFAULT '25',
  PRIMARY KEY (`ElementID`,`ApplicationID`,`AppPartID`),
  KEY `fk_Elements_AppParts` (`ApplicationID`,`AppPartID`),
  KEY `fk_Elements_DataTypes` (`DataType`),
  KEY `fk_Elements_ElementTypes` (`ElementType`),
  CONSTRAINT `fk_Elements_AppParts` FOREIGN KEY (`ApplicationID`, `AppPartID`) REFERENCES `AppParts` (`ApplicationID`, `AppPartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Elements_DataTypes` FOREIGN KEY (`DataType`) REFERENCES `DataTypes` (`DataTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Elements_ElementTypes` FOREIGN KEY (`ElementType`) REFERENCES `ElementTypes` (`ElementTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
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

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `record_id` int(11) NOT NULL,
  `dec_column` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'ClayUI'
--
/*!50003 DROP PROCEDURE IF EXISTS `uspAddApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspAddApp`()
BEGIN    
    
    INSERT INTO Applications (ApplicationName, Description)
    VALUES ('New_Application', 'New Application');

    CALL uspGetApplicationDetails(LAST_INSERT_ID());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspAddAppPart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspAddAppPart`(IN APP_ID INT)
BEGIN
    
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_ID INT;
    DECLARE ELEMENT_ID INT;
    
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT COALESCE(MAX(AppPartID), 0) + 1 FROM AppParts WHERE ApplicationID =  APP_ID INTO APP_PART_ID;
    
    -- add app part
    INSERT INTO AppParts (ApplicationID, AppPartID, AppPartName, Description, Version)
    VALUES (APP_ID
        ,APP_PART_ID
        ,'New_AppPart'
        ,'New App Part'
        ,0);
    
    -- add generic element
    SELECT COALESCE(MAX(ElementID), 0) + 1 FROM Elements WHERE ApplicationID = APP_ID INTO ELEMENT_ID;
    INSERT INTO Elements (ApplicationID, AppPartID, ElementName, Version)
    VALUES (APP_ID
        ,APP_PART_ID
        ,'NewElement'
        ,0);

    -- add app part data table record
    INSERT INTO AppPartData (ApplicationID, AppPartID, DataTableName, Version)
    VALUES (APP_ID
        ,APP_PART_ID
        ,'New_AppPart'
        ,0);
        
    SET @STATEMENT = CONCAT('CREATE TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', 'New_AppPart` ( `RecordID` INT(11) NOT NULL AUTO_INCREMENT, `', 
        CAST(ELEMENT_ID AS CHAR), '.NewElement` VARCHAR(25), PRIMARY KEY (`RecordID`))');

    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    CALL uspGetAppPartDetails(APP_ID, APP_PART_ID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspAddElementOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspAddElementOption`(IN APP_ID INT, IN APP_PART_ID INT, IN ELEMENT_ID INT, IN ELEMENT_VALUE VARCHAR(255), IN ELEMENT_DESCR VARCHAR(255))
BEGIN

    INSERT INTO ElementOptions (ElementID, ApplicationID, AppPartID, Value, Description, IsEnabled, Version)
    VALUES (ELEMENT_ID, APP_ID, APP_PART_ID, ELEMENT_VALUE, ELEMENT_DESCR, 1, 0);

    CALL uspGetElement(APP_ID, APP_PART_ID, ELEMENT_ID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspAddNewElement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspAddNewElement`(IN APP_ID INT, IN APP_PART_ID INT)
BEGIN
    DECLARE ELEMENT_ID INT;
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);

    -- add generic element
    INSERT INTO Elements (ApplicationID, AppPartID, ElementName, `Label`, Version)
    VALUES (APP_ID
        ,APP_PART_ID
        ,'NewElement'
        ,'NewElement'
        ,0);
    
    -- update data table
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT AppPartName FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID INTO APP_PART_NAME;
    SELECT LAST_INSERT_ID() INTO ELEMENT_ID;
    SET @STATEMENT = CONCAT('ALTER TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS CHAR), '.', APP_PART_NAME, '` ADD `', CAST(ELEMENT_ID AS CHAR), '.NewElement` varchar(25);');
    
    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
        
    CALL uspGetElement(APP_ID, APP_PART_ID, ELEMENT_ID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspDeleteApplication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspDeleteApplication`(IN APP_ID INT)
BEGIN
    
    DECLARE APP_PART_ID INT;
    DECLARE DONE INT DEFAULT FALSE;
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);
    DECLARE DATA_TABLES CURSOR FOR SELECT AppPartID, DataTableName FROM AppPartData WHERE ApplicationID = APP_ID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;

    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;

    -- loop through cursor
    OPEN DATA_TABLES;

    read_loop: LOOP
        
        FETCH DATA_TABLES INTO APP_PART_ID, APP_PART_NAME;
        
        IF DONE THEN
            LEAVE read_loop;
        END IF;

        -- delete data tables
        SET @STATEMENT = CONCAT('DROP TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '`');
        PREPARE stmt FROM @STATEMENT;
        
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- delete data table reference
        DELETE FROM AppPartData WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

        -- delete element options
        DELETE FROM ElementOptions WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

        -- delete elements
        DELETE FROM Elements WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

        -- delete app part    
        DELETE FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    END LOOP;
    CLOSE DATA_TABLES;
    
    -- delete application
    DELETE FROM Applications WHERE ApplicationID = APP_ID;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspDeleteAppPart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspDeleteAppPart`(IN APP_ID INT, IN APP_PART_ID INT)
BEGIN
    
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);
    
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT AppPartName FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID INTO APP_PART_NAME;

    -- delete data tables
    SET @STATEMENT = CONCAT('DROP TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '`');
    PREPARE stmt FROM @STATEMENT;
    
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- delete data table reference
    DELETE FROM AppPartData WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    -- delete element options
    DELETE FROM ElementOptions WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    -- delete elements
    DELETE FROM Elements WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    -- delete app part    
    DELETE FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspDeleteElement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspDeleteElement`(IN APP_ID INT, IN APP_PART_ID INT, IN ELEMENT_ID INT)
BEGIN
    
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);
    DECLARE ELEMENT_NAME varchar(50);

    -- alter data table to drop element data
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT AppPartName FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID INTO APP_PART_NAME;
    SELECT ElementName FROM Elements WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID AND ElementID = ELEMENT_ID INTO ELEMENT_NAME;

    SET @STATEMENT = CONCAT('ALTER TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '` DROP COLUMN `', CAST(ELEMENT_ID AS char), '.', ELEMENT_NAME, '`');
    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- update version of AppPartData table
    UPDATE AppPartData SET Version = Version + 1 WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    -- delete element options
    DELETE FROM ElementOptions WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID AND ElementID = ELEMENT_ID;

    -- delete elements
    DELETE FROM Elements WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID AND ElementID = ELEMENT_ID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAllElementOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAllElementOptions`(IN APP_ID INT)
BEGIN
    SELECT ElementOptionID
        ,AppPartID
        ,ElementID
        ,Value
        ,Description
        ,Version
    FROM ElementOptions
    WHERE ApplicationID = APP_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetApplicationDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetApplicationDetails`(IN APPLICATION_ID INT)
BEGIN
    SELECT ApplicationID
        ,ApplicationName
        ,Description
    FROM Applications
    WHERE ApplicationID = APPLICATION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppMenuStructure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppMenuStructure`()
BEGIN
    SELECT ApplicationID AS AppID
        ,1 AS Position
        ,1 AS SortOrder
        ,0 AS AppPartID
        ,1 AS Type
        ,ApplicationName AS Name
        ,0 AS ElementID
        ,0 AS ListOrder
    FROM ClayUI.Applications
    UNION ALL
    SELECT ApplicationID AS AppID
        ,2 AS Position
        ,1 AS SortOrder
        ,AppPartID
        ,2 AS Type
        ,AppPartName AS Name
        ,0 AS ElementID
        ,0 AS ListOrder
    FROM ClayUI.AppParts
    UNION ALL
    SELECT ApplicationID AS AppID
        ,3 AS Position
        ,1 AS SortOrder
        ,AppPartID
        ,3 AS Type
        ,'Elements' AS Name
        ,0 AS ElementID
        ,0 AS ListOrder
    FROM ClayUI.AppParts
    UNION ALL
    SELECT ApplicationID AS AppID
        ,4 AS Position
        ,2 AS SortOrder
        ,AppPartID
        ,4 AS Type
        ,ElementName AS Name
        ,ElementID AS ElementID
        ,ListOrder
    FROM ClayUI.Elements
    UNION ALL
    SELECT ApplicationID AS AppID
        ,3 AS Position
        ,2 AS SortOrder
        ,AppPartID
        ,5 AS Type
        ,'DataTable' AS Name
        ,0 AS ElementID
        ,99999 AS ListOrder
    FROM AppPartData
    ORDER BY AppID ASC, AppPartID ASC, Type ASC, Position ASC, SortOrder ASC, ListOrder ASC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppMenuStructure_Old` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppMenuStructure_Old`()
BEGIN
    SELECT ApplicationID AS AppID
        ,1 AS Position
        ,1 AS SortOrder
        ,0 AS AppPartID
        ,1 AS Type
        ,ApplicationName AS Name
        ,0 AS ElementID
    FROM ClayUI.Applications
    UNION ALL
    SELECT ApplicationID AS AppID
        ,2 AS Position
        ,1 AS SortOrder
        ,AppPartID
        ,2 AS Type
        ,AppPartName AS Name
        ,0 AS ElementID
    FROM ClayUI.AppParts
    UNION ALL
    SELECT ApplicationID AS AppID
        ,3 AS Position
        ,1 AS SortOrder
        ,MAX(AppPartID) AS AppPartID
        ,3 AS Type
        ,'Elements' AS Name
        ,0 AS ElementID
    FROM ClayUI.Elements
    GROUP BY AppID, AppPartID
    UNION ALL
    SELECT ApplicationID AS AppID
        ,4 AS Position
        ,2 AS SortOrder
        ,AppPartID
        ,4 AS Type
        ,ElementName AS Name
        ,ElementID AS ElementID
    FROM ClayUI.Elements
    UNION ALL
    SELECT ApplicationID AS AppID
        ,3 AS Position
        ,2 AS SortOrder
        ,AppPartID
        ,5 AS Type
        ,'DataTable' AS Name
        ,0 AS ElementID
    FROM AppPartData
    ORDER BY AppID ASC, AppPartID ASC, Type ASC, Position ASC, SortOrder ASC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppPartData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppPartData`(IN APPLICATION_ID INT)
BEGIN
    SELECT AppPartID
        ,DataTableName
        ,Version
    FROM AppPartData
    WHERE ApplicationID = APPLICATION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppPartDataTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppPartDataTable`(IN APP_ID INT, IN APP_PART_ID INT)
BEGIN
    
    
    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);
    
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT AppPartName FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID INTO APP_PART_NAME;

    SET @STATEMENT = CONCAT('SELECT * FROM `', APP_NAME, '.', APP_PART_ID, '.', APP_PART_NAME, '`;');
    
    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppPartDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppPartDetails`(IN APPLICATION_ID INT, IN APP_PART_ID INT)
BEGIN
    SELECT ApplicationID
        ,AppPartID
        ,AppPartName
        ,Description
    FROM AppParts WHERE ApplicationID = APPLICATION_ID AND AppPartID = APP_PART_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetAppParts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetAppParts`(IN APPLICATION_ID INT)
BEGIN
    SELECT AppPartID
        ,AppPartName
        ,Version 
    FROM AppParts 
    WHERE ApplicationID = APPLICATION_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetDataTableSchema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetDataTableSchema`(IN APPLICATION_ID INT, IN APP_PART_ID INT)
BEGIN
    SELECT RIGHT(column_name, LENGTH(column_name) - LOCATE('.', column_name)) as column_name
        ,data_type
        ,COALESCE(character_maximum_length, 0) AS length
        ,CASE WHEN column_key = 'PRI' THEN 1 ELSE 0 END AS is_primary_key
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = (
        SELECT CONCAT(a.ApplicationName, '.', CAST(p.AppPartID AS CHAR), '.',d.DataTableName)
        FROM Applications a
        JOIN AppParts p ON (a.ApplicationID = p.ApplicationID)
        JOIN AppPartData d ON (p.AppPartID = d.AppPartID)
        WHERE a.ApplicationID = APPLICATION_ID AND p.AppPartID = APP_PART_ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetDataTableVersion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetDataTableVersion`(IN APP_ID INT, IN APP_PART_ID INT)
BEGIN
    SELECT Version
    FROM AppPartData WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetDataTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetDataTypes`()
BEGIN
    SELECT DataTypeID
        ,DataTypeDescr
    FROM DataTypes;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetElement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetElement`(IN APP_ID INT, IN APP_PART_ID INT, IN ELEMENT_ID INT)
BEGIN
    
    SELECT e.ApplicationID
        ,e.AppPartID
        ,e.ElementID
        ,e.ElementName
        ,e.ElementType AS 'Type'
        ,e.Description
        ,e.Label
        ,CAST(e.IsStored AS UNSIGNED) AS 'Stored'
        ,e.DataType AS 'Datatype'
        ,e.DataLength AS 'Length'
        ,e.ListOrder AS 'Order'
        ,CAST(e.IsEnabled AS UNSIGNED) AS 'Enabled'
    FROM Elements e
    WHERE e.ApplicationID = APP_ID AND e.AppPartID = APP_PART_ID AND e.ElementID = ELEMENT_ID;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetElementDataTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetElementDataTable`(IN APP_ID INT, IN APP_PART_ID INT)
BEGIN
    SELECT e.ElementName
        ,et.ElementTypeDescr AS 'Type'
        ,e.Label
        ,CAST(e.IsStored AS UNSIGNED) AS 'Stored'
        ,dt.DataTypeDescr AS 'Datatype'
        ,e.DataLength AS 'Length'
        ,e.ListOrder AS 'Order'
        ,CAST(e.IsEnabled AS UNSIGNED) AS 'Enabled'
    FROM Elements e
    JOIN ElementTypes et ON (e.ElementType = et.ElementTypeID)
    JOIN DataTypes dt ON (e.DataType = dt.DataTypeID)
    WHERE e.ApplicationID = APP_ID AND e.AppPartID = APP_PART_ID
    ORDER BY e.ListOrder ASC, e.ElementName ASC;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetElementOptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetElementOptions`(IN APP_ID INT, IN APP_PART_ID INT, IN ELEMENT_ID INT)
BEGIN
    SELECT Value
        ,Description
    FROM ElementOptions
    WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID AND ElementID = ELEMENT_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetElements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetElements`(IN APPLICATION_ID INT)
BEGIN
    SELECT ElementID
        ,AppPartID
        ,ElementName
        ,ElementType
        ,DataType
        ,DataLength
        ,`Label`
        ,CAST(IsStored AS SIGNED) AS IsStored
        ,ListOrder
        ,Version
    FROM Elements
    WHERE (ApplicationID = APPLICATION_ID) AND (IsEnabled = 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspGetElementTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspGetElementTypes`()
BEGIN
    SELECT ElementTypeID
        ,ElementTypeDescr
    FROM ElementTypes;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdateApplication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspUpdateApplication`(IN APP_ID INT, IN APP_NAME varchar(50), IN APP_DESCR varchar(255))
BEGIN

    DECLARE APP_NAME_PREV varchar(50);
    DECLARE APP_PART_ID INT;
    DECLARE APP_PART_NAME varchar(50);
    DECLARE DONE INT DEFAULT FALSE;
    DECLARE DATA_TABLES CURSOR FOR SELECT AppPartID, DataTableName FROM AppPartData WHERE ApplicationID = APP_ID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;
    
    -- get application's previous name
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME_PREV;

    UPDATE Applications
        SET ApplicationName = APP_NAME
        ,Description = APP_DESCR
    WHERE ApplicationID = APP_ID;

    -- loop through cursor and rename data tables
    OPEN DATA_TABLES;

    read_loop: LOOP
        
        FETCH DATA_TABLES INTO APP_PART_ID, APP_PART_NAME;
        
        IF DONE THEN
            LEAVE read_loop;
        END IF;

        -- delete data tables
        SET @STATEMENT = CONCAT('RENAME TABLE `', APP_NAME_PREV, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '` TO `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '`');
        PREPARE stmt FROM @STATEMENT;
        
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

    END LOOP;
    CLOSE DATA_TABLES;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdateAppPart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspUpdateAppPart`(IN APPLICATION_ID INT, IN APP_PART_ID INT, IN APP_PART_NAME varchar(50), IN APP_PART_DESCR varchar(255))
BEGIN
    
    DECLARE APP_NAME varchar(50);
    DECLARE DATA_TABLE varchar(50);
    /*DECLARE STATEMENT varchar(1000);*/

    SELECT ApplicationName FROM Applications WHERE ApplicationID = APPLICATION_ID INTO APP_NAME;

    SELECT DataTableName FROM AppPartData WHERE ApplicationID = APPLICATION_ID AND AppPartID = APP_PART_ID INTO DATA_TABLE;
    SET @STATEMENT = CONCAT('RENAME TABLE `', APP_NAME, '.', APP_PART_ID, '.', DATA_TABLE, '` TO `', APP_NAME, '.', APP_PART_ID, '.', APP_PART_NAME, '`;');

    UPDATE AppParts
        SET AppPartName = APP_PART_NAME
        ,Description = APP_PART_DESCR
        ,Version = Version + 1
    WHERE ApplicationID = APPLICATION_ID AND AppPartID = APP_PART_ID;
    
    UPDATE AppPartData
        SET DataTableName = APP_PART_NAME
        ,Version = Version + 1
    WHERE ApplicationID = APPLICATION_ID AND AppPartID = APP_PART_ID;
    
    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspUpdateElement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`sqladmin`@`localhost`*/ /*!50003 PROCEDURE `uspUpdateElement`(IN APP_ID INT
    ,IN APP_PART_ID INT
    ,IN ELEMENT_ID INT
    ,IN ELEMENT_NAME VARCHAR(50)
    ,IN ELEMENT_TYPE INT
    ,IN DATA_TYPE INT
    ,IN ELEMENT_LABEL VARCHAR(50)
    ,IN ELEMENT_DESCR VARCHAR(255)
    ,IN IS_STORED INT
    ,IN LIST_ORDER INT
    ,IN IS_ENABLED INT
    ,IN DATA_LENGTH INT
)
BEGIN

    DECLARE APP_NAME varchar(50);
    DECLARE APP_PART_NAME varchar(50);
    DECLARE ELEMENT_NAME_PREV varchar(50);
    DECLARE DATA_TYPE_DECLARATION varchar(50);
    
    -- get previous element name
    SELECT ElementName FROM Elements WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID AND ElementID = ELEMENT_ID INTO ELEMENT_NAME_PREV;

    -- update version of AppPartData table
    UPDATE AppPartData SET Version = Version + 1 WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    UPDATE Elements
        SET ElementName = ELEMENT_NAME
        ,ElementType = ELEMENT_TYPE
        ,DataType = DATA_TYPE
        ,`Label` = ELEMENT_LABEL
        ,Description = ELEMENT_DESCR
        ,IsStored = IS_STORED
        ,ListOrder = LIST_ORDER
        ,IsEnabled = IS_ENABLED
        ,Version = Version + 1
        ,DataLength = DATA_LENGTH
    WHERE ElementID = ELEMENT_ID AND ApplicationID = APP_ID AND AppPartID = APP_PART_ID;

    -- update data table columns
    -- alter data table to drop element data using old name if changed
    SELECT ApplicationName FROM Applications WHERE ApplicationID = APP_ID INTO APP_NAME;
    SELECT AppPartName FROM AppParts WHERE ApplicationID = APP_ID AND AppPartID = APP_PART_ID INTO APP_PART_NAME;

    SET @STATEMENT = CONCAT('ALTER TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '` DROP COLUMN `', CAST(ELEMENT_ID AS char), '.', ELEMENT_NAME_PREV, '`');
    PREPARE stmt FROM @STATEMENT;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- add new data table column using new element info
    CASE DATA_TYPE
        WHEN 0 THEN SELECT CONCAT('varchar(', CAST(DATA_LENGTH AS char), ')') INTO DATA_TYPE_DECLARATION;
        WHEN 1 THEN SELECT 'INT' INTO DATA_TYPE_DECLARATION;
        WHEN 2 THEN SELECT 'DECIMAL (18,4)' INTO DATA_TYPE_DECLARATION;
        WHEN 3 THEN SELECT 'DATE' INTO DATA_TYPE_DECLARATION;
        WHEN 4 THEN SELECT 'DATETIME' INTO DATA_TYPE_DECLARATION;
    END CASE;
    
    
    SET @STATEMENT = CONCAT('ALTER TABLE `', APP_NAME, '.', CAST(APP_PART_ID AS char), '.', APP_PART_NAME, '` ADD COLUMN `', CAST(ELEMENT_ID AS char), '.', ELEMENT_NAME, '` ', DATA_TYPE_DECLARATION);
    SELECT @STATEMENT;
    PREPARE stmt FROM @STATEMENT;

    EXECUTE stmt;
    DEALLOCATE PREPARE stmt; 

END */;;
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

-- Dump completed on 2012-05-21  5:56:28