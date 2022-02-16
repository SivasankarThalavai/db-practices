SELECT lastName FROM employees;

SELECT lastName, firstName, jobTitle FROM  employees;

SELECT * FROM employees;

SELECT 1 + 1;    

SELECT NOW();

SELECT CONCAT('John',' ','Doe');

SELECT CONCAT('John',' ','Doe') AS name;

SELECT CONCAT('Jane',' ','Doe') AS 'Full name';

SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname;

SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname DESC;

SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname DESC, contactFirstname ASC;

SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach FROM  orderdetails ORDER BY quantityOrdered * priceEach DESC;

SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach AS SubTotal FROM  orderdetails ORDER BY quantityOrdered * priceEach DESC;

SELECT FIELD('A', 'A', 'B','C');

SELECT orderNumber, status FROM orders ORDER BY FIELD(status, 'In Process',  'On Hold',  'Cancelled',  'Resolved',  'Disputed',  'Shipped');

SELECT firstName, lastName, reportsTo FROM  employees ORDER BY reportsTo;

SELECT firstName, lastName, reportsTo FROM  employees ORDER BY reportsTo DESC;

SELECT lastname,  firstname,  jobtitle fROM   employees WHERE  jobtitle = 'Sales Rep';

SELECT lastname,  firstname,  jobtitle fROM  employees WHERE jobtitle = 'Sales Rep' AND officeCode = 1;

SELECT lastname,  firstname,  officeCode, jobtitle fROM  employees WHERE jobtitle = 'Sales Rep' OR officeCode = 1 ORDER BY officeCode, jobtitle;

SELECT lastname,  firstname,  officeCode, jobtitle fROM  employees WHERE officeCode BETWEEN 1 AND 3;

SELECT lastname,  firstname,  officeCode, jobtitle fROM  employees WHERE officeCode IN( 1 ,  3);

SELECT firstName, lastName FROM  employees WHERE lastName LIKE '%son' ORDER BY firstName;

SELECT firstName, lastName, officeCode, jobtitle FROM  employees WHERE reportsTo IS NULL;

SELECT firstName, lastName, officeCode, jobtitle FROM  employees WHERE jobtitle <> 'Sales Rep';

SELECT DISTINCT lastname from employees ORDER BY lastname;







