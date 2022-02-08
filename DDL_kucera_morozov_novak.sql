-- Marek Kučera, Benjamín Morozov, Alex Novák II.A - prepojenie databáz - prepojená je tabuľka zakaznici
SET default_storage_engine=INNODB;
SET GLOBAL innodb_default_row_format = 'DYNAMIC';

-- -----------------------------------------------------
-- vytvorenie databázy kucera_morozov_novak
-- -----------------------------------------------------

DROP DATABASE IF EXISTS kucera_morozov_novak;
CREATE DATABASE kucera_morozov_novak DEFAULT CHARACTER SET utf8;
USE kucera_morozov_novak;

-- -----------------------------------------------------
-- vytvorenie tabuľky interpreti
-- -----------------------------------------------------

DROP TABLE IF EXISTS `interpreti`;
CREATE TABLE IF NOT EXISTS `interpreti` (
  `interpretID` int NOT NULL AUTO_INCREMENT,
  `meno` text COLLATE utf8mb4_general_ci NOT NULL,
  `priezvisko` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`interpretID`)
);

-- -----------------------------------------------------
-- vytvorenie tabuľky hudba
-- -----------------------------------------------------

DROP TABLE IF EXISTS `hudba`;
CREATE TABLE IF NOT EXISTS `hudba` (
  `hudbaID` int NOT NULL AUTO_INCREMENT,
  `nazov_pesnicky` text COLLATE utf8mb4_general_ci NOT NULL,
  `interpretID` int NOT NULL,
  PRIMARY KEY (`hudbaID`),
  KEY `interpretID` (`interpretID`),
  FOREIGN KEY (interpretID) REFERENCES interpreti(interpretID)
);

-- -----------------------------------------------------
-- vytvorenie tabuľky vydavatelstva
-- -----------------------------------------------------

DROP TABLE IF EXISTS `vydavatelstva`;
CREATE TABLE IF NOT EXISTS `vydavatelstva` (
  `id_vydavatela` int NOT NULL AUTO_INCREMENT,
  `meno_vydavatela` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_vydavatela`)
);

-- -----------------------------------------------------
-- vytvorenie tabuľky knihy
-- -----------------------------------------------------

DROP TABLE IF EXISTS `knihy`;
CREATE TABLE IF NOT EXISTS `knihy` (
  `id_knihy` int NOT NULL AUTO_INCREMENT,
  `nazov` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vydavatel_id` int NOT NULL,
  PRIMARY KEY (`id_knihy`,`vydavatel_id`),
  KEY `vydavatel` (`vydavatel_id`),
  KEY `nazov_knihy` (`nazov`(250)),
  CONSTRAINT `vydavatel` FOREIGN KEY (`vydavatel_id`) REFERENCES `vydavatelstva` (`id_vydavatela`) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- vytvorenie tabuľky reziseri
-- -----------------------------------------------------

DROP TABLE IF EXISTS `reziseri`;
CREATE TABLE IF NOT EXISTS `reziseri` (
  `ReziserID` int NOT NULL,
  `Meno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Priezvisko` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Vek` int NOT NULL,
  PRIMARY KEY (`ReziserID`)
);

-- -----------------------------------------------------
-- vytvorenie tabuľky filmy
-- -----------------------------------------------------

DROP TABLE IF EXISTS `filmy`;
CREATE TABLE IF NOT EXISTS `filmy` (
  `FilmID` int NOT NULL,
  `Nazov` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Zaner` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `HodnotenieFilmu` float NOT NULL,
  `Rok` year NOT NULL,
  `ReziserID` int NOT NULL,
  PRIMARY KEY (`FilmID`),
  KEY `ReziserID` (`ReziserID`),
  FOREIGN KEY (ReziserID) REFERENCES reziseri(ReziserID)
);

-- -----------------------------------------------------
-- vytvorenie tabuľky zakaznici 
,
,
-- -----------------------------------------------------

DROP TABLE IF EXISTS `zakaznici`;
CREATE TABLE IF NOT EXISTS `zakaznici` (
  `id_zakaznika` int NOT NULL AUTO_INCREMENT,
  `meno` text COLLATE utf8mb4_general_ci NOT NULL,
  `priezvisko` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_pesnicky` int NOT NULL,
  `id_filmu` int NOT NULL,
  `id_knihy` int NOT NULL,
  PRIMARY KEY (`id_zakaznika`,`id_pesnicky`,`id_filmu`,`id_knihy`),
  KEY `zakaznik` (`id_zakaznika`),
  KEY `pesnicka` (`id_pesnicky`),
  KEY `film` (`id_filmu`),
  KEY `kniha` (`id_knihy`),
  CONSTRAINT `pesnicka` FOREIGN KEY (`id_pesnicky`) REFERENCES `hudba` (`hudbaID`) ON DELETE CASCADE,
  CONSTRAINT `film` FOREIGN KEY (`id_filmu`) REFERENCES `filmy` (`FilmID`) ON DELETE CASCADE,
  CONSTRAINT `kniha` FOREIGN KEY (`id_knihy`) REFERENCES `knihy` (`id_knihy`) ON DELETE CASCADE
);