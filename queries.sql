use bmtc;
show tables;
-- bus
-- bus_driver
-- driver
-- passenger
-- route
-- route_stop
-- schedule
-- stop
-- ticket
select * from schedule;
select * from bus;
select * from ticket;
SELECT 
b.bus_number, b.last_maintenance_date as "Bus last maintained on", d.name as "Driver's name",d.contact_info as "Driver's ph no.",
	r.Start_location, r.end_location, 
    s.departure_time, s.arrival_time
from schedule s 
join bus b on s.bus_id = b.bus_id 
join route r on s.route_id = r.route_id
join bus_driver bd on s.bus_id = bd.bus_id
join driver d on d.driver_id = bd.driver_id
;

select * from driver;


