-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Drop tournament database if exists
DROP DATABASE IF EXISTS tournament;

-- Create tournament database
CREATE DATABASE tournament;

-- Connect to tournament database in the command line
\c tournament;

-- Create the players table

CREATE TABLE players (id SERIAL PRIMARY KEY, name TEXT, wins INTEGER,
    losses INTEGER, matches INTEGER);

-- Create the matches table

CREATE TABLE matches (playerA INTEGER REFERENCES players(id), playerB INTEGER 
	REFERENCES players(id), PRIMARY KEY (playerA, playerB));
                                    


