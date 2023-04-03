/*
MYSQL

GROUP AI
Saloni S.S.
Fiona A.A.
Maithilii M.P.
Brinda P. 

*/



CREATE DATABASE  IF NOT EXISTS `FINAL`;
USE `FINAL`;
select 'Building demonstration tables.  Please wait.' as '';


DROP TABLE IF EXISTS agency;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS house;
DROP TABLE IF EXISTS flat;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS forSale;
DROP TABLE IF EXISTS forRent;
DROP TABLE IF EXISTS sold;



/* AGENCY */
CREATE TABLE agency(
    ID int primary key,
    Name varchar(255) NOT NULL,
    PhoneNumber varchar(255) NOT NULL,
    UNIQUE(PhoneNumber)
    );


INSERT INTO agency VALUES(1, "The Simpsons", 98161774839);
INSERT INTO agency VALUES(2, "Modern Family", 70008950218);
INSERT INTO agency VALUES(3, "The Office", 123456789);
INSERT INTO agency VALUES(4, "Friends", 87922821370);
INSERT INTO agency VALUES(5, "Stranger Things", 5521334719);
INSERT INTO agency VALUES(6, "Grey's Anatomy", 1224524411);
INSERT INTO agency VALUES(7, "The Crown", 8899816816);
INSERT INTO agency VALUES(8, "NCIS", 2147091643);
INSERT INTO agency VALUES(9, "Game of Thrones", 7040107423);
INSERT INTO agency VALUES(10, "Survivor", 1793898353);


/* OFFICE */
CREATE TABLE office(
    OfficeID int primary key,
    AgencyId int REFERENCES agency(ID),
    Area varchar(255) NOT NULL,
    District varchar(1) NOT NULL,
    Sector int(11) NOT NULL,
    Unit varchar(255) NOT NULL CHECK(LENGTH(Unit)<=2),
    PhoneNumber varchar(255) NOT NULL,
    UNIQUE(PhoneNumber)
);


INSERT INTO office VALUES(1, 1, "E","1","4","NS", 07722821381); #Essex
INSERT INTO office VALUES(2, 1, "M","2","5","SN", 87922821382); #Manchester
INSERT INTO office VALUES(3, 2, "L","5","8","DH", 87922881373); #London
INSERT INTO office VALUES(4, 2, "B","6","9","HD", 87522821374); #Brighton
INSERT INTO office VALUES(5, 3, "D","1","4","UH", 123456749); #Dorset
INSERT INTO office VALUES(6, 4, "K","3","4","GR", 124456789); #Kent
INSERT INTO office VALUES(7, 1, "Y","9","4","PA", 123456489); #York
INSERT INTO office VALUES(8, 6, "H","1","4","OL", 123444789); #Hursley
INSERT INTO office VALUES(9, 2, "K","5","4","QQ", 1789056789); #Kent
INSERT INTO office VALUES(10, 9, "G","2","4","FN", 2147091643); #Glasgow


/* PROPERTY */
CREATE TABLE property(
    PropertyID int primary key,
    Area varchar(255) NOT NULL,
    District varchar(1) NOT NULL,
    Sector int(11) NOT NULL,
    Unit varchar(255) NOT NULL CHECK(LENGTH(Unit)<=2),
    City varchar(255) NOT NULL,
    Price int,
    NumBedrooms int(1) NOT NULL,
    Description varchar(255)
    );


INSERT INTO property VALUES(1, "E","1","9","AB","Essex", 20000, 3, "1st floor flat");
INSERT INTO property VALUES(2, "E","9","6","CD","Essex", 4897000, 2, "1 storey bungalow");
INSERT INTO property VALUES(3, "E","6","4","EF","Essex", 3900500,1, "3 storey standalone villa");
INSERT INTO property VALUES(4, "E","5","2","VE","Essex", 300500, 1, "1st floor flat - Student Accommodation");
INSERT INTO property VALUES(5, "E","7","4","FN","Essex", 3900500, 1, "3 storey standalone villa");
INSERT INTO property VALUES(6, "M","8","6","GH","Manchester", 280000, 2, "2 storey townhouse");
INSERT INTO property VALUES(7, "M","7","3","IJ","Manchester",7055000, 3, "Ground floor flat");
INSERT INTO property VALUES(8, "L","4","4","KL","London", 1450000, 3, "7th floor flat");
INSERT INTO property VALUES(9, "L","2","8","MN","London", 72000, 2, "4th floor flat");
INSERT INTO property VALUES(10, "L","6","3","JT","London", 72000, 2, "8th floor flat - Student Accommodation");
INSERT INTO property VALUES(11, "B","2","4","OP","Brighton", 487000, 2, "1 storey bungalow");
INSERT INTO property VALUES(12, "B","9","2","QR","Brighton", 17000, 1, "2nd floor flat");
INSERT INTO property VALUES(13, "B","4","7", "ST","Brighton", 305000, 2, "3 storey townhouse");
INSERT INTO property VALUES(14, "B","9","1","GU","Brighton",15501, 3, "2 storey standalone villa");
INSERT INTO property VALUES(15, "B","4","1","KS","Brighton",9900, 3, "5th floor flat");
INSERT INTO property VALUES(16, "D","5","4","QR","Dorset", 305000, 3, "2 storey townhouse");
INSERT INTO property VALUES(17, "D","8","8","YX","Dorset", 172147, 3, "3 storey standalone villa");
INSERT INTO property VALUES(18, "D","2","8","VC","Dorset", 355720, 3, "3 bedroom house in countryside");
INSERT INTO property VALUES(19, "K","5","4","QS","Kent", 300000,  3, "2 storey townhouse");
INSERT INTO property VALUES(20, "Y","9","5","RM","York", 426588, 3, "2 storey townhouse");
INSERT INTO property VALUES(21, "Y","7","7","DC","York", 209445, 2, "9th floor flat");
INSERT INTO property VALUES(22, "Y","3","1","AF","York", 365207, 3, "1 storey bungalow");
INSERT INTO property VALUES(23, "Y","1","1","GX","York", 111540, 1, "8th floor flat in countryside");
INSERT INTO property VALUES(24, "H","5","9","ZU","Hursley", 300000, 3, "3 storey standalone villa");
INSERT INTO property VALUES(25, "H","7","4","IM","Hursley", 409445, 3, "10th floor flat in countryside");
INSERT INTO property VALUES(26, "G","5","5","NY","Glasgow", 592484, 3, "1 storey bungalow");
INSERT INTO property VALUES(27, "G","6","6","EI","Glasgow", 382149, 2, "2 storey townhouse");
INSERT INTO property VALUES(28, "G","7","1","YH","Glasgow", 463079, 2, "6th floor flat");
INSERT INTO property VALUES(29, "G","5","9","UD","Glasgow", 192157, 1, "3rd floor flat");
INSERT INTO property VALUES(30, "G","2","4","QT","Glasgow", 300000, 1,  "2 storey standalone villa");


/* HOUSE */
CREATE TABLE house(
    PropertyID int,
    constraint fk_propid_house foreign key (PropertyID) REFERENCES property(PropertyID),
    HouseId int primary key,
    Story int(1) NOT NULL,
    HouseType varchar(255) NOT NULL
    );


INSERT INTO house VALUES(1,2,1, "bungalow");
INSERT INTO house VALUES(2,3,3, "standalone villa");
INSERT INTO house VALUES(3,5,3, "standalone villa");
INSERT INTO house VALUES(4,6,2, "townhouse");
INSERT INTO house VALUES(5,11,1, "bungalow");
INSERT INTO house VALUES(6,13,3, "townhouse");
INSERT INTO house VALUES(7,14,2, "standalone villa");
INSERT INTO house VALUES(8,16,2, "townhouse");
INSERT INTO house VALUES(9,17,3, "standalone villa");
INSERT INTO house VALUES(10,18,2, "standalone villa");
INSERT INTO house VALUES(11,19,2, "townhouse");
INSERT INTO house VALUES(12,20,2, "townhouse");
INSERT INTO house VALUES(13,22,1, "bungalow");
INSERT INTO house VALUES(14,24,3, "standalone villa");
INSERT INTO house VALUES(15,26,1, "bungalow");
INSERT INTO house VALUES(16,27,2, "townhouse");
INSERT INTO house VALUES(17,30,2, "standalone villa");

/* FLAT */
CREATE TABLE flat(
    PropertyID int,
    constraint fk_propid_flat foreign key (PropertyID) REFERENCES property(PropertyID),
    FlatId int primary key,
    Floornum int(1) NOT NULL
    );


INSERT INTO flat VALUES(1,1,3);
INSERT INTO flat VALUES(2,4,1);
INSERT INTO flat VALUES(3,7,0);
INSERT INTO flat VALUES(4,8,7);
INSERT INTO flat VALUES(5,9,4);
INSERT INTO flat VALUES(6,10,8);
INSERT INTO flat VALUES(7,12,2);
INSERT INTO flat VALUES(8,15,5);
INSERT INTO flat VALUES(9,21,9);
INSERT INTO flat VALUES(10,23,8);
INSERT INTO flat VALUES(11,25,10);
INSERT INTO flat VALUES(12,28,6);
INSERT INTO flat VALUES(13,29,3);


/* CUSTOMER */
CREATE TABLE customer(
    CustomerID int primary key,
    Forename varchar(255) NOT NULL,
    Surname varchar(255) NOT NULL,
    PhoneNumber varchar(255) NOT NULL,
    UNIQUE(PhoneNumber)
    );


INSERT INTO customer VALUES(1, "Munya", "Chawawa", 5446536747);
INSERT INTO customer VALUES(2, "Choi", "SungCheol", 325336547);
INSERT INTO customer VALUES(3, "Kareena", "Kapoor", 2338769978);
INSERT INTO customer VALUES(4, "Mustafa", "Bozkurt", 78608334356);
INSERT INTO customer VALUES(5, "Sam", "Ryder", 68564261);
INSERT INTO customer VALUES(6, "Barack", "Obama", 98776261);
INSERT INTO customer VALUES(7, "Maghan", "Markle", 208767661);
INSERT INTO customer VALUES(8, "Jack", "Whitehall", 2134356561);
INSERT INTO customer VALUES(9, "Shila", "Amzah", 8975875);
INSERT INTO customer VALUES(10, "Kevin", "Nguyen", 66574741);


/* FORSALE */
CREATE TABLE forSale(
    PropertyID int,
    OfficeID int,
    constraint fk_sale_propid foreign key (PropertyID) REFERENCES property(PropertyID),
    constraint fk_sale_offid foreign key (OfficeID) REFERENCES office(OfficeID)
    );


INSERT INTO forSale VALUES(2, 1);
INSERT INTO forSale VALUES(3, 2);
INSERT INTO forSale VALUES(4, 3);
INSERT INTO forSale VALUES(13, 4);
INSERT INTO forSale VALUES(16, 4);
INSERT INTO forSale VALUES(17, 3);
INSERT INTO forSale VALUES(18, 8);
INSERT INTO forSale VALUES(20, 6);
INSERT INTO forSale VALUES(21, 7);
INSERT INTO forSale VALUES(26, 8);


/* FORRENT */
CREATE TABLE forRent(
    PropertyID int,
    OfficeID int,
    constraint fk_rent_propid foreign key (PropertyID) REFERENCES property(PropertyID),
    constraint fk_rent_offid foreign key (OfficeID) REFERENCES office(OfficeID)
    );


INSERT INTO forRent VALUES(1, 1);
INSERT INTO forRent VALUES(6, 3);
INSERT INTO forRent VALUES(7, 4);
INSERT INTO forRent VALUES(9, 4);
INSERT INTO forRent VALUES(10, 8);
INSERT INTO forRent VALUES(12, 5);
INSERT INTO forRent VALUES(14, 7);
INSERT INTO forRent VALUES(19, 7);
INSERT INTO forRent VALUES(27, 2);
INSERT INTO forRent VALUES(28, 1);


/* SOLD */
CREATE TABLE sold(
    PropertyID int,
    OfficeID int,
    CustomerID int,
    constraint fk_sold_propid foreign key (PropertyID) REFERENCES property(PropertyID),
    constraint fk_sold_offid foreign key (OfficeID) REFERENCES office(OfficeID),
    constraint fk_sold_custid foreign key (CustomerID) REFERENCES customer(CustomerID)
    );


INSERT INTO sold VALUES(5, 1, 1);
INSERT INTO sold VALUES(8, 3, 2);
INSERT INTO sold VALUES(11, 4, 8);
INSERT INTO sold VALUES(15, 4, 6);
INSERT INTO sold VALUES(22, 7, 4);
INSERT INTO sold VALUES(23, 7, 8);
INSERT INTO sold VALUES(24, 8, 5);
INSERT INTO sold VALUES(25, 8, 7);
INSERT INTO sold VALUES(29, 10, 3);
INSERT INTO sold VALUES(30, 10, 9);




COMMIT;


select 'PROMPT Demonstration table build is complete.' as '';


/* BASIC QUERIES */

SELECT AVG(Price) FROM property WHERE AREA="L";

/*
Selects average price of a property in London.
EXPECTED OUTCOME:
+-------------+
| AVG(Price)  |
+-------------+
| 531333.3333 |
+-------------+
*/

SELECT A.Name, O.Area FROM agency A LEFT JOIN office O ON A.ID=O.AgencyID;

/*
Shows all areas where agencies are found.
EXPECTED OUTCOME:
+-----------------+------+
| Name            | Area |
+-----------------+------+
| The Simpsons    | E    |
| The Simpsons    | M    |
| Modern Family   | L    |
| Modern Family   | B    |
| The Office      | D    |
| Friends         | K    |
| The Simpsons    | Y    |
| Grey's Anatomy  | H    |
| Modern Family   | K    |
| Game of Thrones | G    |
| Stranger Things | NULL |
| The Crown       | NULL |
| NCIS            | NULL |
| Survivor        | NULL |
+-----------------+------+
*/


/* MEDIUM QUERIES */

SELECT A.Price AS Price1, A.City, A.Description, B.Price AS Price2, B.City, B.Description FROM property A, property B WHERE A.City <> B.City AND A.Price = B.Price ORDER BY A.Price;

/*
Shows properties with same price in different cities - so you can compare what your money will get you in different areas.
EXPECTED OUTCOME:
+---------+------------+---------------------------+---------+------------+---------------------------+
| Price1  | City       | Description               | Price2  | City       | Description               |
+---------+------------+---------------------------+---------+------------+---------------------------+
|  300000 | Hursley    | 3 storey standalone villa |  300000 | Kent       | 2 storey townhouse        |
|  300000 | Glasgow    | 2 storey standalone villa |  300000 | Kent       | 2 storey townhouse        |
|  300000 | Kent       | 2 storey townhouse        |  300000 | Hursley    | 3 storey standalone villa |
|  300000 | Glasgow    | 2 storey standalone villa |  300000 | Hursley    | 3 storey standalone villa |
|  300000 | Kent       | 2 storey townhouse        |  300000 | Glasgow    | 2 storey standalone villa |
|  300000 | Hursley    | 3 storey standalone villa |  300000 | Glasgow    | 2 storey standalone villa |
|  305000 | Dorset     | 2 storey townhouse        |  305000 | Brighton   | 3 storey townhouse        |
|  305000 | Brighton   | 3 storey townhouse        |  305000 | Dorset     | 2 storey townhouse        |
| 4555000 | Manchester | Ground floor flat         | 4555000 | Essex      | 1 storey bungalow         |
| 4555000 | Essex      | 1 storey bungalow         | 4555000 | Manchester | Ground floor flat         |
+---------+------------+---------------------------+---------+------------+---------------------------+
*/

SELECT C.Forename, AVG(P.Price)  from property P
JOIN sold S
ON S.PropertyID = P.PropertyID
RIGHT OUTER JOIN customer C
ON C.CustomerId = S.CustomerID
GROUP BY C.Forename;

/*
Finds the average price of properties bought by customers and groups by customer forename. Also includes customers that have not bought anything.
EXPECTED OUTCOME:
+----------+--------------+
| Forename | AVG(P.Price) |
+----------+--------------+
| Munya    | 3900500.0000 |
| Choi     | 1450000.0000 |
| Kareena  |  192157.0000 |
| Mustafa  |  365207.0000 |
| Sam      |  300000.0000 |
| Barack   |   15500.0000 |
| Maghan   |  409445.0000 |
| Jack     |  299270.0000 |
| Shila    |  300000.0000 |
| Kevin    |         NULL |
+----------+--------------+
*/

SELECT COUNT(HouseType), AVG(Price),  H.HouseType
FROM house H JOIN property P ON H.PropertyID = P.PropertyID
GROUP BY H.HouseType having H.HouseType = "bungalow";

/*
Shows the average price of each type of house in a specific area (in this example a bungalow).
EXPECTED OUTCOME:
+------------------+--------------+-----------+
| COUNT(HouseType) | AVG(Price)   | HouseType |
+------------------+--------------+-----------+
|                4 | 1060250.0000 | bungalow  |
+------------------+--------------+-----------+
*/


/* ADVANCED QUERIES */

SELECT info.Name, info.PhoneNumber from
(SELECT Area, AVG(Price) from property GROUP BY Area having AVG(Price)>500000) avgInfo
INNER JOIN
(select A.Name, O.PhoneNumber, O.Area from agency A INNER JOIN office O where A.ID = O.AgencyID) info
WHERE info.Area = avgInfo.Area;

/*
Gets the name and office phone number of the agencies that have offices in areas where the average price is more than 500,000.
EXPECTED OUTCOME:
+---------------+-------------+
| Name          | PhoneNumber |
+---------------+-------------+
| The Simpsons  | 7722821381  |
| The Simpsons  | 87922821382 |
| Modern Family | 87922881373 |
+---------------+-------------+
*/

CREATE VIEW AGENCIES AS SELECT A.Name, P.Price, P.Description FROM agency A INNER JOIN office O ON  O.AgencyID = A.ID JOIN property P ON P.Area = O.Area  WHERE  P.Price > (SELECT AVG(Price) FROM property)  AND P.NumBedrooms >=3;

SELECT * FROM AGENCIES;

/*
Shows agency, price and description of properties which have 3 bedrooms or more and price is greater than the average price.
EXPECTED OUTCOME: 
+---------------+---------+-------------------+
| Name          | Price   | Description       |
+---------------+---------+-------------------+
| The Simpsons  | 4555000 | Ground floor flat |
| Modern Family | 1450000 | 7th floor flat    |
+---------------+---------+-------------------+
*/


SELECT "Flat" as Type, MIN(flatInfo.Price) as MIN_Price, MAX(flatInfo.Price) as MAX_Price, AVG(flatInfo.Price/12) as AVG_MonthlyPay, COUNT(flatInfo.Price) as NumOfProperties
FROM (select P.Price from property P JOIN flat F ON P.PropertyID = F.FlatID) flatInfo
UNION
SELECT "House", MIN(houseInfo.Price), MAX(houseInfo.Price), AVG(houseInfo.Price/12), COUNT(houseInfo.Price)
FROM (select P.Price from property P JOIN house H ON P.PropertyID = H.HouseID) houseInfo;

/*
Selects the minimum and maximum prices of houses and flats.
EXPECTED OUTCOME: 
+-------+-----------+-----------+----------------+-----------------+
| Type  | MIN_Price | MAX_Price | AVG_MonthlyPay | NumOfProperties |
+-------+-----------+-----------+----------------+-----------------+
| Flat  |      9900 |   7055000 | 66551.70512820 |              13 |
| House |     15501 |   4897000 | 84729.39215686 |              17 |
+-------+-----------+-----------+----------------+-----------------+
*/
