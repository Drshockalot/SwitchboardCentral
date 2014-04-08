SwitchboardCentral
===============

Database Assignment

PROGRESS: LATEST NEWS AT TOP
===============
All of the data SHOULD be loaded in correctly now, the dates have been sorted into the proper data type and format now so that should be able to be used for the queries. The next step that I will be tackling is to start progressing through all of the documentation that we have to do, starting with the documentation stating the changes that we made with the final ERD. POST TIME: 10:51 - 08/04/2014 (CHAD)

I made a start on the SQL Queries so we dont have to worry about fiddling them out, they just need implimenting onto a webpage when the time comes which should be easy when you see them. (SQLQueries.sql) POST TIME: 15:56 - 07/04/2014 (LUKE)

Made quite a large overhaul on the way that we go around the PC list of the database, I got rid of PCALLOCATION completely, just using LOCATIONID as a foreign key within the PC table. Also, due to new information gained from John from Monday's lecture/help session, the PC table (now called PCALLOCATION) now only had 3 fields (PCID, PCROLE, LOCATIONID). The only part of data loading that should be left is getting around the issue of setting date data types in a couple of the tables. POST TIME: 14:42 - 07/04/2014 (CHAD)

The base constraints are now implemented into the tables of the database, I had to go through and modify a couple fields of the EQUIPMENTALLOCATION table, just because of some misspelt data that didn't get caught in the update statement, which resulted in the EQUIPMENTID field being left blank. Apart from that, any non essential constraints still need to be put in (NOT NULL etc), the data types of each field needs to be looked over and set to something sensible as well. The data dictionary needs to be updated with the new data structure that I made, but I am looking to make a couple more changes over the next couple days so that might not be worth doing yet. I gave you guys permissions on the new set of tables.
POST TIME: 00:33 - 06/04/2014 (CHAD)

To my knowledge and understanding, the data has been loaded correctly. I checked a few things and it seems to be maching up correctly, but I have not tested it very thoroughly. If you guys could do some querying on it to see if it comes up with the right information then it should be fine. The next task will be to get all of the constraints in now so that they are playing together nicely.
POST TIME: 15:12 - 05/04/2014 (CHAD)

The vast majority of the data is loaded into the database now, just panning out what he wants exactly for the assessment criteria, the full data will be loaded within a day or two of this post.
POST TIME: 13:32 - 05/04/2014 (CHAD)


