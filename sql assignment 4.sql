create database TPCH
use TPCH

create table PART(
p_partkey int primary key,
p_name varchar(20),
p_mfgr varchar(30),
p_brand varchar(50),
p_type varchar(30),
p_size int,
p_container varchar(50),
p_retailprice money,
p_comment varchar(20))

INSERT INTO PART (p_partkey, p_name, p_mfgr, p_brand, p_type, p_size, p_container, p_retailprice, p_comment)
VALUES
(1, 'Bolt', 'Mivan Ltd', 'Brand-A', 'Metal', 10, 'Box', 15.50, 'High quality'),
(2, 'Nut', 'Fasteners Inc', 'Brand-B', 'Plastic', 5, 'Bag', 8.75, 'Durable'),
(3, 'Screw', 'Mivan Ltd', 'Brand-C', 'Stainless Steel', 6, 'Pack', 12.30, 'Rust-free'),
(4, 'Washer', 'Global Parts', 'Brand-A', 'Rubber', 3, 'Box', 6.20, 'Elastic material'),
(5, 'Bearing', 'Speed Ltd', 'Brand-D', 'Metal', 12, 'Case', 25.90, 'Heavy-duty'),
(6, 'Rod', 'Steel Works', 'Brand-E', 'Aluminium', 20, 'Tube', 40.50, 'Lightweight'),
(7, 'Clamp', 'FixIt Co.', 'Brand-B', 'Plastic', 8, 'Pack', 9.95, 'Adjustable'),
(8, 'Gasket', 'Mivan Ltd', 'Brand-A', 'Rubber', 4, 'Box', 5.80, 'Heat-resistant'),
(9, 'Spring', 'Flex Ltd', 'Brand-C', 'Steel', 7, 'Bag', 18.40, 'Flexible'),
(10, 'Pin', 'Fasteners Inc', 'Brand-D', 'Metal', 2, 'Pack', 3.99, 'Small but strong');

select * from PART

create table SUPPLIER(
s_suppkey int primary key,
s_name varchar(20),
s_address varchar(100),
s_nationkey int,
s_phone varchar(10),
s_accbal money,
s_comment varchar(50))

INSERT INTO SUPPLIER (s_suppkey, s_name, s_address, s_nationkey, s_phone, s_accbal, s_comment)
VALUES
(101, 'ABC Supplies', '123 Main St, New York, USA', 1, '1234567890', 5000.75, 'Reliable supplier'),
(102, 'Global Parts', '456 Oak Rd, London, UK', 2, '9876543210', 7200.50, 'Fast delivery'),
(103, 'Fasteners Inc', '789 Maple Ave, Berlin, Germany', 3, '5432167890', 6500.00, 'High-quality parts'),
(104, 'Steel Works', '101 Pine St, Paris, France', 4, '8765432109', 8100.20, 'Specializes in metal'),
(105, 'Flex Ltd', '202 Birch Ln, Tokyo, Japan', 5, '2345678901', 4300.45, 'Affordable pricing'),
(106, 'FixIt Co.', '303 Cedar Blvd, Sydney, Australia', 6, '6789012345', 9200.80, 'Great customer service'),
(107, 'Speed Ltd', '404 Elm Dr, Toronto, Canada', 7, '3456789012', 7100.60, 'Quick shipments'),
(108, 'Mivan Ltd', '505 Redwood Ct, Mumbai, India', 8, '5678901234', 5600.90, 'Trusted by industry leaders'),
(109, 'RubberMfg', '606 Spruce Rd, Sao Paulo, Brazil', 9, '7890123456', 3800.70, 'Specialized in rubber parts'),
(110, 'Bearing Corp', '707 Aspen Way, Cape Town, South Africa', 10, '9012345678', 8450.30, 'High-end bearings');

select * from SUPPLIER

CREATE TABLE PARTSUPP (
    ps_partkey INT,
    ps_suppkey INT,
    ps_availqty INT,
    ps_supplycost DECIMAL(15, 2),
    ps_comment VARCHAR(199),
    PRIMARY KEY (ps_partkey, ps_suppkey),
    FOREIGN KEY (ps_partkey) REFERENCES PART(p_partkey),
    FOREIGN KEY (ps_suppkey) REFERENCES SUPPLIER(s_suppkey)
);

INSERT INTO PARTSUPP (ps_partkey, ps_suppkey, ps_availqty, ps_supplycost, ps_comment)
VALUES
(1, 101, 500, 15.75, 'Quick delivery, excellent quality'),
(2, 102, 800, 12.25, 'Discount available for bulk orders'),
(3, 103, 200, 19.30, 'High demand, limited availability'),
(4, 104, 150, 22.40, 'Special offer for limited time'),
(5, 105, 1000, 10.50, 'Standard quality, steady supply'),
(6, 106, 450, 18.75, 'Seasonal supplier, limited stock'),
(7, 107, 350, 11.00, 'On-demand items'),
(8, 108, 900, 16.50, 'Discounts for repeat customers'),
(9, 109, 300, 14.50, 'Reliable but slow shipping'),
(10, 110, 600, 13.90, 'Premium materials used')

select * from PARTSUPP

CREATE TABLE CUSTOMER (
    c_custkey INT PRIMARY KEY,
    c_name VARCHAR(25),
    c_address VARCHAR(40),
    c_nationkey INT,
    c_phone VARCHAR(15),
    c_acctbal DECIMAL(15, 2),
    c_mktsegment VARCHAR(10),
    c_comment VARCHAR(117)
);
INSERT INTO CUSTOMER (c_custkey, c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment)
VALUES
(1, 'Alice Green', '123 Maple St, Springfield, IL', 1, '5551234567', 20000.75, 'Retail', 'Regular customer, high satisfaction'),
(2, 'Bob Blue', '456 Oak St, Metropolis, NY', 2, '5552345678', 3200.50, 'Wholesale', 'Frequent large orders, prefers bulk deals'),
(3, 'Charlie Brown', '789 Pine St, Smalltown, TX', 1, '5553456789', 95500.20, 'Household', 'Occasional customer, cautious buyer'),
(4, 'Diana White', '101 Birch St, Bigcity, CA', 3, '5554567890', 4500.75, 'Corporate', 'Bulk buyer, excellent credit history'),
(5, 'Eva Black', '202 Cedar St, Rivertown, FL', 4, '5555678901', 5000.30, 'Retail', 'Loyal customer, always on time with payments'),
(6, 'Frank Yellow', '303 Elm St, Lakeside, AZ', 2, '5556789012', 3700.40, 'Wholesale', 'New customer, looking for long-term partnership'),
(7, 'Grace Red', '404 Willow St, Forestville, WI', 1, '5557890123', 6000.00, 'Household', 'High-volume buyer, great reputation'),
(8, 'Hannah Silver', '505 Ash St, Hilltop, OH', 3, '5558901234', 2800.10, 'Retail', 'Active buyer, often makes special requests'),
(9, 'Ian Gold', '606 Pine St, Beachside, FL', 4, '5559012345', 7200.90, 'Corporate', 'Excellent payer, bulk buyer for reselling'),
(10, 'Jack Purple', '707 Cedar St, Oldtown, TX', 2, '5550123456', 91000.60, 'Retail', 'Occasional orders, looks for discounts')
INSERT INTO CUSTOMER (c_custkey, c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment)
VALUES
(11, 'Robert Brown', '780 Pine St, Smalltown, TX', 1, '5553456789', 95500.20, 'Household', 'Occasional customer, cautious buyer')

select * from CUSTOMER

CREATE TABLE NATION (
    n_nationkey INT PRIMARY KEY,
    n_name VARCHAR(25),
    n_regionkey INT,
    n_comment VARCHAR(152),
    FOREIGN KEY (n_regionkey) REFERENCES REGION(r_regionkey)
);

INSERT INTO NATION (n_nationkey, n_name, n_regionkey, n_comment)
VALUES
(1, 'USA', 1, 'A major global economy, known for its technological advancements'),
(2, 'Canada', 1, 'Friendly neighbors, rich in natural resources'),
(3, 'Germany', 2, 'Highly industrialized, renowned for engineering and manufacturing'),
(4, 'France', 2, 'A cultural hub, known for fashion and art'),
(5, 'China', 3, 'World’s most populous country, major exporter of goods'),
(6, 'India', 3, 'Rapidly growing economy with a large and diverse population'),
(7, 'Brazil', 4, 'Largest country in South America, rich in natural resources'),
(8, 'Argentina', 4, 'Famous for its wine and vibrant culture'),
(9, 'Australia', 5, 'Known for its unique wildlife and vast deserts'),
(10, 'South Africa', 5, 'A diverse country, known for its rich history and wildlife');

select * from NATION

CREATE TABLE REGION (
    r_regionkey INT PRIMARY KEY,
    r_name VARCHAR(25),
    r_comment VARCHAR(152)
);

INSERT INTO REGION (r_regionkey, r_name, r_comment)
VALUES
(1, 'North America', 'Region encompassing countries such as the USA, Canada, and Mexico'),
(2, 'Europe', 'Region known for historical significance, diverse cultures, and economic powerhouses'),
(3, 'Asia', 'The largest and most populous continent, home to major global economies like China and India'),
(4, 'South America', 'Home to countries with rich natural resources, including Brazil and Argentina'),
(5, 'Oceania', 'A region known for its islands, including Australia and New Zealand'),
(6, 'Africa', 'The second-largest continent, rich in resources and diverse cultures'),
(7, 'Middle East', 'A region known for its oil-rich nations and historical significance'),
(8, 'Central America', 'A region connecting North and South America, with countries like Guatemala and Panama'),
(9, 'Caribbean', 'A region of islands in the Caribbean Sea, including countries like Cuba and Jamaica'),
(10, 'Eastern Europe', 'Region characterized by its post-Soviet states and rapid economic development');

select * from REGION

CREATE TABLE LINEITEM (
    l_orderkey INT,
    l_partkey INT,
    l_suppkey INT,
    l_linenumber INT,
    l_quantity DECIMAL(15, 2),
    l_extendedprice DECIMAL(15, 2),
    l_discount DECIMAL(15, 2),
    l_tax DECIMAL(15, 2),
    l_returnflag CHAR(1),
    l_linestatus CHAR(1),
    l_shipdate DATE,
    l_commitdate DATE,
    l_receiptdate DATE,
    l_shipinstruct CHAR(250),
    l_shipmode CHAR(100),
    l_comment VARCHAR(100),
    PRIMARY KEY (l_orderkey, l_linenumber),
    FOREIGN KEY (l_orderkey) REFERENCES ORDERS(o_orderkey),
    FOREIGN KEY (l_partkey) REFERENCES PART(p_partkey),
    FOREIGN KEY (l_suppkey) REFERENCES SUPPLIER(s_suppkey)
);


INSERT INTO LINEITEM (l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate, l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
VALUES
(1, 1, 101, 1, 100.00, 1500.00, 0.05, 0.10, 'N', 'O', '2025-03-02', '2025-03-04', '2025-03-06', 'Deliver at the dock', 'AIR', 'First shipment for new customer'),
(2, 2, 102, 1, 200.00, 3200.00, 0.07, 0.09, 'N', 'O', '2025-03-03', '2025-03-05', '2025-03-08', 'Ship urgently', 'AIR', 'Bulk purchase with special discount'),
(3, 3, 103, 1, 150.00, 2250.00, 0.05, 0.08, 'Y', 'F', '2025-03-04', '2025-03-06', '2025-03-09', 'Ship in original packaging', 'ROAD', 'Return requested on item'),
(4, 4, 104, 1, 120.00, 1800.00, 0.15, 0.14, 'N', 'O', '2025-03-05', '2025-03-06', '2025-03-10', 'Assemble before shipping', 'SEA', 'Order for bulk resupply'),
(5, 5, 105, 1, 180.00, 2700.00, 0.10, 0.12, 'N', 'O', '2025-03-06', '2025-03-07', '2025-03-11', 'Priority delivery requested', 'AIR', 'Customer has urgent need'),
(6, 6, 106, 1, 220.00, 3300.00, 0.08, 0.13, 'Y', 'F', '2025-03-07', '2025-03-09', '2025-03-12', 'Ship on customer account', 'ROAD', 'Cancelled return request'),
(7, 7, 107, 1, 110.00, 1650.00, 0.05, 0.10, 'N', 'O', '2025-03-08', '2025-03-10', '2025-03-13', 'Customer contact for delivery time', 'SEA', 'Order shipped on time'),
(8, 8, 108, 1, 90.00, 1350.00, 0.12, 0.09, 'Y', 'F', '2025-03-09', '2025-03-11', '2025-03-14', 'Express delivery requested', 'AIR', 'Partial shipment delivered'),
(9, 9, 109, 1, 250.00, 3750.00, 0.10, 0.11, 'N', 'O', '2025-03-10', '2025-03-12', '2025-03-15', 'On hold for quality check', 'ROAD', 'Order is delayed'),
(10, 10, 110, 1, 50.00, 750.00, 0.10, 0.12, 'N', 'O', '2025-03-02', '2025-03-05', '2025-03-07', 'Handle with care', 'SEA', 'Second line of order')

select * from LINEITEM

CREATE TABLE ORDERS (
    o_orderkey INT PRIMARY KEY,
    o_custkey INT,
    o_orderstatus CHAR(1),
    o_totalprice DECIMAL(15, 2),
    o_orderdate DATE,
    o_orderpriority CHAR(15),
    o_clerk CHAR(15),
    o_shippriority INT,
    o_comment VARCHAR(79),
    FOREIGN KEY (o_custkey) REFERENCES CUSTOMER(c_custkey)
);


INSERT INTO ORDERS (o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate, o_orderpriority, o_clerk, o_shippriority, o_comment)
VALUES
(1, 1, 'O', 2500.75, '2025-03-01', 'High', 'ClerkA', 0, 'First order, needs priority processing'),
(2, 2, 'P', 3200.50, '2025-03-02', 'Low', 'ClerkB', 1, 'Pending, awaiting payment confirmation'),
(3, 3, 'O', 1500.20, '2025-03-03', 'Medium', 'ClerkC', 0, 'Order placed, awaiting shipment'),
(4, 4, 'P', 4500.75, '2025-03-04', 'High', 'ClerkD', 2, 'High priority order, expedited shipping'),
(5, 5, 'O', 5000.30, '2025-03-05', 'Low', 'ClerkE', 1, 'Scheduled for delivery next week'),
(6, 6, 'O', 3700.40, '2025-03-06', 'Medium', 'ClerkF', 0, 'Standard order, routine processing'),
(7, 7, 'P', 6000.00, '2025-03-07', 'High', 'ClerkG', 1, 'Urgent order, needs faster shipping'),
(8, 8, 'O', 2800.10, '2025-03-08', 'Medium', 'ClerkH', 0, 'Order confirmed, ready for processing'),
(9, 9, 'O', 7200.90, '2025-03-09', 'High', 'ClerkI', 2, 'Large volume order, expedited shipping required'),
(10, 10, 'P', 1100.60, '2025-03-10', 'Low', 'ClerkJ', 1, 'Pending, waiting on product availability');

select * from ORDERS

/* 1- What	are	the	names	of	the	customers	who	have	a	balance	that	is	greater	than	$9000 and	are	in	the	
“HOUSEHOLD”	market	segment?*/

select c_name from CUSTOMER
where c_acctbal > 9000.0 and c_mktsegment = 'household'

/* 2- Which	parts	are	supplied	by	at	least	1	supplier	from	the	region	“MIDDLE	EAST”?	Include	the	part	
name	in	your	answer	along	with	the	part	key. Eliminate	any	duplicates	and	sort	your	answer	based	on	
the	part	key.*/

select distinct P.p_partkey,P.p_name from PART P
inner join PARTSUPP PS on PS.ps_partkey = p.p_partkey 
inner join SUPPLIER S on S.s_suppkey = PS.ps_suppkey
inner join NATION N on N.n_nationkey = S.s_nationkey
inner join REGION R on R.r_regionkey = N.n_regionkey
where R.r_name = 'MIDDLE EAST'
order by P.p_partkey


/* 3- How	many distinct parts	are	supplied	by	European	suppliers?*/
select distinct P.p_partkey,S.s_name
from PART P
inner join PARTSUPP SP on SP.ps_partkey = P.p_partkey 
inner join SUPPLIER S on SP.ps_suppkey = S.s_suppkey
where S.s_nationkey = 2


/* 4- Which	parts	are	not	supplied	by	any	supplier	from	EUROPE?	Include	the	part	name	in	your	answer.*/
SELECT P.p_partkey, P.p_name
FROM PART P
WHERE P.p_partkey NOT IN (
    SELECT DISTINCT PS.ps_partkey
    FROM PARTSUPP PS
    JOIN SUPPLIER S ON PS.ps_suppkey = S.s_suppkey
    JOIN NATION N ON S.s_nationkey = N.n_nationkey
    JOIN REGION R ON N.n_regionkey = R.r_regionkey
    WHERE S.s_nationkey = 2
);

/* 5- Which	customers	ordered	parts	ONLY	from	suppliers	in	the	same	region? Include	the	customer	name,
phone and	region in	your	answer,	and	remove	any	duplicates.*/
SELECT DISTINCT C.c_name, C.c_phone, R1.r_name AS customer_region
FROM CUSTOMER C
JOIN NATION N1 ON C.c_nationkey = N1.n_nationkey
JOIN REGION R1 ON N1.n_regionkey = R1.r_regionkey
JOIN ORDERS O ON C.c_custkey = O.o_custkey
JOIN LINEITEM L ON O.o_orderkey = L.l_orderkey
JOIN PARTSUPP PS ON L.l_partkey = PS.ps_partkey AND L.l_suppkey = PS.ps_suppkey
JOIN SUPPLIER S ON PS.ps_suppkey = S.s_suppkey
JOIN NATION N2 ON S.s_nationkey = N2.n_nationkey
JOIN REGION R2 ON N2.n_regionkey = R2.r_regionkey
GROUP BY C.c_name, C.c_phone, R1.r_name
HAVING COUNT(DISTINCT R2.r_name) = 1 
AND MAX(R1.r_name) = MAX(R2.r_name);  

/* 6- What	is	the	highest	extended	price	for	parts	that	had	a	discount	larger	than	the	tax	when	ordered?*/
select max()

