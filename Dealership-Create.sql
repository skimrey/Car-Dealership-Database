CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY key,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE car(
	serial_number integer PRIMARY KEY,
	make VARCHAR(150),
	model VARCHAR(150)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY key,
	salesperson_id integer,
	serial_number integer,
	FOREIGN key (salesperson_id) REFERENCES salesperson (salesperson_id),
	foreign key (serial_number) references car (serial_number)
);

CREATE TABLE customer(
	visit_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	serial_number integer,
	FOREIGN key (serial_number) REFERENCES car (serial_number)
);

CREATE TABLE service_ticket(
	service_id SERIAL PRIMARY key,
	issue VARCHAR(150),
	visit_id integer,
	foreign key (visit_id) references customer (visit_id)
);

CREATE TABLE parts(
	part VARCHAR(150) PRIMARY KEY
);

CREATE TABLE mechanic(
	repair_id SERIAL primary key,
	service_id integer,
	part VARCHAR(150),
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	foreign key (service_id) references service_ticket (service_id),
	foreign key (part) references parts (part)
);

