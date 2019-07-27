DROP DATABASE IF EXISTS movie_hunter;
CREATE DATABASE movie_hunter;
USE movie_hunter;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS WatchedMovies;
DROP TABLE IF EXISTS MyMovies;
DROP TABLE IF EXISTS TopRated;
DROP TABLE IF EXISTS LatestTrailers;

CREATE TABLE User
( UserID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Password TEXT(1024) NOT NULL,
  Email CHAR(100) not null,
  First_Name CHAR(30) not null,
  Last_Name CHAR(30) not null,
  Birthday DATE,
  UNIQUE KEY unique_email (Email)
);


CREATE TABLE MyMovies
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   UserID INT NOT NULL,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime INT(3),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating FLOAT(3,1) NOT NULL,
   Category VARCHAR(50),
   PRIMARY KEY(MovieID,UserID),
   FOREIGN KEY (UserID) REFERENCES User(UserID)
);


CREATE TABLE WatchedMovies
( RentID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UserID INT NOT NULL,
  MovieID INT UNSIGNED NOT NULL,
  Date DATE NOT NULL,
  UserRate FLOAT(3,1) NOT NULL,
  PRIMARY KEY(RentID,UserID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)

);



CREATE TABLE LatestTrailers
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime INT(3),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating FLOAT(3,1) NOT NULL
   
);
CREATE TABLE TopRated
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime INT(3),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating FLOAT(3,1) NOT NULL
   
);

