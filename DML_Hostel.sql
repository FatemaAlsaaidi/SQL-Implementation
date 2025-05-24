use hotel
Exec sp_columns branches
-- change the size of name column from 10 to 50
ALTER TABLE branches
ALTER COLUMN name varchar(50);

-- inseart data to branches table 
INSERT INTO branches (branch_id, name, location) VALUES
(1, 'MuscatInn', 'Muscat'),
(2, 'SalalahStay', 'Salalah'),
(3, 'SoharLodge', 'Sohar');

-- inseart data to rooms table
INSERT INTO rooms (room_number, type, nightly_rate, branch_id) VALUES
(101, 'Single', 25, 1),
(102, 'Double', 35, 1),
(201, 'Suite', 60, 2),
(202, 'Single', 30, 2),
(301, 'Double', 40, 3);

-- inseart to customer data
INSERT INTO customer (c_id, name) VALUES
(1, 'Ahmed Al Hinai'),
(2, 'Fatma Al Zadjali'),
(3, 'Salim Al Busaidi');

-- customer_phone table
INSERT INTO customer_phone (c_id, phone) VALUES
(1, '99223344'),
(2, '99887766'),
(3, '91112233');

-- customer_email Table
INSERT INTO customer_email (c_id, email) VALUES
(1, 'ahmed@om'),
(2, 'fatma@om'),
(3, 'salim@om');

-- staff Table
Exec sp_columns staff
-- change the constraints of salary column 
alter table staff
alter column salary decimal (8,4)
-- inseart data to staff table 
INSERT INTO staff (s_id, job_title, salary, branch_id) VALUES
(1, 'Receptionist', 350.00, 1),
(2, 'Manager', 500.00, 2),
(3, 'Cleaner', 330.00, 3);

-- staff_customer_room Table
INSERT INTO staff_customer_room (s_id, c_id, room_number) VALUES
(1, 1, 101),
(2, 2, 201),
(3, 3, 301);


