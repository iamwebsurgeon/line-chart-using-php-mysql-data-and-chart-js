-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2020 at 02:16 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `line_chart`
--

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE IF NOT EXISTS `buildings` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(255) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `town` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `energy_types` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`building_id`, `building_name`, `postal_code`, `town`, `district`, `address`, `energy_types`, `is_active`) VALUES
(10, 'building 4', 12545, 'ABC', 'XYZ', 'house # 13 street # 4 khanpur', 'gas, water, electricity, fuel', 1),
(8, 'building 2', 63100, 'bahawalpur', 'bahawalpur', 'house # 13 b street # 4 abc colony', 'gas, water, electricity, fuel', 1),
(9, 'building 3', 33040, 'abc town', 'abc district', 'this is addresss. ', 'gas, water, electricity, fuel', 1),
(7, 'building 1', 50309, 'khanpur', 'rahim yar khan', 'house # 13 street # 4 khanpur', 'gas, water, electricity, fuel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
CREATE TABLE IF NOT EXISTS `costs` (
  `cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `consumption_date` date NOT NULL,
  `gas_consumption` varchar(255) NOT NULL,
  `gas_cost` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cost_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`cost_id`, `building_id`, `consumption_date`, `gas_consumption`, `gas_cost`, `created_at`, `updated_at`) VALUES
(1, 7, '2020-01-01', '150', '1000', NULL, '2020-03-03 17:46:24'),
(2, 7, '2020-02-01', '180', '1050', NULL, '2020-03-03 17:46:36'),
(3, 7, '2020-03-01', '250', '1100', '2020-03-03 17:05:23', NULL),
(5, 7, '2020-05-01', '150', '1000', NULL, '2020-03-03 17:46:24'),
(4, 7, '2020-04-01', '120', '1200', NULL, '2020-03-03 18:34:24'),
(6, 7, '2020-06-01', '180', '1050', NULL, '2020-03-03 17:46:36'),
(7, 7, '2020-07-01', '250', '1100', '2020-03-03 17:05:23', NULL),
(8, 7, '2020-08-01', '120', '1200', NULL, '2020-03-03 18:34:24'),
(9, 7, '2020-09-01', '120', '1200', NULL, '2020-03-03 18:34:24'),
(10, 7, '2020-10-01', '180', '1050', NULL, '2020-03-03 17:46:36'),
(11, 7, '2020-11-01', '250', '1100', '2020-03-03 17:05:23', NULL),
(12, 7, '2020-12-01', '120', '1200', NULL, '2020-03-03 18:34:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
