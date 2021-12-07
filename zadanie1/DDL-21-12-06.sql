-- Morozov Benjamín II.A - kniznica script úloha 2 M:N relácia

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
    `nazov` varchar(255) NOT NULL,
    PRIMARY KEY (`id_knihy`),
    KEY `nazov_knihy` (`nazov`)
);

-- -----------------------------------------------------
-- Vytvorenie tabuľky knihy_a_vydavatelstva - M:N relácia
-- -----------------------------------------------------

create TABLE `knihy_a_vydavatelstva`
(
    `id_knihy` int NOT NULL AUTO_INCREMENT,
    `vydavatel_id` int NOT NULL,
    PRIMARY KEY (`id_knihy`, `vydavatel_id`),
    KEY `vydavatel` (`vydavatel_id`),
    KEY `kniha` (`id_knihy`),
    CONSTRAINT `vydavatel` FOREIGN KEY (`vydavatel_id`) REFERENCES `vydavatelstva` (`id_vydavatela`) ON DELETE CASCADE,
    CONSTRAINT `kniha` FOREIGN KEY (`id_knihy`) REFERENCES `knihy` (`id_knihy`) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Vytvorenie tabuľky zapozicane
-- -----------------------------------------------------
CREATE TABLE `zapozicane`
(
    `id_knihy` int NOT NULL AUTO_INCREMENT,
    `nazov` varchar(255) NOT NULL,
    `zapozicana_id` int,
    `vydavatel_id` int NOT NULL,
    PRIMARY KEY (`id_knihy`),
    KEY `zapozicane` (`zapozicana_id`),
    KEY `vydavatel1` (`vydavatel_id`),
    KEY `nazov_knihy` (`nazov`),
    CONSTRAINT `id_knihy` FOREIGN KEY (`id_knihy`) REFERENCES `knihy` (`id_knihy`) ON DELETE CASCADE,
    CONSTRAINT `zapozicane` FOREIGN KEY (`zapozicana_id`) REFERENCES `zakaznici` (`id_zakaznika`) ON DELETE CASCADE,
    CONSTRAINT `vydavatel1` FOREIGN KEY (`vydavatel_id`) REFERENCES `vydavatelstva` (`id_vydavatela`) ON DELETE CASCADE,
    CONSTRAINT `nazov_knihy` FOREIGN KEY (`nazov`) REFERENCES `knihy` (`nazov`) ON DELETE CASCADE
);