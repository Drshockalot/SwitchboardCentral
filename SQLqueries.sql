/*Query 1*/
select staff.workphoneno, staff.homephoneno, staff.name 
from staff 
inner join location on staff.locationid = location.locationid 
inner join building on location.buildingid = building.buildingid
where building.buildingname = 'Allardyce';
/*Query 2*/
select equipment.name, equipmentallocation.quantity, location.roomno, location.floor 
from equipmentallocation 
inner join equipment on equipmentallocation.equipmentid = equipment.equipmentid 
inner join location on equipmentallocation.locationid = location.locationid 
inner join building on location.buildingid = building.buildingid 
where building.buildingname = 'Devon'; 