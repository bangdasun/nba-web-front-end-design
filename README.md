### Summary

This is an web-front-end application consists of a web server implemented by flask in python and several web pages. The database is deployed on google cloud platform.

Application details:

(1) Design NBA 2015-2016 season player - team - game information database, using E/R diagram to visualize 4 entities and 3 relations;

(2) Created data tables and inserted values using SQL, built the database using postgreSQL and deployed it on Google Cloud Platform;

(3) Developed web front-end application using flask in Python which enables users to search division, team information and player statistics using HTML drop down, etc;

(4) Data is from http://www.basketball-reference.com/.

NOTE: there are still some improvement can be done to capture the situations about exception.

To run the application, type in terminal or windows cmd line:

  `python server.py`
 
The application will run locally on http://localhost:8111/

### Description of web pages

1. Division information queries

Implemented by selecting division name from a menu, then click the "submit" at 
the right hand side of the menu, the web page will redirect to a page which show 
the information of that division include the teams  belong to that division and their 
locations.

2. Team information queries

Implemented by typing the name of the team into a text box, then click "submit"
at the right hand side of the text box, the web page will redirect to a page which 
show the player information at that team.

3. Player person information and season statistics queries

Implemented by typing the name of the player into a text box, then click the "submit"
at the right hand side of the text box, the web page will redirect to a page which 
show the personal information of player, includes: the team he belongs to, his position,
his weight, height and critizenship, as well as his data in this season: points, rebounds,
assists, steals, blocks and fouls (season average)

4. Player queries based on personal information and statistics

Implemented by typing the points and rebounds requirements into a text box, then click
the "submit" at the right hand side of the text box, the web page will redirect to a page which
show the players that satisfy the requirment.
