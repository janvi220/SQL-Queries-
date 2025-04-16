create database hotel_management 
use hotel_management

CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE room
( room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL);

CREATE TABLE booking
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL);

CREATE TABLE guest
( guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

INSERT INTO hotel (hotel_no, name, address) VALUES
('H001', 'Grosvenor Hotel', 'London'),
('H002', 'Royal Inn', 'London'),
('H003', 'Ocean View', 'london'),
('H004', 'Mountain Retreat', 'Denver'),
('H005', 'Sunset Resort', 'Los Angeles');


INSERT INTO room (room_no, hotel_no, type, price) VALUES
('101', 'H001', 'S', 150.00),
('102', 'H001', 'D', 200.00),
('201', 'H002', 'S', 72.00),
('202', 'H002', 'D', 180.00),
('301', 'H003', 'S', 130.00);


INSERT INTO booking (hotel_no, guest_no, date_from, date_to, room_no) VALUES
('H001', 'G001', '2025-03-10', '2025-03-18', '101'),
('H002', 'G002', '2004-08-12', '2004-08-14', '102'),
('H003', 'G003', '1999-01-01', '1999-01-02', '201');

INSERT INTO booking (hotel_no, guest_no, date_from, room_no) VALUES
('H004', 'G004', '2024-10-10', '104')

INSERT INTO guest (guest_no, name, address) VALUES
('G001', 'John Doe', 'london'),
('G002', 'Jane Smith', 'Los Angeles'),
('G003', 'Alice Johnson', 'london');

UPDATE room SET price = price*1.05

CREATE TABLE booking_old
( hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no VARCHAR(4) NOT NULL);

/*INSERT INTO booking_old(
SELECT * FROM booking
WHERE date_to < DATE'2000-01-01');

DELETE FROM booking
WHERE date_to < DATE'2000-01-01';*/

--Simple Queries
/* 1. List full details of all hotels.*/
select*from hotel

/* 2. List full details of all hotels in London.*/
select * from hotel
where address='london'

/* 3. List the names and addresses of all guests in 
London, alphabetically ordered by name.*/
select name, address from hotel
where address = 'london'
order by name

/* 4. List all double or family rooms with a price 
below £200.00 per night, in ascending order of 
price.*/
select * from room
where (type = 'S' or type = 'D') and price < 200.00
order by price

/* 5. List the bookings for which no date_to has 
been specified.*/
select * from booking
where date_to is null

--Aggregate Functions
/*1. How many hotels are there? */
select COUNT(*) as [total hotel] from hotel

/* 2. What is the average price of a room?*/
select AVG(price) as [average price] from room

/*3. What is the total revenue per night from all double rooms? */
select sum(price) as [total revenue] from room
where type  = 'D'

/* 4. How many different guests have made bookings for August?*/
select COUNT(distinct guest_no)  from booking
where month(date_from)=8


--Subqueries and Joins
/* 1. List the price and type of all rooms at the Grosvenor Hotel.*/
select R.price,R.type from room R
inner join hotel H
on R.hotel_no = H.hotel_no
where H.name = 'Grosvenor Hotel'

/*2. List all guests currently staying at the Grosvenor Hotel. */
select G.guest_no,G.name,G.address
from guest G
JOIN booking b ON g.guest_no = b.guest_no
inner join hotel H on G.address = H.address
where H.name = 'Grosvenor Hotel'


/* 3. List the details of all rooms at the Grosvenor Hotel, 
including the name of the guest staying in the room, if 
the room is occupied.*/
select R.*,G.name
from room R
inner join hotel H on R.hotel_no = H.hotel_no
left join booking B on B.room_no = R.room_no and H.hotel_no = B.hotel_no
left join guest G on G.guest_no = B.guest_no
where H.name = 'Grosvenor Hotel'

/* 4. What is the total income from bookings for the 
Grosvenor Hotel today?*/
select sum(R.price) as [total income] from room R
join booking B on B.room_no = R.room_no
left join hotel H on H.hotel_no = R.hotel_no
where H.name = 'Grosvenor Hotel'
AND b.date_from <= GETDATE() 
AND (b.date_to IS NULL OR b.date_to = GETDATE());

/* 5. List the rooms that are currently unoccupied at the 
Grosvenor Hotel.*/
select R.*,G.name
from room R
inner join hotel H on R.hotel_no = H.hotel_no
LEFT JOIN booking b ON r.room_no = b.room_no AND r.hotel_no = b.hotel_no
left join guest G on G.guest_no = B.guest_no
where H.name <> 'Grosvenor Hotel'
AND (b.room_no IS NULL OR b.date_to < GETDATE());

/* 6. What is the lost income from unoccupied rooms at the 
Grosvenor Hotel?*/
SELECT SUM(r.price) AS lost_income
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
LEFT JOIN booking b ON r.room_no = b.room_no AND r.hotel_no = b.hotel_no
WHERE h.name <> 'Grosvenor Hotel'
AND (b.room_no IS NULL OR b.date_to < GETDATE());

--Grouping
/*1. List the number of rooms in each hotel. */
select H.name,H.hotel_no,COUNT(r.room_no)  from room R
join hotel H on H.hotel_no= R.hotel_no
group by H.name,H.hotel_no

/* 2. List the number of rooms in each hotel in London.*/
select H.name,H.hotel_no,COUNT(r.room_no)  from room R
join hotel H on H.hotel_no= R.hotel_no
where H.address = 'london'
group by H.name,H.hotel_no

/* 3. What is the average number of bookings for each hotel in August?*/
SELECT b.hotel_no, h.name, COUNT(b.guest_no) AS avg_bookings
FROM booking b
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE MONTH(b.date_from) = 8
GROUP BY b.hotel_no, h.name;

/* 4. What is the most commonly booked room type for each hotel in London?*/
SELECT h.hotel_no, h.name AS hotel_name, r.type AS room_type, COUNT(*) AS total_bookings
FROM booking b
JOIN room r ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h ON b.hotel_no = h.hotel_no
WHERE h.address = 'london' 
GROUP BY h.hotel_no, h.name, r.type

/* 5. What is the lost income from unoccupied rooms at each hotel today?*/
SELECT h.hotel_no, h.name AS hotel_name, SUM(r.price) AS lost_income
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
LEFT JOIN booking b 
    ON r.room_no = b.room_no 
    AND r.hotel_no = b.hotel_no 
    AND CAST(GETDATE() AS DATE) BETWEEN CAST(b.date_from AS DATE) AND CAST(b.date_to AS DATE)
WHERE b.room_no IS NULL  
GROUP BY h.hotel_no, h.name;

