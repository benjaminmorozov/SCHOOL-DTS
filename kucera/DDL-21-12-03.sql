CREATE DATABASE Marek_Kucera;
USE Marek_Kucera;
 
 -- vytvorenie tabulky autorov

CREATE TABLE `Authors`
(
    'author_id' int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'name' VARCHAR NOT NULL,
    'surname' VARCHAR NOT NULL

);

-- vytvorenie tabulky albumov

CREATE TABLE `Albums`
(
    'album_id' int NOT NULL UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    'album_name' VARCHAR NOT NULL,
    'authorID' int NOT NULL,
    FOREIGN KEY (authorID) REFERENCES Authors(author_id)
);

-- vytvorenie tabulky piesni

CREATE TABLE `Songs`
(
    'song_id'int NOT NULL UNSIGNED AUTO_INCREMENT,
    'Song_name' VARCHAR NOT NULL,
    'albumID' int NOT NULL,
    'authorID' int NOT NULL,
    FOREIGN KEY (albumID) REFERENCES Albums(album_id), 
    FOREIGN KEY (authorID) REFERENCES Authors(author_id)
);

CREATE TABLE `albumID_songID`
( 
    'albumID' int UNSIGNED NOT NULL,
    'songID' int USIGNED NOT NULL,
    PRIMARY KEY (albumID, songID),
    FOREIGN KEY (albumID) REFERENCES Albums(album_id),
    FOREIGN KEY (songID) REFERENCES Songs(song_id)
);
