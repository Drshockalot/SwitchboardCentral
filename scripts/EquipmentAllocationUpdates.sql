UPDATE EQUIPMENTALLOCATION
SET EQUIPMENTID = (
SELECT  EQUIPMENTID
FROM EQUIPMENT
WHERE EQUIPMENT.TYPE = EQUIPMENTALLOCATION.TYPE );