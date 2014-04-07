DELETE FROM PCALLOCATION;

INSERT INTO PCALLOCATION (PCID) SELECT PCID FROM PC;

UPDATE PCALLOCATION
SET LOCATIONID = (
SELECT  LOCATIONID
FROM LOCATION
INNER JOIN PC
ON LOCATION.ROOMNO = PC.ROOMNO
WHERE LOCATION.ROOMNO = PC.ROOMNO );

UPDATE PCALLOCATION
SET ROOMNAME = (
SELECT ROOMNAME
FROM PC
WHERE PCALLOCATION.PCID = PC.PCID);

UPDATE PCALLOCATION
SET LOCATIONID = (
SELECT LOCATIONID
FROM LOCATION
WHERE LOCATION.ROOMNO = PCALLOCATION.ROOMNO AND LOCATION.FLOOR = PCALLOCATION.FLOOR AND LOCATION.TYPE = PCALLOCATION.ROOMNAME);

commit;

UPDATE EVENTBOOKING
SET LOCATIONID = (
SELECT LOCATIONID
FROM LOCATION
WHERE LOCATION.BUILDINGNAME = EVENTBOOKING.BUILDING AND LOCATION.ROOMNO = EVENTBOOKING.ROOM);

UPDATE STAFF
SET LOCATIONID = (
SELECT LOCATIONID
FROM LOCATION
WHERE LOCATION.ROOMNO = STAFF.ROOM);

UPDATE EVENTBOOKING
SET STAFFID = (
SELECT STAFFID 
FROM STAFF
WHERE EVENTBOOKING.ORGANISER = STAFF.NAME);

UPDATE EVENT
SET STAFFID = (
SELECT STAFFID
FROM STAFF 
WHERE EVENT.ORGANISER = STAFF.NAME);

UPDATE BOOKING 
SET LOCATIONID = (
SELECT LOCATIONID
FROM EVENTBOOKING
WHERE EVENTBOOKING.STARTIME = BOOKING.STARTTIME AND EVENTBOOKING.ENDTIME = BOOKING.ENDTIME AND EVENTBOOKING.BOOKINGDATE = BOOKING.BOOKINGDATE);

UPDATE EVENTBOOKING
SET EVENTBOOKINGID = (
SELECT EVENTID
FROM EVENT
WHERE EVENTBOOKING.STAFFID = EVENT.STAFFID AND EVENTBOOKING.PURPOSE = EVENT.EVENTPURPOSE);

UPDATE LOCATION
SET BUILDINGID = (
SELECT BUILDINGID
FROM BUILDING
WHERE LOCATION.BUILDINGNAME = BUILDING.BUILDINGNAME);

SELECT * FROM EQUIPMENTALLOCATION WHERE EQUIPMENTID = null;

DELETE FROM CONFIGURATION;