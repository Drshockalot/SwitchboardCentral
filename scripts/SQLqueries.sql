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