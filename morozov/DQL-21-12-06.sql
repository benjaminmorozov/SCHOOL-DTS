-- -----------------------------------------------------
-- SELECT, ktory mi vrati nazvy vsetkych knih
-- -----------------------------------------------------
SELECT knihy.nazov FROM knihy;

-- -----------------------------------------------------
-- SELECT, ktory mi vrati vsetky zapozicane knihy
-- -----------------------------------------------------
SELECT zapozicane.nazov FROM zapozicane WHERE zapozicana_id IS NOT NULL;

-- -----------------------------------------------------
-- SELECT s vyberom nazvu knihy, nazvu a id vydavatela knihy a
-- id a mena zakaznika, ktory si knihu pozical
-- -----------------------------------------------------
SELECT zapozicane.nazov, zapozicane.vydavatel_id, zapozicane.zapozicana_id, vydavatelstva.id_vydavatela, vydavatelstva.meno_vydavatela, zakaznici.id_zakaznika, zakaznici.meno
FROM zapozicane
LEFT JOIN vydavatelstva ON vydavatelstva.id_vydavatela = vydavatel_id
LEFT JOIN zakaznici ON zakaznici.id_zakaznika = zapozicana_id;