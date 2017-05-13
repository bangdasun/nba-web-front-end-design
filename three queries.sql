SELECT pname
FROM player
WHERE (drafts).pick = 1;

SELECT array_length(honors, 1) 
FROM player
WHERE pname = 'LeBron James';

SELECT to_tsvector(transac_history) @@ 'heat'
FROM player
WHERE pname = 'LeBron James';
