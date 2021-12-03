-- Morozov Benjamín II.A - kniznica script

-- pre túto session/reláciu chceme používať engine INNODB, ktorý podporuje foreign key
SET default_storage_engine=INNODB;

-- -----------------------------------------------------
-- vytvorenie databázy benjamin_morozov
-- -----------------------------------------------------
DROP DATABASE IF EXISTS benjamin_morozov;
CREATE DATABASE benjamin_morozov DEFAULT CHARACTER SET utf8;
USE benjamin_morozov;

-- -----------------------------------------------------
-- Vytvorenie tabuľky zakaznici
-- -----------------------------------------------------
CREATE TABLE `zakaznici`
(
    `id_zakaznika` int NOT NULL AUTO_INCREMENT,
    `meno` text NOT NULL,
    `priezvisko` text NOT NULL,
    PRIMARY KEY (`id_zakaznika`)
);

-- -----------------------------------------------------
-- Vytvorenie tabuľky vydavatelstva
-- -----------------------------------------------------
CREATE TABLE `vydavatelstva`
(
    `id_vydavatela` int NOT NULL AUTO_INCREMENT,
    `meno_vydavatela` text NOT NULL,
    PRIMARY KEY (`id_vydavatela`)
);

-- -----------------------------------------------------
-- Vytvorenie tabuľky knihy
-- -----------------------------------------------------
CREATE TABLE `knihy`
(
    `id_knihy` int NOT NULL AUTO_INCREMENT,
    `nazov` text NOT NULL,
    `zapozicana_id` int DEFAULT NULL,
    `vydavatel_id` int NOT NULL,
    PRIMARY KEY (`id_knihy`),
    KEY `zapozicane` (`zapozicana_id`),
    KEY `vydavatel` (`vydavatel_id`),
    CONSTRAINT `vydavatel` FOREIGN KEY (`vydavatel_id`) REFERENCES `vydavatelstva` (`id_vydavatela`) ON DELETE CASCADE,
    CONSTRAINT `zapozicane` FOREIGN KEY (`zapozicana_id`) REFERENCES `zakaznici` (`id_zakaznika`) ON DELETE CASCADE
);

-- bola vytvorená databáza kniznica s tromi
-- tabulkami - zakaznici, vydavatelstva a knihy
-- -----------------------------------------------------
-- koniec scriptu - successful