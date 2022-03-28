CREATE DATABASE alex_novak;
USE alex_novak;


CREATE TABLE filmy
(
    Filmid INT PRIMARY KEY,
    Nazov VARCHAR(50) NOT NULL,
    ZanerID VARCHAR(50) NOT NULL,
    HodnotenieFilmu FLOAT(6) NOT NULL,
    Rok YEAR NOT NULL, 
    ReziserID INT(6) NOT NULL,
    FOREIGN KEY (ZanerID) REFERENCES zaner(Zanerid),
    FOREIGN KEY (ReziserID) REFERENCES reziser(Reziserid)
)

CREATE TABLE zaner
(
    Zanerid INT PRIMARY KEY,
    ZanerNazov VARCHAR(50) NOT NULL
)

CREATE TABLE reziser
(
    Reziserid INT PRIMARY KEY,
    Meno VARCHAR(50),
    Priezvisko VARCHAR(50),
    Vek INT(4) NOT NULL
)

-- pridanie novej tabuľky dňa 6.12.2021 za účelom spojenia/prepojenia dvoch tabuliek

CREATE TABLE reziser_filmy
(
    reziser_ID INT(6) UNSIGNED NOT NULL,
    film_ID INT(6) UNSIGNED NOT NULL,
    PRIMARY KEY (film_ID, reziser_ID),
    FOREIGN KEY (film_ID) REFERENCES filmy(Filmid),
    FOREIGN KEY (reziser_ID) REFERENCES reziser(Reziserid)
);