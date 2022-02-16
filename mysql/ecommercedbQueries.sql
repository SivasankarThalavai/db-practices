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

SELECT DISTINCT state FROM customers;

SELECT DISTINCT state, city FROM customers WHERE state IS NOT NULL ORDER BY state, city;

SELECT customername, country, state FROM customers WHERE country = 'USA' AND  state = 'CA';

SELECT customername, country, state FROM customers WHERE country = 'USA' AND  state = 'CA' AND  creditlimit > 100000;

SELECT customername, country, state FROM customers WHERE country = 'USA' OR  country = 'France' AND  creditlimit > 100000;

SELECT customername, country, state FROM customers WHERE country IN ('USA' , 'France');

SELECT customername, country, state FROM customers WHERE country NOT IN ('USA' , 'France');

SELECT productCode, productName, buyPrice FROM  products WHERE buyPrice BETWEEN 90 AND 100;

SELECT productCode, productName, buyPrice FROM  products WHERE  buyPrice >= 90 AND buyPrice <= 100;

SELECT productCode, productName, buyPrice FROM  products WHERE buyPrice NOT BETWEEN 90 AND 100;

SELECT productCode, productName, buyPrice FROM  products WHERE buyPrice < 90 OR buyPrice > 100;

SELECT orderNumber, requiredDate, status FROM orders WHERE requireddate BETWEEN CAST('2003-01-01' AS DATE) AND CAST('2003-01-31' AS DATE);

SELECT  employeeNumber,  lastName,  firstName FROM  employees WHERE firstName LIKE 'a%';

SELECT  employeeNumber,  lastName,  firstName FROM  employees WHERE firstName LIKE '%Y';

SELECT  employeeNumber,  lastName,  firstName FROM  employees WHERE firstName LIKE '%rr%';

SELECT  employeeNumber,  lastName,  firstName FROM  employees WHERE firstName LIKE 'T_m';

SELECT  employeeNumber,  lastName,  firstName FROM  employees WHERE firstName NOT LIKE '%rr%';

SELECT CONCAT(lastName, firstname) AS `Full name` FROM  employees;

SELECT CONCAT_WS(' ',lastName, firstname) AS `Full name` FROM  employees ORDER BY `Full name`;

SELECT orderNumber AS `Order no.`,	SUM(priceEach * quantityOrdered) AS total FROM	orderDetails GROUP BY `Order no.` HAVING total > 60000;

SELECT e.firstName, e.lastName FROM  employees e ORDER BY e.firstName;

SELECT customerName, COUNT(o.orderNumber) AS total FROM customers c INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY customerName ORDER BY total DESC;

SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;

SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;


SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;

SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;

SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NOT NULL;
    
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;
    
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;

SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
SELECT lastName, firstName FROM  employees WHERE officeCode IN (
  SELECT officeCode FROM  offices WHERE country = 'USA');


CREATE VIEW customerPayments AS 
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber); 
