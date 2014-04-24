SwitchboardCentral
===============

TASKS TO DO: 
===============
This section will keep track of all of the things we have left to do for this assignment (which we really need to get cracking on). I'll split it up into sections based on the specification. When you take a piece of work to do, put your name in brackets next to it so the other two can see that you are doing it. When you have done something on it, push it up to git and modify this file and put (review) next to the task on this list, and the other two can go through and check it. 

__Tasks__

--FINAL SYSTEM ERD-- 
  * Final ERD diagram || (CHAD) (REVIEW)
  * Documentation of consolidated changes || (CHAD) (REVIEW)
  
--DATABASE DICTIONARY/SPECIFICATION-- 
  * Database dictionary on word/excel, this needs work || (SHAUN) (REVIEW)
  * Comments explaining purpose of columns/constraints || (SHAUN) (REVIEW)

--DATABASE CREATION SCRIPT--
  * Script made || (CHAD) (REVIEW)
  * Script split into Database creation/data insertion (needed? I think it's a good idea) || (CHAD) (REVIEW)
  * Made sure EVERYTHING is included in the script (sequences/triggers etc.) || (CHAD) (REVIEW)
  * Code commented || (CHAD) (REVIEW)

--DATA LOADING--
  * Data loaded || (CHAD) (REVIEW - I believe all of the data is loaded correctly, but I need you guys to go through it to see if you can find any faults)
  * Script for insertion of data || (CHAD) (REVIEW)
  * Detailed written description of data loading strategy and procedure || (CHAD) (REVIEW)
  * Data mapping document relating source data to database tables/columns || (LUKE?* Not sure if i did this in the data dictionary) (REVIEW - LOOKS GOOD)
  
--DATA TAKE ON TESTING-- 
  * Simple manual checks || (LUKE) (REVIEW - 10/10 A++** would check again "Amazing"-Linux magazine "Greatest manual checks of our time"-IGN "Hot shit"-John Carmack)
  * Sql scripts to check certain aspects (row/column counts? primary key checks? unique checks?) || (LUKE)
  * Sql scripts to run/rerun systematic and comprehensive checks || (LUKE)
  * Outline/detailed description of data loading strategy and proceduere, including the problems encountered and how they where resolved || (CHAD) (REVIEW)

--SQL Queries--
  * Query 1 || (LUKE) (REVIEW)
  * Query 2 || (LUKE) (REVIEW)
  * Query 3 || (CHAD) (REVIEW)
  * Query 4 || (CHAD) (REVIEW)
  * Query 5 || (CHAD) (REVIEW)
  * Queries return valid results || (REVIEW)
  * Output appropriately organised and titled || (REVIEW)
  * Implemented from web-page as prepared statement || (LUKE/SHAUN)
  
As can be seen, if we really want top marks in this assignment it is going to take a lot of work, so we really do need to start blasting into all of the documentation needed. 
  
PROGRESS: LATEST NEWS AT TOP
===============
Updated our tasks, we are getting there in terms of 

If someone could have a look at Query 3 that would be good as im having trouble getting my head around it, Also i have started the data testing sheet which needs looking at. (LUKE)

I have done a page of documentation for the final ERD about the changes that we made to it, I tried to remember the feedback that Jan gave to you guys, but please do review it and add stuff that I have missed, the more the better.
POST TIME: 22:11 - 10/04/2014 (CHAD)

I have buffed up the final ERD, put sensible words on the relationships, added arrows etc etc, you guys need to look at it and say whether or not you are happy with it. I am just in the process of doing the documentation for it right now but that shouldn't take too long and I'll crack on with the data loading documentation. 
POST TIME: 14:16 - 10/04/2014 (CHAD)

All of the data SHOULD be loaded in correctly now, the dates have been sorted into the proper data type and format now so that should be able to be used for the queries. The next step that I will be tackling is to start progressing through all of the documentation that we have to do, starting with the documentation stating the changes that we made with the final ERD. POST TIME: 10:51 - 08/04/2014 (CHAD)

I made a start on the SQL Queries so we dont have to worry about fiddling them out, they just need implimenting onto a webpage when the time comes which should be easy when you see them. (SQLQueries.sql) POST TIME: 15:56 - 07/04/2014 (LUKE)

Made quite a large overhaul on the way that we go around the PC list of the database, I got rid of PCALLOCATION completely, just using LOCATIONID as a foreign key within the PC table. Also, due to new information gained from John from Monday's lecture/help session, the PC table (now called PCALLOCATION) now only had 3 fields (PCID, PCROLE, LOCATIONID). The only part of data loading that should be left is getting around the issue of setting date data types in a couple of the tables. POST TIME: 14:42 - 07/04/2014 (CHAD)

The base constraints are now implemented into the tables of the database, I had to go through and modify a couple fields of the EQUIPMENTALLOCATION table, just because of some misspelt data that didn't get caught in the update statement, which resulted in the EQUIPMENTID field being left blank. Apart from that, any non essential constraints still need to be put in (NOT NULL etc), the data types of each field needs to be looked over and set to something sensible as well. The data dictionary needs to be updated with the new data structure that I made, but I am looking to make a couple more changes over the next couple days so that might not be worth doing yet. I gave you guys permissions on the new set of tables.
POST TIME: 00:33 - 06/04/2014 (CHAD)

To my knowledge and understanding, the data has been loaded correctly. I checked a few things and it seems to be maching up correctly, but I have not tested it very thoroughly. If you guys could do some querying on it to see if it comes up with the right information then it should be fine. The next task will be to get all of the constraints in now so that they are playing together nicely.
POST TIME: 15:12 - 05/04/2014 (CHAD)

The vast majority of the data is loaded into the database now, just panning out what he wants exactly for the assessment criteria, the full data will be loaded within a day or two of this post.
POST TIME: 13:32 - 05/04/2014 (CHAD)


