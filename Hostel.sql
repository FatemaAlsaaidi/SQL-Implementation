create database hotel; 

use hotel;
-- branch
create table branches
(
branch_id int primary key,
name varchar(10) not null,
location varchar(10) not null
);

-- rooms 
create table rooms 
(
room_nymber int primary key,
type varchar(20) not null,
nightly_rate int not null,
);

-- customer
create table customer
(
c_id int primary key,
name varchar(30) not null
);

-- customer_phone
create table customer_phone 
(
c_id int not null,
phone varchar(8) not null,
primary key (c_id,phone)
);

-- customer_email
create table customer_email 
(
c_id int not null,
email varchar(8) not null
primary key(c_id, email)
);

-- staff
create table staff
(
s_id int primary key,
job_title varchar(20) not null,
salary decimal(4,2) check (salary >320) not null,
branch_id int not null
);

create table staff_customer_room
(
s_id int not null,
c_id int not null,
room_number int not null,
primary key(s_id,c_id, room_number)
);

-- foriegn key 
-- for add column to the room table 
alter table rooms
add branch_id int not null
alter table rooms
add foreign key(branch_id) references branches(branch_id)

alter table customer_phone
add foreign key (c_id) references customer(c_id)

alter table customer_email
add foreign key (c_id) references customer(c_id)

alter table staff 
add foreign key (branch_id) references branches(branch_id)

alter table staff_customer_room 
add foreign key (s_id) references staff(s_id)

alter table staff_customer_room 
add foreign key (c_id) references customer(c_id)

EXEC sp_rename 'rooms.room_nymber', 'room_number', 'COLUMN';
alter table staff_customer_room 
add foreign key (room_number) references rooms(room_number)


