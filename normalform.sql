



-- ----- CHECK 1NF
SELECT *
FROM transactions

-- 3455
SELECT COUNT(*)
FROM transactions

-- 3455
SELECT COUNT(*)
FROM( SELECT DISTINCT * FROM transactions ) AS a

-- ----- CHECK 2NF
SELECT *
FROM transactions

-- SEPARATE CUSTOMER SPECIFIC COLUMNS	-- 3455
CREATE TABLE tmp AS
SELECT customerid, firstname, surname, shipping_state, loyalty_discount
FROM transactions

SELECT *
FROM tmp

-- REMOVE DUPLICATES	-- 942
CREATE TABLE customers AS
SELECT DISTINCT *
FROM tmp

-- 2NF CONFIRMED
SELECT *
FROM customers

-- BACK TO TRANSACTIONS TABLE
SELECT *
FROM transactions

-- REMOVE CUSTOMER-SPECIFIC COLUMNS EXCEPT "CUSTOMERID"
ALTER TABLE transactions
DROP COLUMN firstname,
DROP COLUMN surname,
DROP COLUMN shipping_state,
DROP COLUMN loyalty_discount

-- 2NF CONFIRMED
SELECT *
FROM transactions

DROP TABLE tmp

-- ----- CHECK 3NF
-- 3NF CONFIRMED
SELECT *
FROM customers

SELECT *
FROM transactions

-- SEPARATE TRANSITIVE DEPENDENCIES INTO A SEPARATE TABLE	-- 3455
CREATE TABLE tmp AS
SELECT item, description, retail_price
FROM transactions

SELECT *
FROM tmp

-- MAKE NEW TABLE 1NF BY REMOVING DUPLICATE ROWS	-- 126
CREATE TABLE items AS
SELECT DISTINCT *
FROM tmp

-- 3NF CONFIRMED
SELECT *
FROM items

-- REMOVE EXTRACTED ROWS FROM "TRANSACTIONS" TABLE EXCEPT FOREIGN KEY "ITEM"
ALTER TABLE transactions
DROP COLUMN description,
DROP COLUMN retail_price

-- 3NF CONFIRMED
SELECT *
FROM transactions

DROP TABLE tmp


