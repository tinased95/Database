CREATE DATABASE  IF NOT EXISTS `onlineshopping1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlineshopping1`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshopping1
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Temporary view structure for view `employeewithdiscount`
--

DROP TABLE IF EXISTS `employeewithdiscount`;
/*!50001 DROP VIEW IF EXISTS `employeewithdiscount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employeewithdiscount` AS SELECT 
 1 AS `employeeID`,
 1 AS `totalcost`,
 1 AS `companyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `creditwithgift`
--

DROP TABLE IF EXISTS `creditwithgift`;
/*!50001 DROP VIEW IF EXISTS `creditwithgift`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `creditwithgift` AS SELECT 
 1 AS `CostumerID`,
 1 AS `CostumerCredit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!50001 DROP VIEW IF EXISTS `cost`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cost` AS SELECT 
 1 AS `utilityID`,
 1 AS `totalnumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost2`
--

DROP TABLE IF EXISTS `cost2`;
/*!50001 DROP VIEW IF EXISTS `cost2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cost2` AS SELECT 
 1 AS `utilityID`,
 1 AS `numberofutility`,
 1 AS `BoughtDateTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost3`
--

DROP TABLE IF EXISTS `cost3`;
/*!50001 DROP VIEW IF EXISTS `cost3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cost3` AS SELECT 
 1 AS `employeeID`,
 1 AS `utilityID`,
 1 AS `numberofutility`,
 1 AS `BoughtDateTime`,
 1 AS `companyName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `q17`
--

DROP TABLE IF EXISTS `q17`;
/*!50001 DROP VIEW IF EXISTS `q17`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `q17` AS SELECT 
 1 AS `employeeID`,
 1 AS `totalcost`,
 1 AS `companyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `employeewithdiscount`
--

/*!50001 DROP VIEW IF EXISTS `employeewithdiscount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeewithdiscount` AS select `q17`.`employeeID` AS `employeeID`,if((`q17`.`totalcost` < 5000000),(0.9 * `q17`.`totalcost`),(`q17`.`totalcost` - 500000)) AS `totalcost`,`q17`.`companyname` AS `companyname` from `q17` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `creditwithgift`
--

/*!50001 DROP VIEW IF EXISTS `creditwithgift`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `creditwithgift` AS select `registeredcostumer`.`CostumerID` AS `CostumerID`,((10 * (`registeredcostumer`.`CostumerCredit` / 100)) + `registeredcostumer`.`CostumerCredit`) AS `CostumerCredit` from `registeredcostumer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost`
--

/*!50001 DROP VIEW IF EXISTS `cost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost` AS select `boughtdetail`.`UtilityID` AS `utilityID`,sum(`boughtdetail`.`NumberOfUtility`) AS `totalnumber` from `boughtdetail` group by `boughtdetail`.`UtilityID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost2`
--

/*!50001 DROP VIEW IF EXISTS `cost2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost2` AS select `boughtdetail`.`UtilityID` AS `utilityID`,`boughtdetail`.`NumberOfUtility` AS `numberofutility`,`bought`.`BoughtDateTime` AS `BoughtDateTime` from (`boughtdetail` join `bought` on((`boughtdetail`.`BoughtID` = `bought`.`BoughtID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost3`
--

/*!50001 DROP VIEW IF EXISTS `cost3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost3` AS select `employee`.`EmployeeID` AS `employeeID`,`boughtdetail`.`UtilityID` AS `utilityID`,`boughtdetail`.`NumberOfUtility` AS `numberofutility`,`bought`.`BoughtDateTime` AS `BoughtDateTime`,`company`.`CompanyName` AS `companyName` from (((`boughtdetail` join `bought`) join `employee`) join `company`) where ((`bought`.`BoughtID` = `boughtdetail`.`BoughtID`) and (`employee`.`EmployeeID` = `bought`.`CostumerID`) and (`employee`.`CompanyID` = `company`.`CompanyID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q17`
--

/*!50001 DROP VIEW IF EXISTS `q17`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q17` AS select `cost3`.`employeeID` AS `employeeID`,sum((`cost3`.`numberofutility` * `utility`.`UtilityCost`)) AS `totalcost`,`cost3`.`companyName` AS `companyname` from (`cost3` join `utility`) where ((`cost3`.`utilityID` = `utility`.`UtilityCode`) and (month(`cost3`.`BoughtDateTime`) = 10) and (year(`cost3`.`BoughtDateTime`) = 2017)) group by `cost3`.`employeeID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'onlineshopping1'
--

--
-- Dumping routines for database 'onlineshopping1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-17  9:40:27
