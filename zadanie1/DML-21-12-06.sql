-- -----------------------------------------------------
-- Vyplnenie tabuľky zakaznici dátami
-- -----------------------------------------------------
INSERT INTO zakaznici (id_zakaznika, meno, priezvisko)
VALUES ('1', 'Adéla', 'Novajská'), ('2', 'Marek', 'Žaluď'),
('3', 'Vladislav', 'Németh'), ('4', 'Martin', 'Strojár'),
('5', 'Lucia', 'Česká'), ('6', 'Matej', 'Tovarišský'),
('7', 'Timotej', 'Akos'), ('8', 'Jozef', 'Horák'),
('9', 'Maximilián', 'Soják'), ('10', 'Juraj', 'Vlažný');
-- príkaz je možné použiť v jednom riadku, no pre čitateľnosť bol
-- rozdelený na ďalšie riadky

-- -----------------------------------------------------
-- Vyplnenie tabuľky vydavatelstva dátami
-- -----------------------------------------------------
INSERT INTO vydavatelstva (id_vydavatela, meno_vydavatela)
VALUES ('1', 'Knihy doby'), ('2', 'Magická brána vedomostí'),
('3', 'Andrej Sládkovič'), ('4', 'J. K. Rowlingová'),
('5', 'Nadčasové knihy'), ('6', 'WOW'), ('7', 'Slniečko'),
('8', 'Jablko'), ('9', 'ABC PRESS'), ('10', 'Columbus');

-- -----------------------------------------------------
-- Vyplnenie tabuľky knihy dátami
-- -----------------------------------------------------
INSERT INTO knihy (id_knihy, nazov)
VALUES ('1', 'Hrdý spasiteľ'),
('2', 'Cudzinec bez strachu'),
('3', 'Lovci bez povinností'),
('4', 'Korytnačky s cieľom'),
('5', 'Súboj s nesmrteľnosťou'),
('6', 'Priatelia a mačky'),
('7', 'Nekonečná plavba'),
('8', 'Predzvesť tmy'),
('9', 'Nenápadné vajíčko'),
('10', 'ZOO');

-- -----------------------------------------------------
-- Vyplnenie tabuľky knihy_a_vydavatelstva dátami
-- -----------------------------------------------------
INSERT INTO knihy_a_vydavatelstva (id_knihy, vydavatel_id)
VALUES ('1', '2'),
('2', '3'),
('3', '4'),
('4', '4'),
('5', '5'),
('6', '7'),
('7', '9'),
('8', '4'),
('9', '1'),
('10', '1');

-- -----------------------------------------------------
-- Vyplnenie tabuľky zapozicane dátami
-- -----------------------------------------------------
INSERT INTO zapozicane (id_knihy, nazov, zapozicana_id, vydavatel_id)
VALUES ('1', 'Hrdý spasiteľ', NULL, '2'),
('2', 'Cudzinec bez strachu', '2', '3'),
('3', 'Lovci bez povinností', '9', '4'),
('4', 'Korytnačky s cieľom', '4', '4'),
('5', 'Súboj s nesmrteľnosťou', NULL, '5'),
('6', 'Priatelia a mačky', '6', '7'),
('7', 'Nekonečná plavba', '3', '9'),
('8', 'Predzvesť tmy', '8', '4'),
('9', 'Nenápadné vajíčko', NULL, '1'),
('10', 'ZOO', '1', '1');