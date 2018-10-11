-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2018 at 11:34 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `triput_meri`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Name`, `Email`, `Password`) VALUES
(13, 'admin', 'admin', '$2y$10$PW7RxxYyf4yOPVEGK9h8IO244j1T3V7.zDIEtu.5MDmw8anqjv7wK');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`Id`, `Name`, `Hash`) VALUES
(1, 'Standard_user', ''),
(2, 'Administrator', '{\"admin\": 1}');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `Id` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `ImagePath` varchar(100) NOT NULL,
  `IsCover` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`Id`, `ProductId`, `ImagePath`, `IsCover`) VALUES
(4, 2, 'images/1835390569.jpg', NULL),
(5, 2, 'images/1273357196.jpg', b'1'),
(6, 2, 'images/254635.jpg', NULL),
(7, 2, 'images/163105418.jpg', NULL),
(8, 3, 'images/939134214.jpg', b'1'),
(9, 3, 'images/582762240.jpg', NULL),
(10, 3, 'images/1944227505.jpg', NULL),
(11, 4, 'images/999329989.jpg', b'1'),
(12, 4, 'images/1985852574.jpg', NULL),
(13, 4, 'images/367090873.jpg', NULL),
(14, 5, 'images/1759027667.jpg', b'1'),
(15, 6, 'images/1068542961.jpg', b'1'),
(16, 7, 'images/32542925.jpg', b'1'),
(17, 8, 'images/219804847.jpg', b'1'),
(21, 9, 'images/1635737361.jpg', b'1'),
(22, 9, 'images/2065224000.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TypeId` varchar(50) NOT NULL,
  `Price` decimal(16,2) NOT NULL,
  `Description` varchar(800) NOT NULL,
  `OnSaleFromDate` date NOT NULL,
  `OnSaleToDate` date NOT NULL,
  `Material` varchar(50) NOT NULL,
  `Subcategory` varchar(50) NOT NULL,
  `NumberOfPeaces` int(50) NOT NULL,
  `ImgPath` varchar(50) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `UserDeleted` bit(1) DEFAULT NULL,
  `CreatedOn` date DEFAULT NULL,
  `ModifiedOn` date DEFAULT NULL,
  `PublishedOn` datetime DEFAULT NULL,
  `IsPublished` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Name`, `TypeId`, `Price`, `Description`, `OnSaleFromDate`, `OnSaleToDate`, `Material`, `Subcategory`, `NumberOfPeaces`, `ImgPath`, `Category`, `UserDeleted`, `CreatedOn`, `ModifiedOn`, `PublishedOn`, `IsPublished`) VALUES
(1, 'test', '', '2.00', '', '0000-00-00', '0000-00-00', '', 'Kecelja', 0, '', 'Kuhinja', b'1', '2018-09-14', '2018-09-14', '2018-09-14 11:05:04', b'1'),
(2, 'Rustica', 'Duga', '1200.00', 'Lanena masliasto zelena kecelja sa orahovo dugme', '2018-09-12', '2018-09-16', 'Pamuk-lan', 'Kecelja', 0, '', 'Kuhinja', NULL, '2018-09-14', NULL, '2018-09-14 11:44:59', b'1'),
(3, 'Marinna', 'Duga', '1300.00', 'Lanena kecelja u teget biji, sa diskretnim prugicama', '0000-00-00', '0000-00-00', 'Lan', 'Kecelja', 0, '', 'Kuhinja', NULL, '2018-09-14', NULL, '2018-09-14 11:46:10', b'1'),
(4, 'Bella', 'Kratka', '1300.00', 'Mala bela kecelja za romantiÄne kuvarice', '0000-00-00', '0000-00-00', 'Lan', 'Kecelja', 0, '', 'Kuhinja', NULL, '2018-09-14', NULL, '2018-09-14 11:47:04', b'1'),
(5, 'test', 'Kratka', '3.00', 'aedfqefwqe', '0000-00-00', '0000-00-00', 'Lan', 'Kecelja', 0, '', 'Kuhinja', b'1', '2018-09-14', '2018-09-14', '0000-00-00 00:00:00', b'0'),
(6, 'test 2', '', '0.00', '', '0000-00-00', '0000-00-00', '', 'Kecelja', 0, '', 'Kuhinja', b'1', '2018-09-14', NULL, '2018-09-14 13:41:59', b'1'),
(7, 'test 3', '', '0.00', '', '0000-00-00', '0000-00-00', '', 'Kecelja', 0, '', 'Kuhinja', b'1', '2018-09-14', '2018-09-14', '0000-00-00 00:00:00', b'1'),
(8, 'test 6', '', '0.00', '', '0000-00-00', '0000-00-00', '', 'Kecelja', 0, '', 'Kuhinja', b'1', '2018-09-14', '2018-09-14', '2018-09-14 13:54:10', b'0'),
(9, 'set za rucavanje', '', '0.00', '', '0000-00-00', '0000-00-00', 'Lan', 'Podmetaci za rucavanje', 4, '', 'Trpezarija', NULL, '2018-09-15', '2018-10-11', '2018-09-15 14:22:38', b'1'),
(10, 'proba', '', '0.00', '', '0000-00-00', '0000-00-00', '', 'Rukavice', 0, '', 'Kuhinja', b'1', '2018-09-17', NULL, '0000-00-00 00:00:00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `Id` int(11) NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `ParentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`Id`, `Type`, `ParentId`) VALUES
(1, 'Kuhinja', NULL),
(2, 'Trpezarija', NULL),
(3, 'Dodaci', NULL),
(4, 'Kecelja', 1),
(5, 'Rukavice', 1),
(6, 'Kutija za recepte', 3),
(7, 'Set za rucavanje', 2),
(8, 'Podmetaci za rucavanje', 2),
(9, 'Podmetaci za case', 2),
(10, 'Kratka', 4),
(11, 'Duga', 4),
(18, 'Stolnjak', 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `Id` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

DROP TABLE IF EXISTS `purchase_item`;
CREATE TABLE `purchase_item` (
  `PurchaseId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `TotalPrice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `joined` datetime NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `name`, `joined`, `group`) VALUES
(1, 'don', 'e4111281af5c2c2c7e2efd67c675944d02581bb872eb7b54f19e27202c214cb5', 'ÏÖòïHo†Ã-ÐE	;Ç§ÀKL‡ÙZ/~Yñ', 'krumislav', '2018-10-03 13:18:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

DROP TABLE IF EXISTS `users_session`;
CREATE TABLE `users_session` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Hash` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `TypeId` (`TypeId`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD KEY `PurchaseId` (`PurchaseId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
