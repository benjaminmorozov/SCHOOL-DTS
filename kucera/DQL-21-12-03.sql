--Select vyberie informacie o Skladbe a autorovi a spojí ich na základe názvu autora

SELECT Authors.id, Authors.name, Authors.surname, Songs.authorID, Songs.song_name
FROM Authors
INNER JOIN Songs
ON Authors.id = Songs.authorID

--Select vyberie informacie o Skladbe a albume a spojí ich na základe názvu albumu

SELECT Songs.albumID, Songs.song_name, Albums.id, Albums.album_name
From Albums
INNER JOIN Songs
ON Songs.albumID = Albums.id
