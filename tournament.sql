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
CREATE TABLE players (id SERIAL PRIMARY KEY, name TEXT);

-- Create the matches table
CREATE TABLE matches (winner INTEGER REFERENCES players(id), 
	loser INTEGER REFERENCES players(id), PRIMARY KEY (winner, loser));

-- Create a table of wins
CREATE VIEW winstable AS SELECT players.id, players.name, count(matches.winner) 
    as wins from players LEFT JOIN matches on players.id = matches.winner 
    group by players.id;

-- Creates a table of loses
CREATE VIEW losestable AS SELECT players.id, count(matches.loser) 
    as loses from players LEFT JOIN matches on players.id = matches.loser 
    group by players.id;
                                    


