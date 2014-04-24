<?php

// Connect to the Oracle database
require('connection.php'); 
$buildingname = "Devon";
// Specify SQL STATEMENT CONTAINING A BIND VARIABLE  

$query1 = "SELECT EQUIPMENT.NAME AS EQUIPMENT_NAME, EQUIPMENTALLOCATION.QUANTITY, LOCATION.ROOMNO AS ROOM_NUMBER, LOCATION.FLOOR, LOCATION.TYPE AS ROOM_TYPE
FROM EQUIPMENTALLOCATION
INNER JOIN EQUIPMENT
ON EQUIPMENTALLOCATION.EQUIPMENTID = EQUIPMENT.EQUIPMENTID
INNER JOIN LOCATION 
ON EQUIPMENTALLOCATION.LOCATIONID = LOCATION.LOCATIONID
INNER JOIN BUILDING
ON LOCATION.BUILDINGID = BUILDING.BUILDINGID
WHERE BUILDING.BUILDINGNAME = :User_Input_BuildingName
        AND
      LOCATION.ROOMNO IS NOT NULL
        AND
      LOCATION.CURRENTCONFIG IS NOT NULL
        AND
      EQUIPMENTALLOCATION.LOCATIONID IS NOT NULL";

// Parse the query containing a bind variable.
$stmt = oci_parse($conn, $query1);
 
// Bind the value into the parsed statement.
oci_bind_by_name($stmt, ':user_Input_BuildingName', $buildingname);
 
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