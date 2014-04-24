<?php 

$sql= "SELECT STAFF.NAME AS STAFF_NAME, STAFF.WORKPHONENO AS WORK_PHONE, STAFF.HOMEPHONENO AS HOME_PHONE FROM STAFF INNER JOIN LOCATION 
ON STAFF.LOCATIONID = LOCATION.LOCATIONID
INNER JOIN BUILDING
ON LOCATION.BUILDINGID = BUILDING.BUILDINGID
WHERE BUILDING.BUILDINGNAME = :User_Input_BuildingName"; 
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':user_Input_BuildingName', $buildingname, PDO::PARAM_STR); 
$stmt->execute();
$result = $stmt->fetchAll();

echo "STAFF_NAME" + "/t" + "WORK_PHONE" + "/t" + "HOME_PHONE";
foreach($result as $row){
    echo $row['STAFF_NAME'] + "/t" + $row['WORK_PHONE'] + "/t" + $row['HOME_PHONE'];
}
?>