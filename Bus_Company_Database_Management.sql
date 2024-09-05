-- TASK 2: SQL DATA DEFINITION

PRAGMA foreign_keys = TRUE;

-- creating a table for staff

CREATE TABLE staff (
	staff_id CHAR(5),
	staff_name VARCHAR(20) NOT NULL,
	email CHAR(13),
	street VARCHAR(30),
	city VARCHAR(30),
	postcode CHAR(6),
	PRIMARY KEY (staff_id)
);

-- populating the staff table with data

INSERT INTO staff
VALUES 	('ej000', 'Emily Johnson', 'ej000@bus.com', '23 Highland Avenue', 'Edinburgh', 'EH1 2AB'),
	   ('ds111', 'Daniel Smith', 'ds111@bus.com', '45 Lochside Road', 'Glasgow', 'G2 3CD'),
	   ('ob222', 'Olivia Brown', 'ob222@bus.com', '67 Castle Street', 'Aberdeen', 'AB3 4DE'),
	   ('lm333', 'Liam Miller', 'lm333@bus.com', '89 Thistle Lane', 'Inverness', 'IV4 5EF'),
	   ('sd444', 'Sophia Davis', 'sd444@bus.com', '12 Glenwood Avenue', 'Dundee', 'DD5 6FG'),
	   ('ew555', 'Ethan Wilson', 'ew555@bus.com', '34 Skye Terrace', 'Stirling', 'FK6 7GH'),
	   ('am666', 'Ava Martinez', 'am666@bus.com', '56 Ben Nevis Road', 'Perth', 'PH7 8HI'),
	   ('bc777', 'Benjamin Clark', 'bc777@bus.com', '78 Loch Ness Lane', 'Elgin', 'IV8 9IJ'),
	   ('ma888', 'Mia Anderson', 'ma888@bus.com', '90 Auld Reekie Street', 'Falkirk', 'FK9 1JK'),
	   ('wt999', 'William Taylor', 'wt999@bus.com', '11 Caledonia Drive', 'Dunfermline', 'KY1 2LM'),
	   ('jm001', 'Jackson Miller', 'jm001@bus.com', '23 Thistle Street', 'Glasgow', 'G1 2XY'),
	   ('ch112', 'Charlotte Harris', 'ch112@bus.com', '45 Highland Road', 'Edinburgh', 'EH3 3AB'),
	   ('mt223', 'Mason Thompson', 'mt223@bus.com', '67 Castle Lane', 'Inverness', 'IV4 4CD'),
	   ('lr334', 'Lily Robinson', 'lr334@bus.com', '89 Rosewood Avenue', 'Aberdeen', 'AB5 5DE'),
	   ('aw445', 'Aiden Wright', 'aw445@bus.com', '12 Lochside Drive', 'Stirling', 'FK6 6EF'),
	   ('hh556', 'Harper Hall', 'hh556@bus.com', '34 Riverside Street', 'Dundee', 'DD7 7FG'),
	   ('lk667', 'Logan King', 'lk667@bus.com', '56 Ivy Terrace', 'Perth', 'PH8 8GH'),
	   ('ac778', 'Addison Carter', 'ac778@bus.com', '78 Speyside Lane', 'Elgin', 'IV9 9HI'),
	   ('ca889', 'Caleb Adams', 'ca889@bus.com', '90 Grampian Road', 'Falkirk', 'FK0 0JK'),
	   ('am990', 'Abigail Mitchell', 'am990@bus.com', '11 Highland Crescent', 'Dunfermline', 'KY2 2LM');

-- performing a query to see all data in the staff table
SELECT staff_id  AS ' Staff ID',
	staff_name AS 'Name',
	email AS 'Email',
	street AS 'Street',
	city AS 'City',
	postcode AS 'Postcode'
FROM staff;

-- creating a table for phone numbers

CREATE TABLE phone (
	staff_id CHAR(5),
	phone_type CHAR(10),
	phone_number CHAR(10) NOT NULL,
	FOREIGN KEY (staff_id) REFERENCES staff
);

-- populating the phone table with data

INSERT INTO phone
VALUES ('ej000', 'mobile', '7658245673'),
           ('ej000', 'home', '7658245678'),
	   ('ds111', 'mobile', '7245674984'),
           ('ds111', 'home', '7245674983'),
	   ('ob222', 'mobile', '7985461342'),
           ('ob222', 'home', '7985461343'),
	   ('lm333', 'mobile', '7654890354'),
           ('lm333', 'home', '7654890350'),
	   ('sd444', 'mobile', '7641534290'),
           ('sd444', 'home', '7641534291'),
	   ('ew555', 'mobile', '7658290456'),
           ('ew555', 'home', '7658290457'),
	   ('am666', 'mobile', '7648021454'),
           ('am666', 'home', '7648021455'),
	   ('bc777', 'mobile', '7231450946'),
           ('bc777', 'home', '7231450944'),
	   ('ma888', 'mobile', '7093657825'),
           ('ma888', 'home', '7093657826'),
	   ('wt999', 'mobile', '7578903451'),
           ('wt999', 'home', '7578903459'),
	   ('jm001', 'mobile', '7365809736'),
           ('jm001', 'home', '7365809733'),
	   ('ch112', 'mobile', '7123456780'),
           ('ch112', 'home', '7123456781'),
	   ('mt223', 'mobile', '7890653869'),
           ('mt223', 'home', '7890653866'),
	   ('lr334', 'mobile', '7666449835'),
           ('lr334', 'home', '7666449830'),
	   ('aw445', 'mobile', '7789025564'),
           ('aw445', 'home', '7789025560'),
	   ('hh556', 'mobile', '7990355512'),
           ('hh556', 'home', '7990355513'),
	   ('lk667', 'mobile', '7225467789'),
           ('lk667', 'home', '7225467788'),
	   ('ac778', 'mobile', '7380926732'),
           ('ac778', 'home', '7380926739'),
	   ('ca889', 'mobile', '7465589902'),
           ('ca889', 'home', '7465589900'),
	   ('am990', 'mobile', '7786225431'),
           ('am990', 'home', '7786225437');

-- performing a query to see all data in the phone table		
SELECT staff_id AS 'Staff ID',
	phone_type AS 'Phone Type',
	phone_number AS 'Phone Number'
FROM phone;

-- creating a table for bus stations

CREATE TABLE station (
	station_name VARCHAR(30),
	town VARCHAR(30),
        staff_id CHAR(5),
	PRIMARY KEY (station_name),
        FOREIGN KEY (staff_id) REFERENCES staff
);

-- populating the station table with data

INSERT INTO station
VALUES ('Edinburgh Bus Station', 'Edinburgh', 'ej000'),
       ('Granite City Bus Terminal','Aberdeen', 'ob222'),
       ('Seagate Bus Station','Dundee', 'sd444'),
       ('River Tay Bus Terminal', 'Perth', 'am666'),
       ('Kelpies Bus Station', 'Falkirk', 'ma888'),
       ('Buchanan Street Interchange','Glasgow', 'jm001'),
       ('Highland View Transit Center', 'Inverness', 'mt223'),
       ('Wallace Bridge Bus Station', 'Stirling', 'aw445'), 
       ('Forth Bridge Bus Terminal', 'Dunfermline', 'lk667'),
       ('Stagecoach St Andrews Depot','St Andrews', 'ca889');

-- performing a query to see all data in the station table
SELECT station_name AS 'Station Name',
	town AS 'Town',
	staff_id AS 'Staff ID'
FROM station;

-- creating a table for services

CREATE TABLE service (
	service_number CHAR(3),
	origin_station VARCHAR(30),
        destination_station VARCHAR(30),
	PRIMARY KEY (service_number),
	FOREIGN KEY (origin_station) REFERENCES station(station_name),
        FOREIGN KEY (destination_station) REFERENCES station(station_name)
);

-- populating the service table with data

INSERT INTO service
VALUES ('X42', 'Edinburgh Bus Station', 'Stagecoach St Andrews Depot'),
       ('M11', 'Granite City Bus Terminal', 'Highland View Transit Center'),
       ('B7', 'Seagate Bus Station', 'River Tay Bus Terminal'),
       ('T56', 'River Tay Bus Terminal', 'Wallace Bridge Bus Station'),
       ('H40', 'Kelpies Bus Station', 'Forth Bridge Bus Terminal'),
       ('F17', 'Buchanan Street Interchange', 'Stagecoach St Andrews Depot'),
       ('A5', 'Highland View Transit Center', 'Seagate Bus Station'),
       ('E84', 'Wallace Bridge Bus Station', 'Granite City Bus Terminal'),
       ('K12', 'Seagate Bus Station', 'Edinburgh Bus Station'),
       ('90A', 'Stagecoach St Andrews Depot', 'Stagecoach St Andrews Depot');

-- performing a query to see all data in the service table
SELECT service_number AS 'Service Number',
	origin_station AS 'Origin Station',
	 destination_station AS 'Destination Station'
FROM service;

-- creating a table for managers

CREATE TABLE manager (
	staff_id CHAR(5),
	annual_salary_pounds NUMERIC(5),
	FOREIGN KEY (staff_id) REFERENCES staff
);

-- populating the manager table with data

INSERT INTO manager
VALUES ('ej000', 70000),
	   ('ob222', 60000),
	   ('sd444', 40000),
	   ('am666', 40000),
	   ('ma888', 35000),
	   ('jm001', 55000),
	   ('mt223', 58000),
	   ('aw445', 45000),
	   ('lk667', 42000),
	   ('ca889', 52000);

-- performing a query to see all data in the manager table
SELECT staff_id AS 'Staff ID',
	annual_salary_pounds AS 'Annual Salary £'
FROM manager;

-- creating a table for drivers

CREATE TABLE driver (
	staff_id CHAR(5),
	hourly_salary_pounds NUMERIC(2),
	FOREIGN KEY (staff_id) REFERENCES staff
);

-- populating the driver table with data

INSERT INTO driver
VALUES ('ds111', 20),
	   ('lm333', 20),
	   ('ew555', 18),
	   ('bc777', 16),
	   ('wt999', 15),
	   ('ch112', 17),
           ('lr334', 19),
           ('hh556', 16),
  	   ('ac778', 15),
	   ('am990', 18);

-- performing a query to see all data in the driver table
SELECT staff_id AS 'Staff ID',
	hourly_salary_pounds AS 'Hourly Salary £'
FROM driver;

-- creating a table for hours driven by bus drivers

CREATE TABLE hours_driven (
	staff_id CHAR(5),
	hours_driven NUMERIC(2),
        service_number CHAR(3),
	FOREIGN KEY (staff_id) REFERENCES staff,
        FOREIGN KEY (service_number) REFERENCES service
);

-- populating the hours driven table with data

INSERT INTO hours_driven
VALUES ('ds111', 8, 'X42'),
       ('ds111', 12, 'X42'), 
       ('ds111', 10, '90A'), 
       ('ds111', 9, '90A'),
       ('ds111', 7, 'T56'),
       ('lm333', 7, 'M11'), 
       ('lm333', 9, 'B7'), 
       ('lm333', 8, 'B7'),
       ('lm333', 14, 'H40'),
       ('lm333', 12, 'H40'),
       ('ew555', 10, 'T56'),
       ('ew555', 11, 'T56'),
       ('ew555', 12, 'T56'),
       ('ew555', 9, 'F17'),
       ('ew555', 9, 'A5'), 
       ('bc777', 7, 'A5'),
       ('bc777', 11, 'A5'),
       ('bc777', 12, 'E84'),
       ('bc777', 8, 'E84'),
       ('bc777', 10, 'A5'),
       ('wt999', 11, 'E84'),
       ('wt999', 12, 'E84'),
       ('wt999', 8, 'K12'), 
       ('wt999', 8, 'K12'),
       ('wt999', 8, '90A'),
       ('ch112', 7, '90A'),
       ('ch112', 6, '90A'),
       ('ch112', 8, '90A'),
       ('ch112', 8, '90A'),
       ('ch112', 9, '90A'),
       ('lr334', 10, 'X42'),
       ('lr334', 11, 'X42'),
       ('lr334', 12, 'M11'),
       ('lr334', 8, 'B7'),
       ('lr334', 8, 'B7'),
       ('hh556', 9, 'T56'),
       ('hh556', 9, 'H40'),
       ('hh556', 7, 'H40'),
       ('hh556', 5, 'F17'),
       ('hh556', 10, 'F17'),
       ('ac778', 11, 'A5'),
       ('ac778', 12, 'A5'),
       ('ac778', 12, 'A5'),
       ('ac778', 5, 'E84'),
       ('ac778', 6, 'E84'),
       ('am990', 7, 'K12'),
       ('am990', 8, 'K12'),
       ('am990', 9, 'K12'),
       ('am990', 10, 'K12'),
       ('am990', 11, '90A');

-- performing a query to see all data in the hours driven table
SELECT staff_id AS 'Staff ID',
	hours_driven AS 'Hours Driven per Day',
	service_number AS 'Service Number'
FROM hours_driven;

-- creating a table for bus stops

CREATE TABLE stop (
	stop_name VARCHAR(50),
	PRIMARY KEY (stop_name)
);

-- populating the stop table with data

INSERT INTO stop
VALUES ('Edinburgh Gateway Transit Hub'),
       ('Fife Coastal View Bus Stop'),
       ('St. Andrews Links Junction Station'),
       ('Buchanan Gardens, St Andrews'),
       ('East Neuk Connection Point'),
       ('Granite City Gateway Transit Hub'),
       ('Highland Foothills Bus Stop'),
       ('River Dee Junction Station'),
       ('Caledonian Valley Transit Point'),
       ('Moray Firth View Bus Station'),
       ('Tay Bridge Transit Hub'),
       ('Riverside Plaza Bus Stop'),
       ('Kinross Junction Station'),
       ('Perthshire View Transit Point'),
       ('Discovery City Bus Station'),
       ('Perthshire Gateway Transit Hub'), 
       ('Bridge of Earn Bus Stop'),
       ('Trossachs View Junction Station'),
       ('Stirling Castle Bus Station'),
       ('River Forth Transit Point'),
       ('Kelpies Crossroads Bus Stop'),
       ('Antonine Way Transit Hub'),
       ('Forth Valley Junction Station'),
       ('Dunfermline Abbeyview Bus Station'),
       ('Kingdom Connection Point'),
       ('Buchanan Street, Glasgow'),
       ('Dunfermline Interchange'),
       ('Leven Promenade'),
       ('St. Andrews University Bus Terminal'),
       ('Inverness Bus Station'),
       ('Pitlochry Crossroads'), 
       ('Blairgowrie Town Centre'), 
       ('Forfar Market Square'), 
       ('Dundee Riverside Station'), 
       ('Stirling Bus Station'),
       ('Perth City Centre'), 
       ('Brechin Square'), 
       ('Stonehaven Beachfront'), 
       ('Aberdeen Union Square'), 
       ('Dunfermline Town Centre'), 
       ('Cowdenbeath High Street'), 
       ('Kirkliston Cross'), 
       ('Gyle Shopping Centre, Edinburgh'), 
       ('Princes Street, Edinburgh'), 
       ('Market Street'), 
       ('St Andrews Golf Links'), 
       ('North Street Square'), 
       ('West Sands Beach Access');

-- performing a query to see all data in the stop table
SELECT stop_name AS 'Stop Name'
FROM stop;

-- creating a table for service start wroking time

CREATE TABLE service_time (
        service_number VARCHAR(3),
        start_time VARCHAR(6) NOT NULL,
        FOREIGN KEY (service_number) REFERENCES service
);

-- populating the service time table with data

INSERT INTO service_time
VALUES ('X42', '6:00'),
       ('M11', '8:00'),
       ('B7', '7:30'),
       ('T56', '8:30'),
       ('H40', '5:40'),
       ('F17', '6:00'),
       ('A5', '7:35'),
       ('E84', '8:00'),
       ('K12', '9:30'),
       ('90A', '8:30');

-- performing a query to see all data in the service time table
SELECT service_number AS 'Service Number',
	start_time  AS 'Daily Start Time'
FROM service_time;
	
-- creating a table for buses arrival time and fare from origin station to the stop

CREATE TABLE stop_on (
	stop_name VARCHAR(50),
        service_number VARCHAR(3),
	arrival_time VARCHAR(6) NOT NULL,
	fare_pounds NUMERIC(2),
	FOREIGN KEY (stop_name) REFERENCES stop,
	FOREIGN KEY (service_number) REFERENCES service
);

-- populating the stop on table with data

INSERT INTO stop_on
VALUES ('Edinburgh Gateway Transit Hub', 'X42', '6:20', 2),
       ('Fife Coastal View Bus Stop', 'X42', '8:30', 4),
       ('St. Andrews Links Junction Station', 'X42', '9:30', 5),
       ('Buchanan Gardens, St Andrews', 'X42', '10:00', 5),
       ('East Neuk Connection Point', 'X42', '10:25', 6),
       ('Granite City Gateway Transit Hub', 'M11', '9:50', 2),
       ('Highland Foothills Bus Stop', 'M11', '10:45', 3),
       ('River Dee Junction Station', 'M11', '11:15', 3),
       ('Caledonian Valley Transit Point', 'M11', '11:30', 4),
       ('Moray Firth View Bus Station', 'M11', '12:35', 5),
       ('Tay Bridge Transit Hub', 'B7', '8:00', 3),
       ('Riverside Plaza Bus Stop', 'B7', '8:50', 4),
       ('Kinross Junction Station', 'B7', '10:40', 5),
       ('Perthshire View Transit Point', 'B7', '12:30', 5),
       ('Discovery City Bus Station', 'B7', '13:15', 5),
       ('Perthshire Gateway Transit Hub', 'T56', '9:20', 3), 
       ('Bridge of Earn Bus Stop', 'T56', '10:45', 3),
       ('Trossachs View Junction Station', 'T56', '12:55', 4),
       ('Stirling Castle Bus Station', 'T56', '13:40', 6),
       ('River Forth Transit Point', 'T56', '14:00', 6),
       ('Kelpies Crossroads Bus Stop', 'H40', '6:25', 2),
       ('Antonine Way Transit Hub', 'H40', '7:00', 2),
       ('Forth Valley Junction Station', 'H40', '8:15', 4),
       ('Dunfermline Abbeyview Bus Station', 'H40', '8:55', 4),
       ('Kingdom Connection Point', 'H40', '9:30', 5),
       ('Buchanan Street, Glasgow', 'F17', '7:00', 1),
       ('Dunfermline Interchange', 'F17', '10:35', 4),
       ('Leven Promenade', 'F17', '12:40', 5),
       ('Buchanan Gardens, St Andrews', 'F17', '13:15', 7),
       ('St. Andrews University Bus Terminal', 'F17', '14:00', 8),
       ('Inverness Bus Station', 'A5', '9:20', 1),
       ('Pitlochry Crossroads', 'A5', '10:00', 3), 
       ('Blairgowrie Town Centre', 'A5', '11:45', 4), 
       ('Forfar Market Square', 'A5', '12:30', 4), 
       ('Dundee Riverside Station', 'A5', '13:35', 6), 
       ('Stirling Bus Station', 'E84', '8:30', 1),
       ('Perth City Centre', 'E84', '10:30', 5), 
       ('Brechin Square', 'E84', '12:00', 5), 
       ('Stonehaven Beachfront', 'E84', '12:35', 5), 
       ('Aberdeen Union Square', 'E84', '15:45', 7), 
       ('Dunfermline Town Centre', 'K12', '11:45', 2), 
       ('Cowdenbeath High Street', 'K12', '12:55', 3), 
       ('Kirkliston Cross', 'K12', '13:40', 5), 
       ('Gyle Shopping Centre, Edinburgh', 'K12', '15:15', 8), 
       ('Princes Street, Edinburgh', 'K12', '16:20', 8), 
       ('Market Street', '90A', '9:45', 2), 
       ('St Andrews Golf Links', '90A', '10:30', 2), 
       ('Buchanan Gardens, St Andrews', '90A', '11:40', 2),
       ('North Street Square', '90A', '12:55', 2), 
       ('West Sands Beach Access', '90A', '14:00', 2);

-- performing a query to see all data in the stop on table
SELECT stop_name AS 'Stop Name',
	service_number AS 'Service Number',
	arrival_time AS 'Arrival Time',
	fare_pounds AS 'Fare £'
FROM stop_on;


-- TASK 3: SQL DATA MANIPULATION
-- QUERIES

-- 1 Listing all services which have Seagate Bus Station in Dundee as their origin.
SELECT service_number AS 'Service Number'
FROM service
WHERE origin_station = 'Seagate Bus Station';

-- 2 Calculating an average monthly salary of a bus station manager.
SELECT AVG(annual_salary_pounds) AS 'Average Annual Salary £'
FROM manager;

-- 3 Listing the names of all drivers of services which have Edinburgh Bus Station in Edinburgh as their origin or destination, in increasing order of the amount to be paid to them for the hours driven.
SELECT DISTINCT driver.staff_id AS 'Staff ID', staff.staff_name AS 'Name', SUM(driver.'hourly_salary_pounds' * hours_driven.hours_driven) AS total_salary
FROM driver JOIN hours_driven ON driver.staff_id = hours_driven.staff_id
JOIN service ON hours_driven.service_number = service.service_number
JOIN staff ON driver.staff_id = staff.staff_id
JOIN station ON service.destination_station = station.station_name OR service.origin_station = station.station_name
WHERE station.town = 'Edinburgh'
GROUP BY driver.staff_id, staff.staff_name
ORDER BY total_salary;

-- 4 Listing the manager of the most connected station, measured by the number of services which have that station as their origin or destination.
SELECT manager.staff_id AS 'Staff ID', staff.staff_name AS 'Name', station.station_name AS 'Station Name', COUNT(*) AS num_services
FROM station
JOIN service ON station.station_name = service.destination_station OR station.station_name = service.origin_station
JOIN manager ON station.staff_id = manager.staff_id
JOIN staff ON manager.staff_id = staff.staff_id
GROUP BY manager.staff_id = staff.staff_name, station.station_name
ORDER BY num_services DESC
LIMIT 1;

-- 5 For the bus stop "Buchanan Gardens, St Andrews" listing in the chronological order arrival times at this stop, origins, destinations, and service numbers of all bus services passing this stop between 10 am and 2 pm.
SELECT arrival_time AS 'Arrival Time', origin_station AS 'Origin Station',  destination_station AS 'Destination Station', service_number AS 'Service Number'
FROM stop_on NATURAL JOIN service
WHERE stop_name = "Buchanan Gardens, St Andrews" AND arrival_time BETWEEN '10:00' AND '14:00'
ORDER BY arrival_time;

-- 6 This query calculates the total revenue generated by each bus service based on the sum of fares collected from each stop.
SELECT
    s.service_number,
    SUM(so.fare_pounds) AS total_revenue
FROM service s
JOIN stop_on so ON s.service_number = so.service_number
GROUP BY s.service_number
ORDER BY total_revenue DESC;

-- 7 This query calculates the earnings for each driver based on their hourly salary and the total hours driven.
SELECT
    d.staff_id,
    d.hourly_salary_pounds,
    SUM(hd.hours_driven) AS total_hours_driven,
    SUM(hd.hours_driven) * d.hourly_salary_pounds AS earnings
FROM driver d
JOIN hours_driven hd ON d.staff_id = hd.staff_id
GROUP BY d.staff_id
ORDER BY earnings DESC;

-- 8 This query identifies the bus service with the highest average fare.
SELECT
    s.service_number,
    AVG(so.fare_pounds) AS average_fare
FROM service s
JOIN stop_on so ON s.service_number = so.service_number
GROUP BY s.service_number
ORDER BY average_fare DESC
LIMIT 1;

-- 9 This query lists stations where the managers earn more than the average salary.
SELECT
    st.station_name,
    m.annual_salary_pounds AS manager_salary
FROM station st
JOIN manager m ON st.staff_id = m.staff_id
WHERE m.annual_salary_pounds > (SELECT AVG(annual_salary_pounds) FROM manager);

-- 10 This query gets information about bus drivers, their hourly salaries, the total hours they have driven, and their total earnings based on the hours driven.
SELECT
    s.staff_id AS 'Staff ID',
    s.staff_name AS 'Driver Name',
    d.hourly_salary_pounds AS 'Hourly Salary £',
    SUM(hd.hours_driven) AS 'Total Hours Driven',
    SUM(hd.hours_driven * d.hourly_salary_pounds) AS 'Total Earnings £'
FROM
    staff s
JOIN
    driver d ON s.staff_id = d.staff_id
LEFT JOIN
    hours_driven hd ON s.staff_id = hd.staff_id
GROUP BY
    s.staff_id, s.staff_name, d.hourly_salary_pounds, hd.staff_id;

-- VIEWS
-- 1 Creating a view that shows information about top 3 managers that receive the highest salaries among others
CREATE VIEW top_3_salaries AS
SELECT staff_id AS 'Staff ID', annual_salary_pounds AS 'Annual Salary £', town AS 'Town'
FROM manager NATURAL JOIN station
ORDER BY annual_salary_pounds DESC
LIMIT 3;

SELECT * FROM top_3_salaries;

-- 2 Creating a view that provides details about managers, their salary and the stations they work at.
CREATE VIEW staff_manager_station_info AS
SELECT s.staff_id AS 'Staff ID', s.staff_name AS 'Names', m.annual_salary_pounds AS 'Annual Salary £', st.station_name AS 'Station Name', st.town AS 'Town'
FROM staff s
INNER JOIN manager m ON s.staff_id = m.staff_id
INNER JOIN station st ON s.staff_id = st.staff_id;

SELECT * FROM staff_manager_station_info;

-- 3 Creating a view that conveys the schedule for each bus service, the service number, origin, destination, and the start time.
CREATE VIEW bus_schedule AS
SELECT s.service_number AS 'Service Number', s.origin_station AS 'Origin Station', s.destination_station AS 'Destination Station', st.start_time AS 'Start Time'
FROM service s
JOIN service_time st ON s.service_number = st.service_number;

SELECT * FROM bus_schedule;

-- 4 Creating a view that shows the total hours driven by each driver along with their hourly salary.
CREATE VIEW driver_workload AS
SELECT d.staff_id AS 'Staff ID', d.hourly_salary_pounds AS 'Hourly Salary £', SUM(hd.hours_driven) AS 'Total Hours Driven'
FROM driver d
LEFT JOIN hours_driven hd ON d.staff_id = hd.staff_id
GROUP BY d.staff_id, d.hourly_salary_pounds;

SELECT * FROM driver_workload;

-- 5 Creating a view that shows the average fare for each bus stop based on the fares from origin stations to each stop.
CREATE VIEW average_fare_by_stop AS
SELECT stop_name AS 'Stop Name', AVG(fare_pounds) AS 'Average Fare £'
FROM stop_on
GROUP BY stop_name;

SELECT * FROM average_fare_by_stop;

-- CASES (EXTRA)
-- 1 Creating a case statement to categorise drivers into different pay categories based on the total hours they have driven.
SELECT
    staff_id,
    SUM(hours_driven) AS total_hours_driven,
    CASE
        WHEN SUM(hours_driven) < 20 THEN 'Low Pay'
        WHEN SUM(hours_driven) BETWEEN 20 AND 40 THEN 'Medium Pay'
        WHEN SUM(hours_driven) > 40 THEN 'High Pay'
    END AS pay_category
FROM hours_driven
GROUP BY staff_id;

-- 2 Creating a case statement to categorise bus stops into different fare levels.
SELECT
    stop_name,
    AVG(fare_pounds) AS average_fare,
    CASE
        WHEN AVG(fare_pounds) < 2 THEN 'Low Fare'
        WHEN AVG(fare_pounds) BETWEEN 2 AND 4 THEN 'Medium Fare'
        WHEN AVG(fare_pounds) > 4 THEN 'High Fare'
    END AS fare_category
FROM stop_on
GROUP BY stop_name;

-- 3 Creating a case statement to categorise bus services into different activity levels based on the total number of hours driven by drivers for each service. 
SELECT
    s.service_number,
    SUM(hd.hours_driven) AS total_hours_driven,
    CASE
        WHEN SUM(hd.hours_driven) < 50 THEN 'Low Activity'
        WHEN SUM(hd.hours_driven) BETWEEN 50 AND 100 THEN 'Moderate Activity'
        WHEN SUM(hd.hours_driven) > 100 THEN 'High Activity'
    END AS service_activity
FROM service s
LEFT JOIN hours_driven hd ON s.service_number = hd.service_number
GROUP BY s.service_number;

