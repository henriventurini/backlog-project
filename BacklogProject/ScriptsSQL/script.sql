CREATE DATABASE backlog_games;

CREATE TABLE users (
    userId int NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    displayName varchar(255) NOT NULL,

    PRIMARY KEY (userId)
); 

CREATE TABLE reviews (
    reviewId int NOT NULL AUTO_INCREMENT,
    hoursPlayed int,
    grade decimal,
    comment text,
    status varchar(255),
    userId int,

    PRIMARY KEY (reviewId),
    FOREIGN KEY (userId) REFERENCES users(userId)
); 

CREATE TABLE games (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    reviewId int,

    PRIMARY KEY (id),
    FOREIGN KEY (reviewId) REFERENCES reviews(reviewId)
); 


