-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2021 at 12:17 AM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `assetbank`
--
CREATE DATABASE IF NOT EXISTS `assetbank` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `assetbank`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `custID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `goldOunce` float DEFAULT NULL,
  `silverOunce` float DEFAULT NULL,
  `btc` float DEFAULT NULL,
  `walletAddress` varchar(45) DEFAULT NULL,
  `inventoryLocation` varchar(45) DEFAULT NULL,
  `lastIn` datetime DEFAULT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`custID`, `firstName`, `lastName`, `phone`, `email`, `goldOunce`, `silverOunce`, `btc`, `walletAddress`, `inventoryLocation`, `lastIn`) VALUES
(1, 'Joe', 'Burrow', '1888888555', 'test@gmail.com', 0, 6, 0, 'N/A', 'N/A', '2021-04-01 00:00:00'),
(2, 'Jim', 'Johnson', '1-777-987-6541', 'jimmyj@gmail.com', 0, 0, 0, 'N/A', 'N/A', '2021-04-06 00:00:00'),
(3, 'Dan', 'Jones', '1-800-400-5000', 'dannyboi3@gmail.com', 0, 0, 0.0292321, 'N/A', 'N/A', '2021-04-07 00:00:00'),
(4, 'Steve', 'Jobs', '1-800-123-4567', 'stevieboy@gmail.com', 0, 0, 0, 'N/A', 'N/A', '2021-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `storeID` int(11) NOT NULL DEFAULT '1',
  `goldOunce` float DEFAULT NULL,
  `silverOunce` float DEFAULT NULL,
  `btc` float DEFAULT NULL,
  `walletAddress` varchar(45) DEFAULT NULL,
  `walletID` varchar(45) DEFAULT NULL,
  `inventoryLocation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`storeID`, `goldOunce`, `silverOunce`, `btc`, `walletAddress`, `walletID`, `inventoryLocation`) VALUES
(1, 101, 94, 5, 'N/A', 'N/A', 'N/A'),
(2, 20, 250, 3.0052, 'N/A', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transID` int(11) NOT NULL AUTO_INCREMENT,
  `goldOunceIn` float DEFAULT NULL,
  `goldOunceOut` float DEFAULT NULL,
  `silverOunceIn` float DEFAULT NULL,
  `silverOunceOut` float DEFAULT NULL,
  `inventoryLocation` varchar(45) DEFAULT NULL,
  `btcIn` float DEFAULT NULL,
  `btcOut` float DEFAULT NULL,
  `walletAddress` varchar(45) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL,
  `custID` int(11) DEFAULT NULL,
  `USDin` float DEFAULT NULL,
  `USDout` float DEFAULT NULL,
  PRIMARY KEY (`transID`),
  KEY `storeID_idx` (`storeID`),
  KEY `custID_idx` (`custID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transID`, `goldOunceIn`, `goldOunceOut`, `silverOunceIn`, `silverOunceOut`, `inventoryLocation`, `btcIn`, `btcOut`, `walletAddress`, `storeID`, `custID`, `USDin`, `USDout`) VALUES
(3, 0, 0, 0, 0, 'register', 0, 0.00376946, 'N/A', 1, 1, 200, 0),
(4, 0, 0, 0, 0, 'N/A', 0.0052, 0, 'N/A', 2, 2, 0, 260),
(5, 1, 0, 0, 0, 'N/A', 0, 0.029231, 'N/A', 1, 3, 0, 0),
(6, 0, 0, 0, 6, 'N/A', 0.003769, 0, 'N/A', 1, 1, 0, 0),
(7, 5, 0, 0, 0, 'N/A', 0, 0.152614, 'N/A', 1, 3, 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `custID` FOREIGN KEY (`custID`) REFERENCES `customers` (`custID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `storeID` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
