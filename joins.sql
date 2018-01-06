



-- ----- LEFT JOIN

SELECT *
FROM pets;

SELECT *
FROM owners;

SELECT *
FROM pets
LEFT JOIN owners
ON pets.ownerid = owners.ownerid;

SELECT pets.name, owners.name
FROM pets
LEFT JOIN owners
ON pets.ownerid = owners.ownerid;

-- ----- TIPS AND TRICKS AND RIGHT JOIN

-- ALIASES FOR TABLES
SELECT a.name, b.name
FROM pets AS a
LEFT JOIN owners AS b
ON a.ownerid = b.ownerid
WHERE LEFT(a.name, 1) = LEFT(b.name, 1);

-- ALIASES FOR COLUMNS
SELECT a.name AS petname, b.name AS ownername
FROM pets AS a
LEFT JOIN owners AS b
ON a.ownerid = b.ownerid
WHERE LEFT(a.name, 1) = LEFT(b.name, 1);

-- RIGHT JOIN
SELECT a.name AS petname, b.name AS ownername
FROM owners AS b
RIGHT JOIN pets AS a
ON a.ownerid = b.ownerid;

-- ----- INNER JOIN

SELECT *
FROM pets AS a
INNER JOIN procedurehistory AS b
ON a.petid = b.petid;

-- ----- FULL OUTER JOIN

SELECT *
FROM pets AS a
FULL OUTER JOIN procedurehistory AS b
ON a.petid = b.petid;

-- ----- JOINING ON MULTIPLE FIELDS

SELECT *
FROM procedurehistory;

SELECT *
FROM proceduredetails;

SELECT *
FROM proceduredetails AS d
INNER JOIN procedurehistory AS h
ON d.proceduretype = h.proceduretype
AND d.proceduresubcode = h.proceduresubcode;

SELECT *
FROM procedurehistory AS a
LEFT JOIN proceduredetails AS b
ON a.proceduretype = b.proceduretype
AND a.proceduresubcode = b.proceduresubcode;

-- ----- COMPLEX JOIN
SELECT *
FROM pets AS a
INNER JOIN procedurehistory AS b
ON a.petid = b.petid
LEFT JOIN proceduredetails AS c
ON b.proceduretype = c.proceduretype
AND b.proceduresubcode = c.proceduresubcode;

-- ----- CLEANING UP YOUR JOINS
SELECT
	/* a.petid, a.name,  a.kind, a.gender, a.age, */
	a.ownerid,
	/* b.proceduredate, b.proceduretype, b.proceduresubcode, c.description, */
    c.price
FROM pets AS a
INNER JOIN procedurehistory AS b
ON a.petid = b.petid
LEFT JOIN proceduredetails AS c
ON b.proceduretype = c.proceduretype
AND b.proceduresubcode = c.proceduresubcode;

-- ----- CROSS JOIN
SELECT *
FROM pets
CROSS JOIN owners;



