DROP TABLE Bid;
DROP TABLE FixedProduct;
DROP TABLE AuctionProduct;
DROP TABLE Product;
DROP TABLE Orders;
DROP TABLE Address;
DROP TABLE UserData;


CREATE TABLE UserData(
    email VARCHAR2(20) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    surname VARCHAR2(10) NOT NULL,
    tel NUMBER NOT NULL,
    gold_flag CHAR(1) NOT NULL,
    gold_start_date DATE,
    gold_end_date DATE,
    PRIMARY KEY(email)
);

CREATE TABLE Address(
    id VARCHAR2(5) NOT NULL,
    user_email VARCHAR2(20) NOT NULL, 
    city VARCHAR2(10) NOT NULL, 
    line1 VARCHAR2(40) NOT NULL, 
    line2 VARCHAR2(40),
    PRIMARY KEY(id),
    FOREIGN KEY (user_email) REFERENCES UserData(email)
);

CREATE TABLE Orders(
    id VARCHAR2(5) NOT NULL,
    status VARCHAR2(10) NOT NULL,
    total_price NUMBER,
    delivery_flag CHAR(1),
    delivery_price NUMBER,
    delivery_date VARCHAR2(12),
    delivery_address_id VARCHAR2(5),
    orderer_email VARCHAR2(20) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_delivery_address FOREIGN KEY (delivery_address_id) REFERENCES Address(id),
    CONSTRAINT fk_orderer FOREIGN KEY (orderer_email) REFERENCES UserData(email)
);

CREATE TABLE Product(
    id VARCHAR2(5) NOT NULL, 
    name VARCHAR2(20) NOT NULL, 
    description VARCHAR2(40),
    condition VARCHAR2(20), 
    seller_email VARCHAR2(20) NOT NULL, 
    contained_order_id VARCHAR2(5),
    located_address_id VARCHAR2(5) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_seller FOREIGN KEY (seller_email) REFERENCES UserData(email),
    CONSTRAINT fk_contained_order FOREIGN KEY (contained_order_id) REFERENCES Orders(id),
    CONSTRAINT fk_located_address FOREIGN KEY (located_address_id) REFERENCES Address(id)
);

CREATE TABLE FixedProduct(
    id VARCHAR2(5) NOT NULL,
    price NUMBER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id) REFERENCES Product(id)
);

CREATE TABLE AuctionProduct(
    id VARCHAR2(5) NOT NULL,
    start_price NUMBER NOT NULL,
    final_price NUMBER,
    deadline VARCHAR2(81) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id) REFERENCES Product(id)
);


CREATE TABLE Bid(
    bid_product_id VARCHAR2(5) NOT NULL,
    bidder_email VARCHAR2(20) NOT NULL,
    bidding_price NUMBER NOT NULL,
    bidding_date VARCHAR2(12) NOT NULL,
    PRIMARY KEY(bid_product_id, bidder_email, bidding_price),
    CONSTRAINT fk_bidder FOREIGN KEY (bidder_email) REFERENCES UserData(email),
    CONSTRAINT fk_bid_product FOREIGN KEY (bid_product_id) REFERENCES AuctionProduct(id)
);

--USER
Insert into UserData (email, name, surname, tel, gold_flag, gold_start_date, gold_end_date) values ('haver@metu.edu.tr',   'paul',     'haver',    '+905488357835', 'Y', TO_DATE ('05/04/2019', 'DD/MM/YYYY'), TO_DATE ('05/04/2022', 'DD/MM/YYYY'));
Insert into UserData (email, name, surname, tel, gold_flag, gold_start_date, gold_end_date) values ('trump@metu.edu.tr',   'donald',   'trump',    '+905868321865', 'Y', TO_DATE ('08/06/2020', 'DD/MM/YYYY'), TO_DATE ('08/06/2025', 'DD/MM/YYYY'));
Insert into UserData (email, name, surname, tel, gold_flag, gold_start_date, gold_end_date) values ('jordan@metu.edu.tr',  'michael',  'jordan',   '+905268433216', 'Y', TO_DATE ('05/04/2021', 'DD/MM/YYYY'), TO_DATE ('05/04/2022', 'DD/MM/YYYY'));
Insert into UserData (email, name, surname, tel, gold_flag, gold_start_date, gold_end_date) values ('smith@metu.edu.tr',   'sam',      'smith',    '+905313237994', 'Y', TO_DATE ('01/08/2017', 'DD/MM/YYYY'), TO_DATE ('01/08/2023', 'DD/MM/YYYY'));
Insert into UserData (email, name, surname, tel, gold_flag) values ('scott@metu.edu.tr',   'michael',  'scott',    '+905516843219', 'N');
Insert into UserData (email, name, surname, tel, gold_flag) values ('cooper@metu.edu.tr',  'sheldon',  'cooper',   '+905451324533', 'N');
Insert into UserData (email, name, surname, tel, gold_flag) values ('bing@metu.edu.tr',    'chandler', 'bing',     '+905463218853', 'N');


--ADDRESS
Insert into Address(id, user_email, city, line1, line2) values ('1', 'haver@metu.edu.tr', 'nicosia', '76 Archiepiskopou Makariou Iii', '2682 Palaiometocho');
Insert into Address(id, user_email, city, line1) values ('2', 'haver@metu.edu.tr', 'nicosia', '87 Konstantinou Kalogera Antigoni Court');
Insert into Address(id, user_email, city, line1, line2) values ('3', 'haver@metu.edu.tr', 'kyrenia', 'Flat 10 1080', '53 Dimosthenous Severi Ave');

Insert into Address(id, user_email, city, line1) values ('4', 'trump@metu.edu.tr', 'kyrenia', '4 Diagorou 1097');
Insert into Address(id, user_email, city, line1) values ('5', 'trump@metu.edu.tr', 'nicosia', '1 Lordou Vyronos P.O. Box 0 7060 Livadia');

Insert into Address(id, user_email, city, line1, line2) values ('6', 'jordan@metu.edu.tr', 'famagusta', '27 Pavlou Michaila Pavlou Bldg', '7104 Aradippou');

Insert into Address(id, user_email, city, line1) values ('7', 'scott@metu.edu.tr', 'nicosia', '3 Zinona 8010,');
Insert into Address(id, user_email, city, line1) values ('8', 'scott@metu.edu.tr', 'kyrenia', '9 Georgiou Griva Digeni 2310 Lakatameia');

Insert into Address(id, user_email, city, line1) values ('9', 'cooper@metu.edu.tr', 'famagusta', '7 Athinon Ave Tolmi Bldg');

Insert into Address(id, user_email, city, line1, line2) values ('10', 'bing@metu.edu.tr', 'kyrenia', '3 Dimosthenous', 'Severi Ave 1066');


--Order
Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('1', 'complete', 1800, 'N', NULL, NULL, NULL, 'trump@metu.edu.tr');
Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('2', 'complete', 10000, 'Y', 100, '1/1/2022', '7', 'scott@metu.edu.tr');

Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('3', 'incomplete', NULL, NULL, NULL, NULL, NULL, 'haver@metu.edu.tr');

Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('4', 'complete', 7000, 'N', NULL, NULL, NULL, 'scott@metu.edu.tr');

Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('5', 'incomplete', NULL, 'Y', 200, '30/2/2022', '10', 'bing@metu.edu.tr');
Insert into Orders(id, status, total_price, delivery_flag, delivery_price, delivery_date, delivery_address_id, orderer_email)
            values('6', 'complete', 2000, 'N', NULL, NULL, NULL, 'trump@metu.edu.tr');


--Product
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(1, 'watch', NULL, 'very good', 'jordan@metu.edu.tr', '6', '1');
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(2, 'phone', 'galaxy11', 'good', 'jordan@metu.edu.tr', '6', '1');

Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(3, 'car', 'BMW i8', 'not used', 'trump@metu.edu.tr', '4', NULL);
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(4, 'shoes', 'jordan shoes', 'very good', 'trump@metu.edu.tr', '5', '2');
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(5, 'headphone', 'jabra elite', 'not bad', 'trump@metu.edu.tr', '5', '3');

Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(6, 'matress', '200cm*200cm', 'old', 'haver@metu.edu.tr', '1', '4');
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(7, 'screen', NULL, 'good', 'haver@metu.edu.tr', '3', NULL);

Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(8, 'TV', 'LG model s30', 'very good', 'scott@metu.edu.tr', '8', NULL);

Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(9, 'kitchen untensils', '4 plate, 6 spoons, 6 forks', 'very good', 'cooper@metu.edu.tr', '9', '5');
Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(10, 'car', NULL, 'old', 'cooper@metu.edu.tr', '9', NULL);

Insert into Product(id, name, description, condition, seller_email, located_address_id, contained_order_id)
            values(11, 'physics book', NULL, 'good', 'bing@metu.edu.tr', '10', '6');


--FixedProduct
Insert into FixedProduct(id, price)
            values(1, 300);
Insert into FixedProduct(id, price)
            values(3, 40000);
Insert into FixedProduct(id, price)
            values(5, 1000);
Insert into FixedProduct(id, price)
            values(7, 500);
Insert into FixedProduct(id, price)
            values(9, 50);
Insert into FixedProduct(id, price)
            values(11, 100);


--AuctionProduct
Insert into AuctionProduct(id, start_price, final_price, deadline)
            values(2, 1000, 1500, '30/08/2017');
Insert into AuctionProduct(id, start_price, final_price, deadline)
            values(4, 2000, 4000,'30/08/2018');
Insert into AuctionProduct(id, start_price, final_price, deadline)
            values(6, 100, 100, '30/08/2021');
Insert into AuctionProduct(id, start_price, final_price, deadline)
            values(8, 300, NULL, '10/1/2022');
Insert into AuctionProduct(id, start_price, final_price, deadline)
            values(10, 3000, NULL, '15/1/2022');


--Bid
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(2, 'trump@metu.edu.tr', 1000, '20/08/2017');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(2, 'haver@metu.edu.tr', 1100, '21/08/2017');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(2, 'cooper@metu.edu.tr', 1200, '22/08/2017');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(2, 'haver@metu.edu.tr', 1300, '27/08/2017');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(2, 'trump@metu.edu.tr', 1500, '29/08/2017');

Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(4, 'cooper@metu.edu.tr', 2100, '22/08/2018');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(4, 'smith@metu.edu.tr', 3300, '22/08/2018');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(4, 'scott@metu.edu.tr', 4000, '22/08/2018');

Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(6, 'scott@metu.edu.tr', 100, '22/08/2021');

Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(8, 'cooper@metu.edu.tr', 400, '3/1/2022');
Insert into Bid(bid_product_id, bidder_email, bidding_price, bidding_date)
            values(8, 'bing@metu.edu.tr', 500, '4/1/2022');



