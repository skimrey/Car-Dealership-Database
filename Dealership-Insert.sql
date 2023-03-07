insert into salesperson(salesperson_id, first_name, last_name)
values
	(default, 'John', 'Mohammed'),
	(default, 'Esme', 'Johnson'),
	(default, 'Rebecca', 'Clark'),
	(default, 'Boris', 'Torbalt'),
	(default, 'Persephone', 'Amadeus');

insert into car(serial_number, make, model)
values
	(123456,'Ford','Explorer'),
	(987654,'Subaru','Outback'),
	(243156,'Honda','Odyssey'),
	(956482,'Chevrolet','Volt'),
	(695842,'Jeep','Wrangler'),
	(124321,'Toyota','Prius');

INSERT INTO invoice (invoice_id, salesperson_id, serial_number)
VALUES
    (default, 1, 124321),
    (default, 3, 987654),
    (default, 4, 243156),
    (default, 2, 956482),
    (default, 5, 695842),
    (default, 1, 124321);
   
insert into customer (visit_id, serial_number, first_name, last_name)
values
	(default, 124321, 'Doug', 'Alexander'),
	(default, 987654, 'Doug', 'Alexander'),
	(default, 243156, 'Evelyn', 'Gerald'),
	(default, 123456, 'Diane', 'Haverford'),
	(default, 956482, 'Evelyn', 'Gerald');

INSERT INTO service_ticket (service_id, issue, visit_id) 
values
    (default, 'brakes worn', 1),
    (default, 'rear ended', 1),
    (default, 'fender bender', 4),
    (default, 'brakes worn', 2),
    (default, 'will not start', 3);
   
insert into parts (part)
values 
	('brake pads'),
	('carburetor'),
	('spark plug'),
	('front bumper'),
	('rear bumper');
	
insert into mechanic (repair_id, service_id, part, first_name, last_name)
values 
	(default, 2, 'rear bumper', 'Edgar', 'Winter'),
	(default, 1, 'brake pads', 'Buddy', 'Guy'),
	(default, 3, 'front bumper', 'Edgar', 'Winter'),
	(default, 5, 'spark plug', 'Buddy', 'Guy'),
	(default, 4, 'brake pads', 'Buddy', 'Guy'),
	(default, 4, 'brake pads', 'Eddy', 'Clarke');

CREATE OR REPLACE FUNCTION add_part(_part VARCHAR(150))
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO parts(part)
	VALUES	
		(_part);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_part('tires');

CREATE OR REPLACE FUNCTION add_car(_serial_number integer, _make VARCHAR(150), _model VARCHAR(150))
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO car(serial_number, make, model)
	VALUES	
		(_serial_number, _make, _model);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(531249, 'Nissan', 'Leaf');

select * from salesperson;
select * from invoice;
select * from car;
select * from customer;
select * from service_ticket;
select * from mechanic;
select * from parts;