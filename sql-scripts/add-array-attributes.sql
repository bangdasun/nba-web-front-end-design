-- Add column into player
ALTER TABLE player
ADD honors text[];

-- Insert value into new added column
UPDATE player
SET honors = '{{"FMVP at 2016"},{"MVP at 2012-13"},{"FMVP at 2013"},{"MVP at 2011-12"},{"FMVP at 2012"},{"MVP at 2009-10"},{"MVP at 2008-09"},{"All-Star MVP at 2008"},{"ALL-Star MVP at 2006"},{"ROY at 2003-2004"}}'
WHERE pname = 'LeBron James';

UPDATE player
SET honors = '{{"MVP at 2010-2011"}, {"ROY at 2008-09"}}'
WHERE pname = 'Derrick Rose';

UPDATE player
SET honors = '{{"All-Star MVP at 2014"},{"ROY at 2011-12"}}'
WHERE pname = 'Kyrie Irving';

UPDATE player
SET honors = '{{"DPOY at 2015-16"},{"DPOY at 2014-15"},{"FMVP at 2014"}}'
WHERE pname = 'Kawhi Leonard';

UPDATE player
SET honors = '{{"ROY at 2001-02"}}'
WHERE pname = 'Pau Gasol';

UPDATE player
SET honors = '{{"MIP at 2014-15"}}'
WHERE pname = 'Jimmy Butler';

UPDATE player
SET honors = '{{"MIP at 2012-13"}}'
WHERE pname = 'Paul George';
