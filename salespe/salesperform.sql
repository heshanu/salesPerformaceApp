-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 10:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salesperform`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `brId` varchar(20) NOT NULL,
  `brName` varchar(20) NOT NULL,
  `brAddress` varchar(20) NOT NULL,
  `brTp` varchar(20) NOT NULL,
  `brEmail` varchar(20) NOT NULL,
  `eid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`brId`, `brName`, `brAddress`, `brTp`, `brEmail`, `eid`) VALUES
('br001', 'hikkaduwa', 'hikkaduwa', '0775269620', 'hikka@gmail.com', 'm0001');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashierId` varchar(20) NOT NULL,
  `cashierName` varchar(20) NOT NULL,
  `cashierAddress` varchar(20) NOT NULL,
  `cashierTP` varchar(20) NOT NULL,
  `empEmaill` varchar(20) NOT NULL,
  `brId` varchar(20) NOT NULL,
  `empId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empId` varchar(20) NOT NULL,
  `brId` varchar(20) NOT NULL,
  `empRole` varchar(20) NOT NULL,
  `empPassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `brId`, `empRole`, `empPassword`) VALUES
('in001', 'br001', 'insurance', 'insurance'),
('m0001', 'br001', 'manager', 'manager'),
('sa001', 'br001', 'salesAgent', 'sales'),
('sup01', 'br001', 'supervisor', 'supervisor'),
('tl001', 'br001', 'tleader', 'tleader');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `perId` varchar(20) NOT NULL,
  `status` int(20) NOT NULL,
  `empId` varchar(20) NOT NULL,
  `brId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE `target` (
  `trId` varchar(20) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `assignedBy` varchar(20) NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `status` varchar(5) NOT NULL,
  `brId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `totalsales`
--

CREATE TABLE `totalsales` (
  `saleId` varchar(20) NOT NULL,
  `saleName` varchar(30) NOT NULL,
  `empId` varchar(20) NOT NULL,
  `brId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`brId`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashierId`),
  ADD KEY `fk_branch` (`brId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`),
  ADD KEY `fk_branch_employee` (`brId`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`perId`);

--
-- Indexes for table `totalsales`
--
ALTER TABLE `totalsales`
  ADD KEY `emp_sales` (`empId`),
  ADD KEY `fk_sales-br` (`brId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cashier`
--
ALTER TABLE `cashier`
  ADD CONSTRAINT `fk_branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_branch_employee` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`);

--
-- Constraints for table `totalsales`
--
ALTER TABLE `totalsales`
  ADD CONSTRAINT `emp_sales` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`),
  ADD CONSTRAINT `fk_sales-br` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
