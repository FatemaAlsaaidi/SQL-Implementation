use airline
INSERT INTO airport (airport_code,city, state, name) VALUES  
('JFK', 'NewYork', 'NY', 'Kennedy'),
('LAX', 'LosAngeles', 'CA', 'LAXMain'),
('ORD', 'Chicago', 'IL', 'O’Hare'),
('DFW', 'Dallas', 'TX', 'DFWIntl'),
('ATL', 'Atlanta', 'GA', 'ATLMain');

INSERT INTO flight(number,airline, weekdays) VALUES
(101, 'Delta', 127),
(102, 'United', 31),
(103, 'American', 62),
(104, 'Southwest', 124),
(105, 'JetBlue', 96);

INSERT INTO flight_leg(let_no, airport_code, number, secheduled_arr_time, secheduled_dep_time) VALUES
(1, 'JFK', 101, '08:00', '07:00'),
(2, 'LAX', 102, '12:00', '10:00'),
(3, 'ORD', 103, '16:00', '14:30'),
(4, 'DFW', 104, '19:00', '18:00'),
(5, 'ATL', 105, '22:00', '20:30');

INSERT INTO airplane_type(type_name, max_seat, comapny) VALUES
('A320', 180, 'Airbus'),
('B737', 160, 'Boeing'),
('E190', 100, 'Embraer'),
('A350', 300, 'Airbus'),
('B787', 250, 'Boeing');

INSERT INTO AirplaneType_Airport(airport_code, type_name) VALUES
('JFK', 'A320'),
('LAX', 'B737'),
('ORD', 'E190'),
('DFW', 'A350'),
('ATL', 'B787');

INSERT INTO fare(code, number, restrictions, amount) VALUES
(1, 101, 'No Refund', 90.00),
(2, 102, 'Refundable', 80.00),
(3, 103, 'Change Fee', 20.00),
(4, 104, 'Non-changeable', 30.00),
(5, 105, 'Student', 40.00);

--  get the check constarins name from sql server
SELECT name
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('fare');

alter table fare 
drop constraint CK__fare__amount__5441852A

alter table fare 
add constraint CK_fare_amount CHECK (amount > 1.00);

INSERT INTO airplane(airplane_id, type_name, total_no_of_seats) values
(1, 'A320', 180),
(2, 'B737', 160),
(3, 'E190', 100),
(4, 'A350', 300),
(5, 'B787', 250);

INSERT INTO leg_instance(date0, airport_code, let_no, airplane_id, number) values
('2025-05-20', 'JFK', 1, 1, 101),
('2025-05-20', 'LAX', 2, 2, 102),
('2025-05-21', 'ORD', 3, 3, 103),
('2025-05-22', 'DFW', 4, 4, 104),
('2025-05-23', 'ATL', 5, 5, 105);

INSERT INTO seat(seat_no, date0, let_no, airplane_id, airport_code) values
(1, '2025-05-20', 1, 1, 'JFK'),
(2, '2025-05-20', 2, 2, 'LAX'),
(3, '2025-05-21', 3, 3, 'ORD'),
(4, '2025-05-22', 4, 4, 'DFW'),
(5, '2025-05-23', 5, 5, 'ATL');

