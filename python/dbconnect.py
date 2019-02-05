import sqlite3 as sqlite
import sys

dbfilename = '/Users/marcusjackson/Projects/ljconsole/db/test.sqlite'
scriptfilename = 'sql/schema.sql'

print "\nOpening DB"
connection = sqlite.connect(dbfilename)
cursor = connection.cursor()

print "Reading Script..."
scriptFile = open(scriptfilename, 'r')
script = scriptFile.read()
scriptFile.close()

print "Running Script..."
cursor.executescript(script)

connection.commit()
print "Changes successfully committed\n"                
   
connection.close()
print "\nClosing DB"