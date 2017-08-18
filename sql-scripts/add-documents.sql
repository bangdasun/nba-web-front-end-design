ALTER TABLE player
ADD transac_history VARCHAR;

UPDATE player
SET transac_history = '2016: from Bulls to Knicks'
WHERE pname = 'Derrick Rose';

UPDATE player
SET transac_history = '2010: from Cavaliers to Heat; 2014: from Heat to Cavaliers'
WHERE pname = 'LeBron James';

UPDATE player
SET transac_history = '2001: from Hawks to Grizzlies; 2008: from Grizzlies to Lakers; 2014: from Lakers to Bulls; 2016: from Bulls to Spurs'
WHERE pname = 'Pau Gasol';
