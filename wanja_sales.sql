-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wanja
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SaleID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE sales (
    SaleID INT PRIMARY KEY,         
    ProductID INT,                  
    CustomerID INT,                 
    SaleDate DATE,                  
    Amount DECIMAL(10, 2)           
);


INSERT INTO sales (SaleID, ProductID, CustomerID, SaleDate, Amount)
VALUES
(1, 401, 1001, '2024-01-15', 250.75),
(2, 402, 1002, '2024-02-20', 340.50),
(3, 401, 1003, '2024-02-22', 150.00),
(4, 403, 1001, '2024-03-05', 500.00),
(5, 404, 1002, '2024-03-10', 750.25),
(6, 405, 1003, '2024-03-15', 650.00),
(7, 402, 1004, '2024-04-01', 300.40),
(8, 401, 1001, '2024-04-12', 420.75),
(9, 405, 1005, '2024-05-05', 200.60),
(10, 403, 1001, '2024-05-15', 800.00),
(11, 401, 1002, '2024-06-01', 150.00),
(12, 404, 1005, '2024-06-10', 900.10),
(13, 401, 1001, '2024-06-15', 320.75),
(14, 402, 1004, '2024-07-05', 275.30),
(15, 405, 1003, '2024-07-18', 500.50),
(16, 403, 1005, '2024-08-01', 600.00),
(17, 402, 1002, '2024-08-12', 725.80),
(18, 404, 1004, '2024-08-20', 350.90);

SELECT 
    ProductID,
    SUM(Amount) AS TotalSales
FROM 
    sales
GROUP BY 
    ProductID;


SELECT 
    YEAR(SaleDate) AS SaleYear,
    MONTH(SaleDate) AS SaleMonth,
    SUM(Amount) AS TotalSales
FROM 
    sales
GROUP BY 
    YEAR(SaleDate), 
    MONTH(SaleDate)
ORDER BY 
    SaleYear, SaleMonth;


SELECT 
    CustomerID,
    COUNT(SaleID) AS NumberOfPurchases
FROM 
    sales
GROUP BY 
    CustomerID
HAVING 
    COUNT(SaleID) > 5;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30 19:59:58
