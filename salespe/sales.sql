-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 05:48 PM
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
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `brId` int(11) NOT NULL,
  `brName` varchar(255) NOT NULL,
  `brAddress` varchar(255) NOT NULL,
  `brTp` varchar(255) NOT NULL,
  `brEmail` varchar(25) NOT NULL,
  `eId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`brId`, `brName`, `brAddress`, `brTp`, `brEmail`, `eId`) VALUES
(1, 'hikkaduwa', 'hikkaduwa', '775163610', 'hikka@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashierId` int(11) NOT NULL,
  `cashierName` varchar(50) NOT NULL,
  `cashierAddress` varchar(20) NOT NULL,
  `cashierTP` varchar(10) NOT NULL,
  `cashierEmail` varchar(30) NOT NULL,
  `brId` int(11) NOT NULL,
  `empId` int(11) NOT NULL,
  `cashierIdPassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashierId`, `cashierName`, `cashierAddress`, `cashierTP`, `cashierEmail`, `brId`, `empId`, `cashierIdPassword`) VALUES
(1, 'heshan', 'hikkaduwa', '0775445', 'hc@gmail,com', 1, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empId` int(11) NOT NULL,
  `brId` int(255) NOT NULL,
  `empRole` varchar(255) NOT NULL,
  `empPassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `brId`, `empRole`, `empPassword`) VALUES
(3, 1, 'admin', 'admin'),
(5, 1, 'user', 'user'),
(6, 1, 'manager', 'manager'),
(7, 1, 'cashier', 'cash'),
(8, 1, 'salesAgent', 'agent'),
(9, 1, 'insurance', 'insu'),
(10, 1, 'tleader', 'leader'),
(11, 1, 'supervisor', 'visor');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `brId` int(11) NOT NULL,
  `IssueDate` date NOT NULL,
  `amount` int(11) NOT NULL,
  `supervisorId` varchar(11) NOT NULL,
  `saleId` varchar(11) NOT NULL,
  `policyNumber` varchar(11) NOT NULL,
  `paymentFreq` varchar(20) NOT NULL,
  `cashHandOverDate` date NOT NULL,
  `agentSignature` varchar(50) NOT NULL,
  `teamLeaderCode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `managerId` int(11) NOT NULL,
  `managerName` varchar(20) NOT NULL,
  `managerAddress` varchar(20) NOT NULL,
  `managerTp` int(10) NOT NULL,
  `managerEmaill` varchar(20) NOT NULL,
  `brId` int(11) NOT NULL,
  `empId` int(11) NOT NULL,
  `managerPassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`managerId`, `managerName`, `managerAddress`, `managerTp`, `managerEmaill`, `brId`, `empId`, `managerPassword`) VALUES
(1, 'testManager', 'hikkaduwa', 775163611, 'ma@gmail.com', 1, 6, 'manager');

-- --------------------------------------------------------

--
-- Stand-in structure for view `managerview`
-- (See below for the actual view)
--
CREATE TABLE `managerview` (
);

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `perId` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `ispromted` tinyint(1) NOT NULL,
  `empId` int(11) NOT NULL,
  `brId` int(11) NOT NULL,
  `trId` int(11) NOT NULL,
  `saleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE `target` (
  `trId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `assignedBy` varchar(20) NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `brId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `totalsales`
--

CREATE TABLE `totalsales` (
  `saleId` int(11) NOT NULL,
  `saleName` int(11) NOT NULL,
  `empId` int(11) NOT NULL,
  `brId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `managerview`
--
DROP TABLE IF EXISTS `managerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `managerview`  AS SELECT `employee`.`empId` AS `empId`, `employee`.`empName` AS `empName`, `employee`.`empAddress` AS `empAddress`, `employee`.`empTp` AS `empTp`, `employee`.`empEmaill` AS `empEmaill`, `employee`.`brId` AS `brId`, `employee`.`empRole` AS `empRole`, `employee`.`empPassword` AS `empPassword` FROM `employee` ;

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
  ADD KEY `fk_cashier` (`brId`),
  ADD KEY `fk_cashier_emp` (`empId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`),
  ADD KEY `fk_branch` (`brId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `fk_invoice-branch` (`brId`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD KEY `fk_manager_emp` (`empId`),
  ADD KEY `fk_manager_branch` (`brId`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD KEY `fk_performance-emp` (`empId`),
  ADD KEY `fk-performace-branch` (`brId`),
  ADD KEY `fk-performace-target` (`trId`);

--
-- Indexes for table `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`trId`);

--
-- Indexes for table `totalsales`
--
ALTER TABLE `totalsales`
  ADD KEY `fk_sales-emp` (`empId`),
  ADD KEY `fk_sales-branch` (`brId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `brId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `target`
--
ALTER TABLE `target`
  MODIFY `trId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cashier`
--
ALTER TABLE `cashier`
  ADD CONSTRAINT `fk_cashier` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`),
  ADD CONSTRAINT `fk_cashier_emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invoice-branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_manager_branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`),
  ADD CONSTRAINT `fk_manager_emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `fk-performace-branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`),
  ADD CONSTRAINT `fk-performace-target` FOREIGN KEY (`trId`) REFERENCES `target` (`trId`),
  ADD CONSTRAINT `fk_performance-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`);

--
-- Constraints for table `target`
--
ALTER TABLE `target`
  ADD CONSTRAINT `fk_target` FOREIGN KEY (`trId`) REFERENCES `branch` (`brId`);

--
-- Constraints for table `totalsales`
--
ALTER TABLE `totalsales`
  ADD CONSTRAINT `fk_sales-branch` FOREIGN KEY (`brId`) REFERENCES `branch` (`brId`),
  ADD CONSTRAINT `fk_sales-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
