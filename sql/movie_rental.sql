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
   IMDbID VARCHAR(20),
   Title CHAR(100),
   Year  VARCHAR(15),
   Runtime VARCHAR(10),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating VARCHAR(5) NOT NULL,
   Category VARCHAR(50),
   PRIMARY KEY(MovieID,UserID),
   FOREIGN KEY (UserID) REFERENCES User(UserID)
);


CREATE TABLE WatchedMovies
( WatchedID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UserID INT NOT NULL,
  IMDbID VARCHAR(20) NOT NULL,
  Date DATE NOT NULL,
  Rate VARCHAR(5) NOT NULL,
  PRIMARY KEY(WatchedID,UserID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);




CREATE TABLE HomePageMovies
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime VARCHAR(10),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating VARCHAR(5) NOT NULL,
   Category VARCHAR(50) NOT NULL,
    IMDbID VARCHAR(20) NOT NULL
);

