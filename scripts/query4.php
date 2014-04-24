<?php

// Connect to the Oracle database
require('connection.php'); 
$organiser = "Dave Whitburn";
$eventname = "queryevent";
$eventpurpose = "queryeventpurpose";
// Specify SQL STATEMENT CONTAINING A BIND VARIABLE  

$query1 = "INSERT INTO EVENT (EVENTNAME, EVENTPURPOSE, STAFFID)
VALUES (:User_Input_EventName, :User_Input_EventPurpose, (SELECT STAFFID 
                                          FROM STAFF 
                                          WHERE STAFF.NAME = :User_Input_Organiser));";

// Parse the query containing a bind variable.
$stmt = oci_parse($conn, $query1);
 
// Bind the value into the parsed statement.
oci_bind_by_name($stmt, ':User_Input_EventName', $eventname);
oci_bind_by_name($stmt, ':User_Input_EventPurpose', $eventpurpose);
oci_bind_by_name($stmt, ':User_Input_Organiser', $organiser);


 
// Execute the completed statement.
oci_execute($stmt);
 
echo "<table border='1' cellpadding='5'>\n";
while ($row = oci_fetch_array($stmt, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>\n";
    foreach ($row as $item) {
        echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
    }
    echo "</tr>\n";
}
echo "</table>\n";

// Release the statement variable and close the connection
oci_free_statement($stmt);
oci_close($conn);

// Show the SQL
echo '<p>SQL statement executed was: </br>'.$query1.'</p>';
?>