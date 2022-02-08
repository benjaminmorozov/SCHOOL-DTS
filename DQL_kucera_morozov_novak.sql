-- Marek Kučera, Benjamín Morozov, Alex Novák II.A - prepojenie databáz - prepojená je tabuľka zakaznici
SET default_storage_engine=INNODB;
SET GLOBAL innodb_default_row_format = 'DYNAMIC';

-- -----------------------------------------------------
-- použitie databázy kucera_morozov_novak
-- -----------------------------------------------------
USE kucera_morozov_novak;

-- -----------------------------------------------------
-- SELECT, ktory mi vrati nazvy a reziserov vsetkych filmov
-- -----------------------------------------------------
SELECT zakaznici.id_filmu, filmy.nazov, filmy.ReziserID, reziseri.Meno FROM zakaznici
LEFT JOIN filmy ON FilmID = id_filmu
LEFT JOIN reziseri ON filmy.ReziserID = reziseri.ReziserID;

-- -----------------------------------------------------
-- SELECT, ktory mi vrati oblubene pesnicky kazdeho zakaznika a ich interpretov
-- -----------------------------------------------------
SELECT zakaznici.meno, zakaznici.id_pesnicky, hudba.hudbaID, hudba.nazov_pesnicky, hudba.interpretID, interpreti.interpretID, interpreti.meno FROM zakaznici
LEFT JOIN hudba ON id_pesnicky = hudba.hudbaID
LEFT JOIN interpreti ON hudba.interpretID = interpreti.interpretID;

-- -----------------------------------------------------
-- SELECT, ktory mi vrati knihy od kazdeho vydavatelstva
-- -----------------------------------------------------
SELECT vydavatelstva.id_vydavatela, vydavatelstva.meno_vydavatela, knihy.vydavatel_id, knihy.nazov FROM vydavatelstva
LEFT JOIN knihy ON knihy.vydavatel_id = vydavatelstva.id_vydavatela;