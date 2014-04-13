/*Query 1*/

select staff.name as staff_name, staff.workphoneno as Work, staff.homephoneno as Home
from staff
inner join location on staff.locationid = location.locationid 
inner join building on location.buildingid = building.buildingid
where building.buildingname = 'Allardyce';

/*Query 2*/

select equipment.name as equipment_name, equipmentallocation.quantity,location.roomno as room_number,location.floor ,location.type as room_type
from equipmentallocation 
inner join equipment on equipmentallocation.equipmentid = equipment.equipmentid 
inner join location on equipmentallocation.locationid = location.locationid 
inner join building on location.buildingid = building.buildingid 
where building.buildingname = 'Devon' and location.roomno is not null and location.currentconfig is not null and equipmentallocation.locationid is not null; 

/*Query 3 needs workin out*/

Select location.type, location.roomno, location.floor, building.buildingname
from location 
inner join building on location.buildingid = building.buildingid 
inner join configuration on location.locationid = configuration.locationid
where building.buildingname = 'Devon' and configuration.rowcapacity >= 10 
and location.locationid = 
(select booking.locationid 
from booking where booking.bookingdate = '04/11/2013' 
and booking.endtime = '12:00'  ) 
group by location.type, location.roomno, location.floor, building.buildingname;

select booking.locationid from booking where booking.bookingdate = '04/11/2013' and booking.endtime = '12:00';