<?php

// Connect to the Oracle database
require('connection.php'); 
$eventorganiser = "Dave Whitburn";
$eventname = "queryevent";
$eventpurpose = "queryeventpurpose";
// Specify SQL STATEMENT CONTAINING A BIND VARIABLE  

$query1 = "INSERT INTO EVENT (EVENTNAME, EVENTPURPOSE, STAFFID)
VALUES (:User_Input_EventName, :User_Input_EventPurpose, (SELECT STAFFID FROM STAFF WHERE STAFF.NAME = :User_Input_Organiser))";

// Parse the query containing a bind variable.
$stmt = oci_parse($conn, $query1);
 
// Bind the value into the parsed statement.
oci_bind_by_name($stmt, ':User_Input_Organiser', $eventorganiser);
oci_bind_by_name($stmt, ':User_Input_EventName', $eventname);
oci_bind_by_name($stmt, ':User_Input_EventPurpose', $eventpurpose);



 
// Execute the completed statement.
oci_execute($stmt);
 
// Release the statement variable and close the connection
oci_free_statement($stmt);
oci_close($conn);

// Show the SQL
echo '<p>SQL statement executed was: </br>'.$query1.'</p>';
?>