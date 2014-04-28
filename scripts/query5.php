<?php

// Connect to the Oracle database
require('connection.php'); 
$roomno = "AG01";
$eventname = "queryevent";
$eventstart = "24-JUN-2014";
$eventend = "24-JUN-2014";
// Specify SQL STATEMENT CONTAINING A BIND VARIABLE  

$query1 = "INSERT INTO BOOKING (LOCATIONID, EVENTID, EVENTSTART, EVENTEND)
VALUES ((SELECT LOCATIONID
         FROM LOCATION
         WHERE ROOMNO = :User_Input_RoomNo), (SELECT EVENTID
                                              FROM EVENT
                                              WHERE EVENTNAME = :User_Input_EventName), :User_Input_EventStart, :User_Input_EventEnd)";

// Parse the query containing a bind variable.
$stmt = oci_parse($conn, $query1);
 
// Bind the value into the parsed statement.
oci_bind_by_name($stmt, ':User_Input_RoomNo', $roomno);
oci_bind_by_name($stmt, ':User_Input_EventName', $eventname);
oci_bind_by_name($stmt, ':User_Input_EventStart', $eventstart);
oci_bind_by_name($stmt, ':User_Input_EventEnd', $eventend);



 
// Execute the completed statement.
oci_execute($stmt);
 
// Release the statement variable and close the connection
oci_free_statement($stmt);
oci_close($conn);

// Show the SQL
echo '<p>SQL statement executed was: </br>'.$query1.'</p>';
?>