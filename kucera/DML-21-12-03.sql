-- vkladanie udajov

-- Vkladanie udajov o autorovi

INSERT INTO Authors (name, surname) VALUES
('Andrew','Huang'),
('Josh','A'),
('Ne','Obliviscaris'),
('Imagine','Dragons'),
('Bryce','Fox'),
('Xanthochroid','-');

-- vkladanie udajov o albume s pomocou ID autora

INSERT INTO Albums (album_name, authorID) VALUES
('Portal Of One',3),
('Ganglia',1),
('Blessed he with boils',6),
('Fearless', 2),
('Citadel',3),
('Heaven on hold',5),
('Of Erthe and Axen',6),
('Strenght',5),
('Alabaster',1),
('Evolve',4);

-- Vkladanie udajov o HUDOBNEJ skladbe 

INSERT INTO Songs (song_name, albumID, authorID) VALUES
('Forget Not',1,3),
('Xenoflux',1,3),
('As icicles fall',1,3),
('Ganglia',2,1),
('Autoharp',2,1),
('Rainmaker',2,1),
('Blessed he with boils',3,6),
('Long live the lifeless king',3,6),
('im putris stagnum',3,6),
('No breaks',4,2),
('Used to',4,2),
('In flames',4,2),
('Painters of the tempest',5,3),
('Phyrric',5,3),
('Devour me, Collosus',5,3),
('Horns',6,5),
('Heaven on hold',6,5),
('Coldhearted',6,5),
('Of aching empty pain',7,6),
('The sound which has no name',7,6),
('Through chains that drag us downward',7,6),
('Golden boy',8,5),
('Strenght',8,5),
('Hate myself',8,5),
('Grid echo',9,1),
('Amulets Tape',9,1),
('Waiting',9,1),
('Believer',10,4),
('Thunder',10,4),
('Whatever It takes',10,4);