/*1*/
/*SELECT name,description,condition FROM Product ORDER BY name ASC;*/


ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

/*2*/
/*SELECT name,surname,email FROM UserData WHERE gold_flag='Y' AND gold_start_date='08/06/2020';*/

/*3*/

/*SELECT name, surname FROM UserData WHERE email IN (SELECT bidder_email FROM Bid WHERE bidding_date='22/08/2018');*/

/*4*/

/*SELECT name, description FROM Product 
                         WHERE contained_order_id IN
                         (SELECT id FROM Orders WHERE orderer_email IN
                         (SELECT email FROM UserData WHERE name='donald' AND surname='trump'));*/

/*5*/
SELECT p.name, p.description, b.bidding_price FROM Product p, Bid b WHERE b.bidding_price IN(SELECT MAX(bidding_price) FROM Bid bid_product_id WHERE bid_product_id IN  (SELECT id FROM Product));


/*6*/
/*SELECT DISTINCT name, description FROM Product WHERE id NOT IN(SELECT bid_product_id FROM Bid WHERE bid_product_id IN(SELECT id FROM Product)); */
						
						    