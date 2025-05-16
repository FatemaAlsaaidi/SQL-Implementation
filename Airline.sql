create database airline
use airline

create table airport
(
airport_code varchar(6) primary key,
city varchar(10) not null,
state varchar(10) not null,
name varchar(10) not null
);
create table flight_leg
(
let_no int not null,
airport_code varchar(6) not null,
number int not null,
secheduled_arr_time time not null,
secheduled_dep_time time not null,
primary key(let_no, airport_code, number)
);

create table airplane_type
(
type_name varchar(10) primary key,
max_seat int not null,
comapny varchar(20) not null
);

create table AirplaneType_Airport
(
airport_code varchar(6) not null, 
type_name varchar(10) not null,
primary key(airport_code, type_name)
);

create table flight
(
number int primary key,
airline varchar(20) not null, 
weekdays int not null
);

create table fare
(
code int not null, 
number int not null,
restrictions varchar(20) not null,
amount decimal (4,2) check(amount<01.00) not null
primary key(code, number)
);

create table airplane 
(
airplane_id int primary key,
type_name varchar(10) not null,
total_no_of_seats int not null
);

create table seat
(
seat_no int not null,
date date not null,
let_no int not null,
airplane_id int not null,
primary key (seat_no,date)
);

create table leg_Instance
(
date date not null,
airport_code varchar(6) not null,
let_no int not null,
airplane_id int not null,
number int not null,
primary key (date, airport_code, let_no)
);

-- foriegn key 

alter table flight_leg
add foreign key (number) references flight(number)

alter table flight_leg
add foreign key (airport_code) references airport(airport_code)

alter table AirplaneType_Airport
add foreign key (airport_code) references airport(airport_code)

alter table AirplaneType_Airport
add foreign key (type_name) references airplane_type(type_name)

alter table fare 
add foreign key(number) references flight(number)

alter table airplane
add foreign key (type_name) references airplane_type(type_name)

-- add column to saet table 
alter table seat
add airport_code varchar(6)

alter table seat
add foreign key (date, airport_code, let_no) references leg_instance(date, airport_code, let_no)

alter table leg_instance
add foreign key (airplane_id) references airplane(airplane_id)

alter table leg_instance
add foreign key (airport_code) references airport(airport_code)

-- add date column to flight_leg table
alter table flight_leg
add date0 date

--ALTER TABLE flight_leg
--DROP COLUMN FlightLeg_Date;

EXEC sp_rename 'leg_instance.date', 'date0', 'COLUMN';
EXEC sp_rename 'seat.date', 'date0', 'COLUMN';


alter table leg_instance
add foreign key (let_no, airport_code, number) references flight_leg(let_no, airport_code,number)


