DROP DATABASE IF EXISTS movie_hunter;
CREATE DATABASE movie_hunter;
USE movie_hunter;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS WatchedMovies;
DROP TABLE IF EXISTS MyMovies;
CREATE TABLE User
( UserID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Password TEXT(1024) NOT NULL,
  Email CHAR(100) not null,
  First_Name CHAR(30) not null,
  Last_Name CHAR(30) not null,
  Birthday DATE 
);

CREATE TABLE WatchedMovies
( WatchedID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  MovieID INT UNSIGNED NOT NULL,
  Date DATE NOT NULL,
  Rate FLOAT
);

CREATE TABLE MyMovies
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime INT(3),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024)
   
);

