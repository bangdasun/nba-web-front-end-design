-- SQL statements in part 2
-- @author: bangda sun
-- @date: 3/3/2017
-- Create table Division
CREATE TABLE Division
(
	dname CHAR(20) NOT NULL,
	conference CHAR(10),
	PRIMARY KEY (dname)
);
	
-- Create table Team
CREATE TABLE Team
(
	tname CHAR(20) NOT NULL,
	city CHAR(20),
	num_champ INTEGER,
	PRIMARY KEY (tname)
);
	
-- Create table Player
CREATE TABLE Player
(
	pid CHAR(10) NOT NULL,
	pname CHAR(30),
	tname CHAR(20),
	position CHAR(10),
	height REAL,
	weight REAL,
	birth DATE,
	experience INTEGER,
	critizenship CHAR(20),
	salary REAL,
	PRIMARY KEY (pid)
);
	
-- Create table Game
CREATE TABLE Game
(
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	gtype CHAR(20) NOT NULL,
	PRIMARY KEY (gtype)
);
	
-- Create table Player_Game
CREATE TABLE Play_Game
(
	pid CHAR(10) NOT NULL,
	pname CHAR(30),
	gtype ChAR(20) NOT NULL,
	num_game INTEGER,
	num_game_start INTEGER,
	min_played INTEGER,
	field_goal REAL,
	field_goal_percent REAL,
	three_pt_pg REAL,
	three_pt_percent REAL,
    free_throw_pg REAL,
	free_throw_percent REAL,
    total_rb_pg REAL,
    assist_pg REAL,
	steal_pg REAL,
    block_pg REAL,
    turnover_pg REAL,
    fouls_pg REAL,
    points_pg REAL,
	PRIMARY KEY (pid, gtype),
	FOREIGN KEY (pid) REFERENCES Player
		ON DELETE CASCADE
		ON UPDATE SET DEFAULT,
	FOREIGN KEY (gtype) REFERENCES Game
);

-- Create table Team_Game
CREATE TABLE Team_Game
(
	tname CHAR(20) NOT NULL,
	gtype CHAR(20) NOT NULL,
	num_win INTEGER,
	pts_pg REAL,
	opp_pts_pg REAL,
	PRIMARY KEY (tname, gtype),
	FOREIGN KEY (tname) REFERENCES Team
		ON DELETE CASCADE
		ON UPDATE SET DEFAULT,
	FOREIGN KEY (gtype) REFERENCES Game
);

-- Create table Team_Division
CREATE TABLE Team_Division
(
	tname CHAR(20) NOT NULL,
	dname CHAR(20) NOT NULL, 
	PRIMARY KEY (tname),
	FOREIGN KEY (dname) REFERENCES Division
		ON DELETE CASCADE
		ON UPDATE SET DEFAULT
);
	
