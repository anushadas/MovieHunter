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
  Birthday DATE 
);


CREATE TABLE MyMovies
(  MovieID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Title CHAR(100),
   Year  YEAR(4),
   Runtime INT(3),
   Genre TEXT(60),
   Plot TEXT(2000),
   Poster VARCHAR(1024),
   Rating FLOAT(3,1) NOT NULL
);


CREATE TABLE WatchedMovies
( RentID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  MovieID INT UNSIGNED NOT NULL,
  Date DATE NOT NULL,
  UserRate FLOAT(3,1) NOT NULL,

  FOREIGN KEY (MovieID) REFERENCES MyMovies(MovieID)

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

