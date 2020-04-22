-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for holidaymaker
DROP DATABASE IF EXISTS `holidaymaker`;
CREATE DATABASE IF NOT EXISTS `holidaymaker` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `holidaymaker`;

-- Dumping structure for table holidaymaker.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `Country` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`cityId`),
  UNIQUE KEY `Country` (`Country`,`Name`),
  CONSTRAINT `FK__country` FOREIGN KEY (`Country`) REFERENCES `country` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.city: ~6 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
REPLACE INTO `city` (`cityId`, `Country`, `Name`) VALUES
	(1, 1, 'Lissabon'),
	(3, 3, 'Biarritz'),
	(2, 3, 'Niece'),
	(7, 4, 'Pescara'),
	(5, 5, 'Barcelona'),
	(6, 5, 'Palma');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `name` (`Name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.country: ~4 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
REPLACE INTO `country` (`countryId`, `Name`) VALUES
	(3, 'Frankrike'),
	(4, 'Italien'),
	(1, 'Portugal'),
	(5, 'Spanien');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.hotel
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `HotelId` int(11) NOT NULL AUTO_INCREMENT,
  `City` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `imgLink` varchar(50) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `phoneNr` varchar(50) DEFAULT NULL,
  `Rating` double(22,0) NOT NULL,
  `HalfBoardPrice` double(22,0) NOT NULL,
  `FullBoardPrice` double(22,0) NOT NULL,
  `AllIncPrice` double(22,0) NOT NULL,
  `ExtraBedPrice` double(22,0) NOT NULL,
  `Pool` tinyint(4) NOT NULL DEFAULT 0,
  `Sauna` tinyint(4) NOT NULL DEFAULT 0,
  `Bar` tinyint(4) NOT NULL DEFAULT 0,
  `Entertainment` tinyint(4) NOT NULL DEFAULT 0,
  `KidsClub` tinyint(4) NOT NULL DEFAULT 0,
  `KmToBeach` double NOT NULL DEFAULT 0,
  `KmToCenter` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`HotelId`),
  UNIQUE KEY `HotelId` (`HotelId`,`Name`),
  KEY `FK__city` (`City`),
  CONSTRAINT `FK__city` FOREIGN KEY (`City`) REFERENCES `city` (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.hotel: ~6 rows (approximately)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
REPLACE INTO `hotel` (`HotelId`, `City`, `Name`, `imgLink`, `Address`, `phoneNr`, `Rating`, `HalfBoardPrice`, `FullBoardPrice`, `AllIncPrice`, `ExtraBedPrice`, `Pool`, `Sauna`, `Bar`, `Entertainment`, `KidsClub`, `KmToBeach`, `KmToCenter`) VALUES
	(2, 3, 'Hôtel de Silhouette', './assets/images/silhoutte/hotel.jpg', '30, rue Gambetta 64200', '(+33) 05 59 24 93 82', 5, 300, 1000, 1500, 400, 1, 0, 1, 1, 0, 1, 1),
	(3, 2, 'Hôtel de Suède', './assets/images/suede/hotel.jpg', '18 Avenue de Suède 06000\r\n', '+33 (0)4 93 88 73 73', 3, 350, 970, 1300, 300, 1, 0, 1, 0, 0, 0.2, 2),
	(4, 5, 'Marriott', './assets/images/marriott/hotel.jpg', 'Plaça Rosa del Vents, 1, Final Passeig de Joan de ', '+34 932 95 28 00', 5, 500, 1200, 2300, 560, 0, 0, 1, 1, 0, 0, 1),
	(6, 6, 'Castillo Hotel Son Vida', './assets/images/castillo/hotel.jpg', ' C/Raixa 2, Urbanizacion Son Vida, Palma de Mallor', '+34 971 49 34 93', 5, 550, 1450, 3100, 610, 1, 0, 1, 1, 1, 0.1, 11),
	(7, 7, 'G Hotel', './assets/images/g/hotel.jpg', 'Via Stazione Ferroviaria, 100', '+085.2056813', 4, 100, 590, 1100, 320, 0, 0, 0, 0, 0, 3, 1.7),
	(8, 1, 'My Story Hotel Tejo', './assets/images/myStory/hotel.jpg', 'Rua dos Condes de Monsanto 2', '+00 351 21 886 6182', 4, 295, 810, 1950, 475, 0, 1, 1, 1, 0, 10, 1);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.reservation
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `bookingNumber` int(11) NOT NULL AUTO_INCREMENT,
  `NumberOfRooms` int(11) NOT NULL DEFAULT 1,
  `UserId` int(11) NOT NULL,
  `Checkin` date NOT NULL,
  `Checkout` date NOT NULL,
  `totalPrice` double NOT NULL,
  PRIMARY KEY (`bookingNumber`) USING BTREE,
  KEY `FK__user` (`UserId`),
  KEY `FK__room` (`NumberOfRooms`) USING BTREE,
  CONSTRAINT `FK__user` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.reservation: ~0 rows (approximately)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.reservedroom
DROP TABLE IF EXISTS `reservedroom`;
CREATE TABLE IF NOT EXISTS `reservedroom` (
  `bookingNr` int(11) NOT NULL AUTO_INCREMENT,
  `room` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `numAdults` int(11) NOT NULL,
  `numKids` int(11) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `board` enum('NONE','HB','FB','AI') DEFAULT 'NONE',
  `extraBed` tinyint(4) NOT NULL DEFAULT 0,
  `totalRoomPrice` double(22,0) NOT NULL,
  PRIMARY KEY (`bookingNr`),
  KEY `FK_reservedroom_room` (`room`),
  KEY `FK_reservedroom_user` (`user`),
  CONSTRAINT `FK_reservedroom_room` FOREIGN KEY (`room`) REFERENCES `room` (`RoomId`),
  CONSTRAINT `FK_reservedroom_user` FOREIGN KEY (`user`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.reservedroom: ~0 rows (approximately)
/*!40000 ALTER TABLE `reservedroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservedroom` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.room
DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `RoomId` int(11) NOT NULL AUTO_INCREMENT,
  `RoomNumber` int(11) NOT NULL,
  `Hotel` int(11) NOT NULL,
  `imgLink` varchar(50) DEFAULT NULL,
  `RoomType` enum('SINGLE','DOUBLE','STUDIO') NOT NULL,
  `SmokingAllowed` tinyint(4) NOT NULL DEFAULT 0,
  `PricePerNight` double(22,0) NOT NULL,
  PRIMARY KEY (`RoomId`),
  UNIQUE KEY `RoomNumber` (`RoomNumber`,`Hotel`),
  KEY `FK__hotel` (`Hotel`),
  CONSTRAINT `FK__hotel` FOREIGN KEY (`Hotel`) REFERENCES `hotel` (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.room: ~18 rows (approximately)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
REPLACE INTO `room` (`RoomId`, `RoomNumber`, `Hotel`, `imgLink`, `RoomType`, `SmokingAllowed`, `PricePerNight`) VALUES
	(1, 100, 6, 'castillo/single.jpg', 'SINGLE', 1, 1100),
	(2, 101, 6, 'castillo/double.jpg', 'DOUBLE', 0, 2100),
	(3, 102, 6, 'castillo/studio.jpg', 'STUDIO', 0, 3200),
	(4, 301, 7, 'g/single.jpg', 'SINGLE', 0, 800),
	(5, 302, 7, 'g/double.jpg', 'DOUBLE', 0, 1600),
	(6, 303, 7, 'g/studio.jpg', 'STUDIO', 0, 2400),
	(7, 201, 2, 'silhouette/single.jpg', 'SINGLE', 0, 1300),
	(8, 202, 2, 'silhouette/double.jpg', 'DOUBLE', 0, 2600),
	(9, 203, 2, 'silhouette/studio.jpg', 'STUDIO', 0, 4000),
	(10, 401, 3, 'suede/single.jpg', 'SINGLE', 1, 975),
	(11, 402, 3, 'suede/double.jpg', 'DOUBLE', 1, 1750),
	(12, 403, 3, 'suede/studio.jpg', 'STUDIO', 0, 3400),
	(13, 101, 4, 'marriott/single.jpg', 'SINGLE', 1, 1200),
	(14, 102, 4, 'marriott/double.jpg', 'DOUBLE', 0, 2900),
	(15, 103, 4, 'marriott/studio.jpg', 'STUDIO', 0, 4875),
	(16, 201, 8, 'myStory/single.jpg', 'SINGLE', 0, 2100),
	(19, 202, 8, 'myStory/double.jpg', 'DOUBLE', 1, 3100),
	(20, 203, 8, 'myStory/studio.jpg', 'STUDIO', 0, 4010);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumping structure for view holidaymaker.roominfo
DROP VIEW IF EXISTS `roominfo`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `roominfo` (
	`roomId` INT(11) NOT NULL,
	`imgLink` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`hotelName` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`countryName` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cityName` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`roomType` ENUM('SINGLE','DOUBLE','STUDIO') NOT NULL COLLATE 'utf8mb4_general_ci',
	`hotelRating` DOUBLE(22,0) NOT NULL,
	`kmToBeach` DOUBLE(22,0) NOT NULL,
	`kmToCenter` DOUBLE(22,0) NOT NULL,
	`pricePerNight` DOUBLE(22,0) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table holidaymaker.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL DEFAULT '',
  `Address` varchar(50) NOT NULL DEFAULT '',
  `PhoneNumber` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for view holidaymaker.roominfo
DROP VIEW IF EXISTS `roominfo`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `roominfo`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `roominfo` AS SELECT r.RoomId roomId, r.imgLink imgLink, h.Name hotelName, co.Name countryName, c.Name cityName, r.RoomType roomType, 
h.rating hotelRating, h.KmToBeach kmToBeach, h.KmToCenter kmToCenter, r.PricePerNight pricePerNight
FROM room r 
INNER JOIN hotel h ON h.HotelId = r.Hotel 
INNER JOIN city c ON c.cityId = h.City 
INNER JOIN country co ON co.countryId = c.Country ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
