<?php

// Connect to the Oracle database
require('connection.php'); 
$buildingname = "Devon";
$eventStart = "13-oct-04";
$eventEnd = "10-nov-04";
$roomCapacity = 3;
// Specify SQL STATEMENT CONTAINING A BIND VARIABLE  

$query1 = "SELECT LOCATION.LOCATIONID, LOCATION.ROOMNO, LOCATION.TYPE, LOCATION.FLOOR, BUILDING.BUILDINGNAME, CONFIGURATION.CURRENTCONFIG, 
       CONFIGURATION.ISLANDCAPACITY, CONFIGURATION.HORSESHOECAPACITY, CONFIGURATION.ROWCAPACITY
FROM LOCATION
INNER JOIN CONFIGURATION
ON LOCATION.LOCATIONID = CONFIGURATION.LOCATIONID
INNER JOIN BUILDING
ON LOCATION.BUILDINGID = BUILDING.BUILDINGID
WHERE LOCATION.LOCATIONID NOT IN 
( 
  SELECT DISTINCT LOCATIONID 
  FROM BOOKING 
  WHERE 
  (
    (TO_DATE(:User_Input_Event_Start, 'dd-mm-rrrr hh24:mi') BETWEEN EVENTSTART AND EVENTEND) 
      OR 
    (TO_DATE(:User_Input_Event_End, 'dd-mm-rrrr hh24:mi') BETWEEN EVENTSTART AND EVENTEND) 
      OR 
    (TO_DATE(:User_Input_Event_Start, 'dd-mm-rrrr hh24:mi') <= EVENTSTART AND TO_DATE(:User_Input_Event_End, 'dd-mm-rrrr hh24:mi') >= EVENTEND)
  )
)
  AND
BUILDING.BUILDINGNAME = :User_Input_BuildingName
  AND
(
  CONFIGURATION.ROWCAPACITY >= :User_Input_Room_Capacity
    OR
  CONFIGURATION.ISLANDCAPACITY >= :User_Input_Room_Capacity
    OR
  CONFIGURATION.HORSESHOECAPACITY >= :User_Input_Room_Capacity
)
  AND
LOCATION.ROOMNO IS NOT NULL
ORDER BY LOCATION.LOCATIONID";

// Parse the query containing a bind variable.
$stmt = oci_parse($conn, $query1);
 
// Bind the value into the parsed statement.
oci_bind_by_name($stmt, ':user_Input_BuildingName' , $buildingname);
oci_bind_by_name($stmt, ":User_Input_Event_Start" , $eventStart);
oci_bind_by_name($stmt, ":User_Input_Event_End" , $eventEnd);
oci_bind_by_name($stmt, ":User_Input_Room_Capacity" , $roomCapacity);
 
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