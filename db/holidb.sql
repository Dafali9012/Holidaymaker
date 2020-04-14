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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.city: ~0 rows (ungefär)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.country
CREATE TABLE IF NOT EXISTS `country` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `name` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.country: ~0 rows (ungefär)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday_db.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `HotelId` int(11) NOT NULL AUTO_INCREMENT,
  `City` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Rating` double(22,0) NOT NULL,
  `HalfBoardPrice` double(22,0) NOT NULL,
  `FullBoardPrice` double(22,0) NOT NULL,
  `AllIncPrice` double(22,0) NOT NULL,
  `Pool` tinyint(4) NOT NULL DEFAULT 0,
  `Sauna` tinyint(4) NOT NULL DEFAULT 0,
  `Bar` tinyint(4) NOT NULL DEFAULT 0,
  `Entertainment` tinyint(4) NOT NULL DEFAULT 0,
  `KidsClub` tinyint(4) NOT NULL DEFAULT 0,
  `KmToBeach` int(11) NOT NULL,
  `KmToCenter` int(11) NOT NULL,
  PRIMARY KEY (`HotelId`),
  UNIQUE KEY `HotelId` (`HotelId`,`Name`),
  KEY `FK__city` (`City`),
  CONSTRAINT `FK__city` FOREIGN KEY (`City`) REFERENCES `city` (`cityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.hotel: ~0 rows (ungefär)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
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
  `board` enum('Y','N') NOT NULL,
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
  `RoomType` enum('Y','N') NOT NULL,
  `SmokingAllowed` tinyint(4) NOT NULL DEFAULT 0,
  `ExtraBed` tinyint(4) NOT NULL DEFAULT 0,
  `PricePerNight` double(22,0) NOT NULL,
  PRIMARY KEY (`RoomId`),
  UNIQUE KEY `RoomNumber` (`RoomNumber`,`Hotel`),
  KEY `FK__hotel` (`Hotel`),
  CONSTRAINT `FK__hotel` FOREIGN KEY (`Hotel`) REFERENCES `hotel` (`HotelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell holiday_db.room: ~0 rows (ungefär)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
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

-- Dumpar data för tabell holiday_db.user: ~1 rows (ungefär)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`UserId`, `Email`, `Password`, `FullName`, `Address`, `PhoneNumber`) VALUES
	(1, 'mipanowicz@gmail.com', 'xxx', 'michelle halå', 'gata 3', '95438736');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
