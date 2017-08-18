-- Three queries in part 2
-- 1. Find 16 teams which are able to enter playoffs. (top 8 from each conference)
-- Print the team name, their division and conference

SELECT temp2.*
FROM
(
    SELECT tg.tname, temp.dname, temp.conference, tg.num_win AS num_win
    FROM 
    (
        SELECT td.tname, td.dname, d.conference
        FROM
           division d JOIN team_division td ON d.dname = td.dname
        GROUP BY td.tname, td.dname, d.conference
    ) temp
    JOIN team_game tg ON tg.tname = temp.tname
    ) temp2
WHERE (SELECT COUNT(*) FROM
        (
            SELECT tg.tname, temp.dname, temp.conference, tg.num_win AS num_win
            FROM 
            (
                SELECT td.tname, td.dname, d.conference
                FROM
                   division d JOIN team_division td ON d.dname = td.dname
                GROUP BY td.tname, td.dname, d.conference
            ) temp
            JOIN team_game tg ON tg.tname = temp.tname
        ) temp3
        WHERE temp2.conference = temp3.conference AND temp3.num_win > temp2.num_win) < 8
ORDER BY temp2.conference, temp2.num_win DESC

-- 2. Find five best offensive (highest point per game) bench player (not as the start in the game)
-- Define that the start rate should be lower than 5% and at least play for 50 games as non-start
-- Print the name, team and points per game
SELECT pg.pname, p.tname, pg.points_pg
FROM play_game pg JOIN player p ON pg.pid = p.pid
WHERE
(num_game_start * 1.0 / num_game) < 0.05 AND (num_game - num_game_start) > 50
ORDER BY pg.points_pg DESC
LIMIT 5

-- 3. Find the most valuable international player
-- with relatively highest points per game but relatively lower salary
-- Print the name, critizenship, team, points per game and salary
SELECT p.pname, p.critizenship, p.tname, pg.points_pg, p.salary
FROM play_game pg JOIN player p ON pg.pid = p.pid 
WHERE p.critizenship <> 'US'
ORDER BY pg.points_pg / p.salary * 1.0 DESC
LIMIT 1

