-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2022 at 05:38 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doorstep`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Name` varchar(50) NOT NULL,
  `enc_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buys`
--

CREATE TABLE `buys` (
  `Customerid` int(10) NOT NULL,
  `Testid` int(10) NOT NULL,
  `id` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Column` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `can_update`
--

CREATE TABLE `can_update` (
  `Test_statusProcess` varchar(40) NOT NULL,
  `ADMINName` varchar(50) NOT NULL,
  `ADMINenc_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `test_id` int(10) NOT NULL,
  `test_name` varchar(30) NOT NULL,
  `total payable` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(40) NOT NULL,
  `enc_pass` varchar(20) NOT NULL,
  `Testid` int(10) NOT NULL,
  `carttest_id` int(10) NOT NULL,
  `ADMINName` varchar(50) NOT NULL,
  `ADMINenc_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_test`
--

CREATE TABLE `customer_test` (
  `Customerid` int(10) NOT NULL,
  `Testid` int(10) NOT NULL,
  `id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `hospitalsid` int(10) NOT NULL,
  `Testid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(10) NOT NULL,
  `area` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `transaction id` int(20) NOT NULL,
  `carttest_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Customerid` int(10) NOT NULL,
  `Testid` int(10) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_img_path` varchar(40) DEFAULT NULL,
  `s_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`s_id`, `s_name`, `s_img_path`, `s_price`) VALUES
(6, 'corona test', 'images/img5.jpg', 4500),
(10, 'blood test', 'images/img2.png', 1200),
(13, 'test package', 'images/img3.png', 150);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `Testid` int(10) NOT NULL,
  `Customerid` int(10) NOT NULL,
  `carttest_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_status`
--

CREATE TABLE `test_status` (
  `Process` varchar(40) NOT NULL,
  `Customerid` int(10) NOT NULL,
  `paymenttransaction id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `pass` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `email`, `pass`) VALUES

('dihan', 'd@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Name`,`enc_pass`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `enc_pass` (`enc_pass`);

--
-- Indexes for table `buys`
--
ALTER TABLE `buys`
  ADD PRIMARY KEY (`Customerid`,`Testid`),
  ADD KEY `FKbuys661620` (`Testid`);

--
-- Indexes for table `can_update`
--
ALTER TABLE `can_update`
  ADD PRIMARY KEY (`Test_statusProcess`,`ADMINName`,`ADMINenc_pass`),
  ADD KEY `FKCan_update443104` (`Test_statusProcess`),
  ADD KEY `FKCan_update314420` (`ADMINName`,`ADMINenc_pass`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FKCustomer388849` (`carttest_id`),
  ADD KEY `FKCustomer801833` (`ADMINName`,`ADMINenc_pass`);

--
-- Indexes for table `customer_test`
--
ALTER TABLE `customer_test`
  ADD PRIMARY KEY (`Customerid`,`Testid`,`id`),
  ADD KEY `FKCustomer_T523393` (`Customerid`),
  ADD KEY `FKCustomer_T645747` (`Testid`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`hospitalsid`,`Testid`),
  ADD KEY `FKhas64575` (`hospitalsid`),
  ADD KEY `FKhas594378` (`Testid`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`transaction id`),
  ADD KEY `FKpayment80620` (`carttest_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Customerid`,`Testid`),
  ADD KEY `FKreview755102` (`Customerid`),
  ADD KEY `FKreview924243` (`Testid`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKTest605657` (`carttest_id`);

--
-- Indexes for table `test_status`
--
ALTER TABLE `test_status`
  ADD PRIMARY KEY (`Process`),
  ADD KEY `FKTest_statu259048` (`Customerid`),
  ADD KEY `FKTest_statu101284` (`paymenttransaction id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `test_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `transaction id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buys`
--
ALTER TABLE `buys`
  ADD CONSTRAINT `FKbuys661620` FOREIGN KEY (`Testid`) REFERENCES `test` (`id`);

--
-- Constraints for table `can_update`
--
ALTER TABLE `can_update`
  ADD CONSTRAINT `FKCan_update314420` FOREIGN KEY (`ADMINName`,`ADMINenc_pass`) REFERENCES `admin` (`Name`, `enc_pass`),
  ADD CONSTRAINT `FKCan_update443104` FOREIGN KEY (`Test_statusProcess`) REFERENCES `test_status` (`Process`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKCustomer388849` FOREIGN KEY (`carttest_id`) REFERENCES `cart` (`test_id`),
  ADD CONSTRAINT `FKCustomer801833` FOREIGN KEY (`ADMINName`,`ADMINenc_pass`) REFERENCES `admin` (`Name`, `enc_pass`);

--
-- Constraints for table `customer_test`
--
ALTER TABLE `customer_test`
  ADD CONSTRAINT `FKCustomer_T523393` FOREIGN KEY (`Customerid`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKCustomer_T645747` FOREIGN KEY (`Testid`) REFERENCES `test` (`id`);

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `FKhas594378` FOREIGN KEY (`Testid`) REFERENCES `test` (`id`),
  ADD CONSTRAINT `FKhas64575` FOREIGN KEY (`hospitalsid`) REFERENCES `hospitals` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FKpayment80620` FOREIGN KEY (`carttest_id`) REFERENCES `cart` (`test_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FKreview755102` FOREIGN KEY (`Customerid`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKreview924243` FOREIGN KEY (`Testid`) REFERENCES `test` (`id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FKTest605657` FOREIGN KEY (`carttest_id`) REFERENCES `cart` (`test_id`);

--
-- Constraints for table `test_status`
--
ALTER TABLE `test_status`
  ADD CONSTRAINT `FKTest_statu101284` FOREIGN KEY (`paymenttransaction id`) REFERENCES `payment` (`transaction id`),
  ADD CONSTRAINT `FKTest_statu259048` FOREIGN KEY (`Customerid`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
