"""
Columbia COMS W4111 Introduction to Databases
Project 1 - 3
Revise version from Example Webserver
@author: bangda sun
@date: 3/29/2017

To run locally:

    python server.py

Go to http://localhost:8111 in your browser.

A debugger such as "pdb" may be helpful for debugging.
Read about it online.
"""

import os
from sqlalchemy import *
from sqlalchemy.pool import NullPool
from flask import Flask, request, render_template, g, redirect, Response
import numpy as np

tmpl_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
app = Flask(__name__, template_folder = tmpl_dir)

# Database URI: The URI should be in the format of: 
#
#     postgresql://USER:PASSWORD@104.196.18.7/w4111
#
# For example, if you had username bs2996 and password 6992, then the following line would be:
DATABASEURI = "postgresql://bs2996:6992@104.196.18.7/w4111"

# Creates a database engine that knows how to connect to the URI above.
engine = create_engine(DATABASEURI)

@app.before_request
def before_request():
	"""
	This function is run at the beginning of every web request 
	(every time you enter an address in the web browser).
	We use it to setup a database connection that can be used throughout the request.

	The variable g is globally accessible.
	"""
	try:
		g.conn = engine.connect()
	except:
		print "uh oh, problem connecting to database"
		import traceback; traceback.print_exc()
		g.conn = None

@app.teardown_request
def teardown_request(exception):
	"""
	At the end of the web request, this makes sure to close the database connection.
	If you don't, the database could run out of memory!
	"""
	try:
		g.conn.close()
	except Exception as e:
		pass


# @app.route is a decorator around index() that means:
#   run index() whenever the user tries to access the "/" path using a GET request
#
# If you wanted the user to go to, for example, localhost:8111/foobar/ with POST or GET then you could use:
#
#       @app.route("/foobar/", methods=["POST", "GET"])
#
# PROTIP: (the trailing / in the path is important)
# 
# see for routing: http://flask.pocoo.org/docs/0.10/quickstart/#routing
# see for decorators: http://simeonfranklin.com/blog/2012/jul/1/python-decorators-in-12-steps/
@app.route('/')
def index():
	"""
	request is a special object that Flask provides to access web request information:

	request.method:   "GET" or "POST"	
	request.form:     if the browser submitted a form, this contains the data in the form
	request.args:     dictionary of URL arguments, e.g., {a:1, b:2} for http://localhost?a=1&b=2

	See its API: http://flask.pocoo.org/docs/0.10/api/#incoming-request-data
	"""

	# DEBUG: this is debugging code to see what request looks like
	print request.args
	
	# Query players with highest points per game
	cursor = g.conn.execute("SELECT pname, points_pg FROM play_game \
							ORDER BY points_pg DESC LIMIT 1;")
	record = cursor.fetchone()
	cursor.close()
	
	# Query players with highest rebounds per game
	cursor2 = g.conn.execute("SELECT pname, total_rb_pg FROM play_game \
							ORDER BY total_rb_pg DESC LIMIT 1")
	record2 = cursor2.fetchone()
	cursor2.close()
	
	# Query players with highest assists per game
	cursor3 = g.conn.execute("SELECT pname, assist_pg FROM play_game \
							ORDER BY assist_pg DESC LIMIT 1")
	record3 = cursor3.fetchone()
	cursor3.close()
	
	# Query players with highest steals per game
	cursor4 = g.conn.execute("SELECT pname, steal_pg FROM play_game \
							ORDER BY steal_pg DESC LIMIT 1")
	record4 = cursor4.fetchone()
	cursor4.close()
	
	# Query players with highest blocks per game
	cursor5 = g.conn.execute("SELECT pname, block_pg FROM play_game \
							ORDER BY block_pg DESC LIMIT 1")
	record5 = cursor5.fetchone()
	cursor5.close()
	
	#
	# Flask uses Jinja templates, which is an extension to HTML where you can
	# pass data to a template and dynamically generate HTML based on the data
	# (you can think of it as simple PHP)
	# documentation: https://realpython.com/blog/python/primer-on-jinja-templating/
	#
	# You can see an example template in templates/index.html
	#
	# context are the variables that are passed to the template.
	# for example, "data" key in the context variable defined below will be 
	# accessible as a variable in index.html:
	#
	#     # will print: [u'grace hopper', u'alan turing', u'ada lovelace']
	#	     <div>{{data}}</div>
	#	     
	#     # creates a <div> tag for each element in data
	#     # will print: 
	#     #
	#     #   <div>grace hopper</div>
	#     #   <div>alan turing</div>
	#     #   <div>ada lovelace</div>
	#     #
	#     {% for n in data %}
	#     <div>{{n}}</div>
	#     {% endfor %}
	#

	context = dict(data = record, data2 = record2, data3 = record3, data4 = record4, data5 = record5) 
	return render_template("index.html", **context)
 
# Query team based on provided division name
@app.route('/team_query', methods=['POST'])
def team_query():
	division = request.form['name']
	cursor = g.conn.execute("SELECT t.tname, t.city FROM team_division td JOIN team t \
							ON td.tname = t.tname WHERE dname = " \
							+ "'" + str(division) + "'" + " ORDER BY t.tname")
	tnames = []
	cities = []
	for result in cursor:
		tnames.append(result[0])  
		cities.append(result[1])
	cursor.close()
	data = np.array([tnames, cities])
	context = dict(data = data.T, division = division)
	return render_template('team_query.html', **context)

# Query player based on provided player name
@app.route('/player_query', methods=['POST'])
def player_query():
	player = request.form['name']
	cursor = g.conn.execute("SELECt tname, position, height, weight, critizenship, \
							points_pg, total_rb_pg, assist_pg, steal_pg, block_pg, fouls_pg \
							FROM player p JOIN play_game pg ON p.pname = pg.pname \
							WHERE p.pname = "\
							+ "'" + str(player) + "'")
	result = cursor.fetchone()
	cursor.close()
	context = dict(data = result, player = player)
	return render_template('player_query.html', **context)

@app.route('/login')
def login():
    abort(401)
    this_is_never_executed()
	
if __name__ == "__main__":
	import click

@click.command()
@click.option('--debug', is_flag=True)
@click.option('--threaded', is_flag=True)
@click.argument('HOST', default='0.0.0.0')
@click.argument('PORT', default=8111, type=int)
def run(debug, threaded, host, port):
	"""
	This function handles command line parameters.
	Run the server using:

    python server.py

	Show the help text using:

    python server.py --help

	"""
	HOST, PORT = host, port
	print "running on %s:%d" % (HOST, PORT)
	app.run(host=HOST, port=PORT, debug=debug, threaded=threaded)

run()