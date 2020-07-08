-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 08. Jul 2020 um 14:23
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `WorldOfBooks`
--
CREATE DATABASE IF NOT EXISTS `WorldOfBooks` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `WorldOfBooks`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(25) NOT NULL,
  `first_name_author` varchar(25) NOT NULL,
  `second_name_author` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `first_name_author`, `second_name_author`) VALUES
(1, 'stefan ', 'zweig '),
(2, 'Michael ', 'Laube');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `book_id` int(10) NOT NULL,
  `title` varchar(25) NOT NULL,
  `fk_author` int(25) NOT NULL,
  `fk_rent_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `books`
--

INSERT INTO `books` (`book_id`, `title`, `fk_author`, `fk_rent_id`) VALUES
(1, 'Die Schachnovelle', 1, 1),
(2, 'Einstieg in SQL', 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Customer`
--

INSERT INTO `Customer` (`customer_id`, `first_name`, `last_name`, `phone`, `address`) VALUES
(3, 'Eva', 'Anna', 650, 1),
(4, 'gheri ', 'Serri ', 676, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `c_address`
--

CREATE TABLE `c_address` (
  `adress_id` int(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `street_name` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `zip_code` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `c_address`
--

INSERT INTO `c_address` (`adress_id`, `city`, `street_name`, `country`, `zip_code`) VALUES
(1, 'vienna', 'test', 'test', 1140);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `I_address`
--

CREATE TABLE `I_address` (
  `address_id` int(25) NOT NULL,
  `city_library` varchar(25) NOT NULL,
  `street_name_library` varchar(25) NOT NULL,
  `Country_library` varchar(25) NOT NULL,
  `zip_code_library` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `library`
--

CREATE TABLE `library` (
  `library_id` int(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `fk_adress` int(25) NOT NULL,
  `fk_book_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `rent_data_start` date NOT NULL,
  `rent_data_end` date NOT NULL,
  `fk_customer` int(11) NOT NULL COMMENT 'foreign key '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_author` (`fk_author`),
  ADD KEY `fk_rent_id` (`fk_rent_id`);

--
-- Indizes für die Tabelle `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `address` (`address`);

--
-- Indizes für die Tabelle `c_address`
--
ALTER TABLE `c_address`
  ADD PRIMARY KEY (`adress_id`);

--
-- Indizes für die Tabelle `I_address`
--
ALTER TABLE `I_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indizes für die Tabelle `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`library_id`),
  ADD KEY `fk_adress` (`fk_adress`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indizes für die Tabelle `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_customer` (`fk_customer`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `c_address`
--
ALTER TABLE `c_address`
  MODIFY `adress_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `I_address`
--
ALTER TABLE `I_address`
  MODIFY `address_id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `library`
--
ALTER TABLE `library`
  MODIFY `library_id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_author`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`fk_rent_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`address`) REFERENCES `c_address` (`adress_id`);

--
-- Constraints der Tabelle `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`fk_adress`) REFERENCES `I_address` (`address_id`),
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints der Tabelle `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `Customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
