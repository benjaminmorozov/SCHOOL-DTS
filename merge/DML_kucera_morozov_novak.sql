-- Marek Kučera, Benjamín Morozov, Alex Novák II.A - prepojenie databáz - prepojená je tabuľka zakaznici
SET default_storage_engine=INNODB;
SET GLOBAL innodb_default_row_format = 'DYNAMIC';

-- -----------------------------------------------------
-- použitie databázy kucera_morozov_novak
-- -----------------------------------------------------
USE kucera_morozov_novak;

-- -----------------------------------------------------
-- vyplnenie tabuľky interpreti dátami
-- -----------------------------------------------------

INSERT INTO `interpreti` (`interpretID`, `meno`, `priezvisko`) VALUES
(1, 'Andrew', 'Huang'),
(2, 'Josh', 'A'),
(3, 'Ne', 'Obliviscaris'),
(4, 'Imagine', 'Dragons'),
(5, 'Bryce', 'Fox'),
(6, 'Xanthochroid', '-');

-- -----------------------------------------------------
-- vyplnenie tabuľky hudba dátami
-- -----------------------------------------------------

INSERT INTO `hudba` (`hudbaID`, `nazov_pesnicky`, `interpretID`) VALUES
(1, 'Forget Not', 3),
(2, 'Xenoflux', 3),
(3, 'As icicles fall', 3),
(4, 'Ganglia', 1),
(5, 'Autoharp', 1),
(6, 'Rainmaker', 1),
(7, 'Blessed he with boils', 6),
(8, 'Long live the lifeless king', 6),
(9, 'im putris stagnum', 6),
(10, 'No breaks', 2),
(11, 'Used to', 2),
(12, 'In flames', 2),
(13, 'Painters of the tempest', 3),
(14, 'Phyrric', 3),
(15, 'Devour me, Collosus', 3),
(16, 'Horns', 5),
(17, 'Heaven on hold', 5),
(18, 'Coldhearted', 5),
(19, 'Of aching empty pain', 6),
(20, 'The sound which has no name', 6),
(21, 'Through chains that drag us downward', 6),
(22, 'Golden boy', 5),
(23, 'Strenght', 5),
(24, 'Hate myself', 5),
(25, 'Grid echo', 1),
(26, 'Amulets Tape', 1),
(27, 'Waiting', 1),
(28, 'Believer', 4),
(29, 'Thunder', 4),
(30, 'Whatever It takes', 4);

-- -----------------------------------------------------
-- vyplnenie tabuľky vydavatelstva dátami
-- -----------------------------------------------------

INSERT INTO `vydavatelstva` (`id_vydavatela`, `meno_vydavatela`) VALUES
(1, 'Knihy doby'),
(2, 'Magická brána vedomostí'),
(3, 'Andrej Sládkovič'),
(4, 'J. K. Rowlingová'),
(5, 'Nadčasové knihy'),
(6, 'WOW'),
(7, 'Slniečko'),
(8, 'Jablko'),
(9, 'ABC PRESS'),
(10, 'Columbus');

-- -----------------------------------------------------
-- vyplnenie tabuľky knihy dátami
-- -----------------------------------------------------

INSERT INTO `knihy` (`id_knihy`, `nazov`, `vydavatel_id`) VALUES
(1, 'Hrdý spasiteľ', 2),
(2, 'Cudzinec bez strachu', 3),
(3, 'Lovci bez povinností', 7),
(4, 'Korytnačky s cieľom', 8),
(5, 'Súboj s nesmrteľnosťou', 5),
(6, 'Priatelia a mačky', 10),
(7, 'Nekonečná plavba', 9),
(8, 'Predzvesť tmy', 4),
(9, 'Nenápadné vajíčko', 1),
(10, 'ZOO', 6);

-- -----------------------------------------------------
-- vyplnenie tabuľky reziseri dátami
-- -----------------------------------------------------

INSERT INTO `reziseri` (`ReziserID`, `Meno`, `Priezvisko`, `Vek`) VALUES
(4, 'Andry', 'Serkis', 57),
(3, 'Cary Joji', 'Fukunaga', 44),
(2, 'Jon', 'Watts', 40),
(1, 'Ridley', 'Scott', 84),
(5, 'Johannes', 'Roberts', 45),
(6, 'T', 'Gnanavel', 40),
(7, 'Stephan', 'Karam', 40),
(8, 'Sam', 'Mendes', 56),
(9, 'Christoper', 'Nolan', 51),
(10, 'James', 'Cameron', 67),
(11, 'David', 'Michod', 49),
(12, 'Martin', 'Scorsese', 79);

-- -----------------------------------------------------
-- vyplnenie tabuľky filmy dátami
-- -----------------------------------------------------

INSERT INTO `filmy` (`FilmID`, `Nazov`, `Zaner`, `HodnotenieFilmu`, `Rok`, `ReziserID`) VALUES
(5, 'Resident Evil: Welcome to Raccoon City', '', 5.6, 2021, 5),
(4, ' Venom: Let There Be Carnage', '', 6.1, 2021, 4),
(3, 'No Time to Die', '', 7.4, 2021, 3),
(2, 'Spider-Man: No Way Home', '', 6.4, 2021, 2),
(1, 'House of Gucci', '', 7, 2021, 1),
(6, 'Jai Bhim', '', 9.5, 2021, 6),
(7, 'The Humans', '', 6.1, 2021, 7),
(8, 'James Bond: Spectre', '', 6.8, 2015, 8),
(9, 'Interstellar', '', 8.6, 2014, 9),
(10, 'Titanic', '', 7.8, 2014, 10),
(11, 'The King', '', 7.3, 2019, 11),
(12, 'The Irishman', '', 7.8, 2019, 12),
(13, '1917', '', 8.3, 2019, 8),
(14, 'Gladiator', '', 8.5, 2000, 1),
(15, 'The Martian', '', 8, 2015, 1),
(16, 'Avatar', '', 7.8, 2009, 10),
(17, 'Dunkirk', '', 7.8, 2017, 9);

-- -----------------------------------------------------
-- vyplnenie tabuľky zakaznici dátami - prepojená tabuľka
-- -----------------------------------------------------

INSERT INTO `zakaznici` (`id_zakaznika`, `meno`, `priezvisko`, `id_pesnicky`, `id_filmu`, `id_knihy`) VALUES
(1, 'Adéla', 'Novajská', 1, 1, 1),
(2, 'Marek', 'Žaluď', 2, 2, 2),
(3, 'Vladislav', 'Németh', 3, 3, 3),
(4, 'Martin', 'Strojár', 4, 4, 4),
(5, 'Lucia', 'Česká', 5, 5, 5),
(6, 'Matej', 'Tovarišský', 6, 6, 6),
(7, 'Timotej', 'Akos', 7, 7, 7),
(8, 'Jozef', 'Horák', 8, 8, 8),
(9, 'Maximilián', 'Soják', 9, 9, 9),
(10, 'Juraj', 'Vlažný', 10, 10, 10);