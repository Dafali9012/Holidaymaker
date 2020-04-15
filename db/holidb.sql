-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.11-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumpar struktur för tabell holiday_db.city
CREATE TABLE IF NOT EXISTS `city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `Country` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`cityId`),
  UNIQUE KEY `Country` (`Country`,`Name`),
  CONSTRAINT `FK__country` FOREIGN KEY (`Country`) REFERENCES `country` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.city: ~6 rows (ungefär)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
REPLACE INTO `city` (`cityId`, `Country`, `Name`) VALUES
	(1, 1, 'Lissabon'),
	(3, 3, 'Biarritz'),
	(2, 3, 'Niece'),
	(7, 4, 'Pescara'),
	(5, 5, 'Barcelona'),
	(6, 5, 'Palma');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.country
CREATE TABLE IF NOT EXISTS `country` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `name` (`Name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.country: ~4 rows (ungefär)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
REPLACE INTO `country` (`countryId`, `Name`) VALUES
	(3, 'Frankrike'),
	(4, 'Italien'),
	(1, 'Portugal'),
	(5, 'Spanien');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.hotel
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

-- Dumpar data för tabell holiday_db.hotel: ~6 rows (ungefär)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
REPLACE INTO `hotel` (`HotelId`, `City`, `Name`, `imgLink`, `Address`, `phoneNr`, `Rating`, `HalfBoardPrice`, `FullBoardPrice`, `AllIncPrice`, `Pool`, `Sauna`, `Bar`, `Entertainment`, `KidsClub`, `KmToBeach`, `KmToCenter`) VALUES
	(2, 3, 'Hôtel de Silhouette', './assets/images/silhoutte/hotel.jpg', '30, rue Gambetta 64200', '(+33) 05 59 24 93 82', 5, 300, 1000, 1500, 1, 0, 1, 1, 0, 1, 1),
	(3, 2, 'Hôtel de Suède', './assets/images/suede/hotel.jpg', '18 Avenue de Suède 06000\r\n', '+33 (0)4 93 88 73 73', 3, 350, 970, 1300, 1, 0, 1, 0, 0, 0.2, 2),
	(4, 5, 'Marriott', './assets/images/marriott/hotel.jpg', 'Plaça Rosa del Vents, 1, Final Passeig de Joan de ', '+34 932 95 28 00', 5, 500, 1200, 2300, 0, 0, 1, 1, 0, 0, 1),
	(6, 6, 'Castillo Hotel Son Vida', './assets/images/castillo/hotel.jpg', ' C/Raixa 2, Urbanizacion Son Vida, Palma de Mallor', '+34 971 49 34 93', 5, 550, 1450, 3100, 1, 0, 1, 1, 1, 0.1, 11),
	(7, 7, 'G Hotel', './assets/images/g/hotel.jpg', 'Via Stazione Ferroviaria, 100', '+085.2056813', 4, 100, 590, 1100, 0, 0, 0, 0, 0, 3, 1.7),
	(8, 1, 'My Story Hotel Tejo', './assets/images/myStory/hotel.jpg', 'Rua dos Condes de Monsanto 2', '+00 351 21 886 6182', 4, 295, 810, 1950, 0, 1, 1, 1, 0, 10, 1);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.reservation
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

-- Dumpar data för tabell holiday_db.reservation: ~0 rows (ungefär)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.reservedroom
CREATE TABLE IF NOT EXISTS `reservedroom` (
  `booking` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `numAdults` int(11) NOT NULL,
  `numKids` int(11) NOT NULL,
  `board` enum('NONE','HB','FB','AI') NOT NULL DEFAULT 'NONE',
  `totalRoomPrice` double(22,0) NOT NULL,
  KEY `FK_reservedroom_booking` (`booking`),
  KEY `FK_reservedroom_room` (`room`),
  CONSTRAINT `FK_reservedroom_booking` FOREIGN KEY (`booking`) REFERENCES `reservation` (`BookingNumber`),
  CONSTRAINT `FK_reservedroom_room` FOREIGN KEY (`room`) REFERENCES `room` (`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.reservedroom: ~0 rows (ungefär)
/*!40000 ALTER TABLE `reservedroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservedroom` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.room
CREATE TABLE IF NOT EXISTS `room` (
  `RoomId` int(11) NOT NULL AUTO_INCREMENT,
  `RoomNumber` int(11) NOT NULL,
  `Hotel` int(11) NOT NULL,
  `imgLink` varchar(50) DEFAULT NULL,
  `RoomType` enum('SINGLE','DOUBLE','STUDIO') NOT NULL,
  `SmokingAllowed` tinyint(4) NOT NULL DEFAULT 0,
  `ExtraBed` tinyint(4) NOT NULL DEFAULT 0,
  `PricePerNight` double(22,0) NOT NULL,
  PRIMARY KEY (`RoomId`),
  UNIQUE KEY `RoomNumber` (`RoomNumber`,`Hotel`),
  KEY `FK__hotel` (`Hotel`),
  CONSTRAINT `FK__hotel` FOREIGN KEY (`Hotel`) REFERENCES `hotel` (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.room: ~18 rows (ungefär)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
REPLACE INTO `room` (`RoomId`, `RoomNumber`, `Hotel`, `imgLink`, `RoomType`, `SmokingAllowed`, `ExtraBed`, `PricePerNight`) VALUES
	(1, 100, 6, './assets/images/castillo/single.jpg', 'SINGLE', 1, 0, 1100),
	(2, 101, 6, './assets/images/castillo/double.jpg', 'DOUBLE', 0, 0, 2100),
	(3, 102, 6, './assets/images/castillo/studio.jpg', 'STUDIO', 0, 0, 3200),
	(4, 301, 7, './assets/images/g/single.jpg', 'SINGLE', 0, 0, 800),
	(5, 302, 7, './assets/images/g/double.jpg', 'DOUBLE', 0, 0, 1600),
	(6, 303, 7, './assets/images/g/studio.jpg', 'STUDIO', 0, 0, 2400),
	(7, 201, 2, './assets/images/silhouette/single.jpg', 'SINGLE', 0, 0, 1300),
	(8, 202, 2, './assets/images/silhouette/double.jpg', 'DOUBLE', 0, 0, 2600),
	(9, 203, 2, './assets/images/silhouette/studio.jpg', 'STUDIO', 0, 0, 4000),
	(10, 401, 3, './assets/images/suede/single.jpg', 'SINGLE', 1, 0, 975),
	(11, 402, 3, './assets/images/suede/double.jpg', 'DOUBLE', 1, 0, 1750),
	(12, 403, 3, './assets/images/suede/studio.jpg', 'STUDIO', 0, 0, 3400),
	(13, 101, 4, './assets/images/marriott/single.jpg', 'SINGLE', 1, 0, 1200),
	(14, 102, 4, './assets/images/marriott/double.jpg', 'DOUBLE', 0, 0, 2900),
	(15, 103, 4, './assets/images/marriott/studio.jpg', 'STUDIO', 0, 0, 4875),
	(16, 201, 8, './assets/images/myStory/single.jpg', 'SINGLE', 0, 0, 2100),
	(19, 202, 8, './assets/images/myStory/double.jpg', 'DOUBLE', 1, 0, 3100),
	(20, 203, 8, './assets/images/myStory/studio.jpg', 'STUDIO', 0, 0, 4010);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL DEFAULT '',
  `Address` varchar(50) NOT NULL DEFAULT '',
  `PhoneNumber` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.user: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
