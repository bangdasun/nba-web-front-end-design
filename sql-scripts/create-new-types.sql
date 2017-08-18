-- Stephen Curry
-- Drafted by the Golden State Warriors in the 1st round (7th pick) of the 2009 NBA Draft.
CREATE TYPE DRAFT AS (
	rounds INTEGER,
	pick   INTEGER,
	team   CHAR(30)
);

ALTER TABLE player
ADD drafts DRAFT;

UPDATE player
SET drafts = ROW(1, 1, 'Clevend Cavaliers')
WHERE pname = 'Kyrie Irving';

UPDATE player
SET drafts = ROW(1, 8, 'New York Knicks')
WHERE pname = 'Channing Frye';

UPDATE player
SET drafts = ROW(2, 51, 'New Jersey Nets')
WHERE pname = 'Kyle Korver';

UPDATE player
SET drafts = ROW(1, 17, 'New York Knicks')
WHERE pname = 'Iman Shumpert';

UPDATE player
SET drafts = ROW(1, 4, 'Clevend Cavaliers')
WHERE pname = 'Tristan Thompson';

UPDATE player
SET drafts = ROW(2, 34, 'Utah Jazz')
WHERE pname = 'C.J. Miles';

UPDATE player
SET drafts = ROW(1, 10, 'Indiana Pacers')
WHERE pname = 'Paul George';

UPDATE player
SET drafts = ROW(1, 19, 'Atlanta Hawks')
WHERE pname = 'Jeff Teague';

UPDATE player
SET drafts = ROW(1, 11, 'Indiana Pacers')
WHERE pname = 'Myles Turner';

UPDATE player
SET drafts = ROW(2, 40, 'Golden State Warriors')
WHERE pname = 'Monta Ellis';

UPDATE player
SET drafts = ROW(1, 15, 'Detroit Pistons')
WHERE pname = 'Rodney Stuckey';

UPDATE player
SET drafts = ROW(1, 15, 'Boston Celtics')
WHERE pname = 'Al Jefferson';
