-- 1. 
SELECT pname
FROM player
WHERE (drafts).pick = 1;

-- 2.
SELECT array_length(honors, 1) 
FROM player
WHERE pname = 'LeBron James';

-- 3.
SELECT to_tsvector(transac_history) @@ 'heat'
FROM player
WHERE pname = 'LeBron James';
