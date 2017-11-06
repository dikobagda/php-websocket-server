-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2017 at 10:55 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtime`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gesits`
--

CREATE TABLE `tbl_gesits` (
  `id` bigint(20) NOT NULL,
  `transport_id` varchar(20) NOT NULL,
  `imei` int(16) NOT NULL,
  `speed` int(10) NOT NULL,
  `rpm` int(10) NOT NULL,
  `batt` int(10) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lon` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_gesits`
--

INSERT INTO `tbl_gesits` (`id`, `transport_id`, `imei`, `speed`, `rpm`, `batt`, `lat`, `lon`, `created_at`) VALUES
(1, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(2, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(3, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(5, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(6, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(7, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(8, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(9, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49'),
(10, 'GESITS01', 1234567, 888, 8888, 100, '0.00', '106.000', '2016-02-14 12:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `postId` int(11) NOT NULL,
  `postText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`postId`, `postText`) VALUES
(1, '{     \"id\":\"GESITS01\", 	\"imei\":\"1234567\", 	\"speed\":\"888\", 	\"rpm\":\"8888\", 	\"batt\":\"100\", 	\"lat\":\"0.00\", 	\"lon\":\"106.000\", 	\"created_at\":\"2016-02-14 12:38:49\"   }'),
(2, 'test001'),
(3, 'test002'),
(4, 'test003'),
(5, 'test004'),
(6, 'test005'),
(7, 'test006'),
(8, 'test007'),
(9, 'test008'),
(10, 'test009'),
(11, 'test010'),
(13, '{\"postText\":\"test011\"}'),
(14, '{\"postText\":\"test012\"}'),
(15, '{\"postText\":\"test013\"}'),
(16, '{\"postText\":\"test014\"}'),
(17, '{\"postText\":\"test014\"}'),
(18, '{\"postText\":\"test014\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_gesits`
--
ALTER TABLE `tbl_gesits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`postId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_gesits`
--
ALTER TABLE `tbl_gesits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
