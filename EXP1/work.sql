-- 1
SELECT CUSTOMER.CUSTOMER_NAME,LOAN.LOAN_NUMBER AS LOAN_ID,LOAN.AMOUNT
FROM (CUSTOMER LEFT JOIN BORROWER ON CUSTOMER.CUSTOMER_NAME = BORROWER.CUSTOMER_NAME)
LEFT JOIN LOAN ON BORROWER.LOAN_NUMBER = LOAN.LOAN_NUMBER;

-- 2
SELECT CUSTOMER_NAME,CUSTOMER_STREET 
FROM CUSTOMER
WHERE CUSTOMER_STREET LIKE '%Main%';

-- 3
SELECT DISTINCT CUSTOMER_NAME FROM DEPOSITOR
UNION
SELECT DISTINCT CUSTOMER_NAME FROM BORROWER;

-- 4
SELECT DISTINCT CUSTOMER_NAME
FROM DEPOSITOR NATURAL JOIN BORROWER;

-- 5
SELECT DISTINCT CUSTOMER_NAME
FROM DEPOSITOR 
WHERE CUSTOMER_NAME NOT IN (SELECT CUSTOMER_NAME FROM BORROWER);

-- 6
SELECT AVG(BALANCE)
FROM ACCOUNT
WHERE BRANCH_NAME = 'Perryridge';

-- 7
SELECT COUNT(CUSTOMER_NAME)
FROM CUSTOMER;

-- 8
SELECT COUNT(DISTINCT CUSTOMER_NAME)
FROM DEPOSITOR;

-- 9
SELECT BRANCH.BRANCH_NAME,COUNT(DISTINCT DEPOSITOR.CUSTOMER_NAME)
FROM (BRANCH LEFT JOIN ACCOUNT ON BRANCH.BRANCH_NAME = ACCOUNT.BRANCH_NAME)
LEFT JOIN DEPOSITOR ON DEPOSITOR.ACCOUNT_NUMBER = ACCOUNT.ACCOUNT_NUMBER
GROUP BY BRANCH.BRANCH_NAME;

-- 10
SELECT BRANCH_NAME,AVG(BALANCE)
FROM ACCOUNT 
GROUP BY BRANCH_NAME
HAVING AVG(BALANCE) > 1200;

-- 11
SELECT LOAN_NUMBER 
FROM LOAN 
WHERE AMOUNT IS NULL;

-- 12
SELECT DISTINCT CUSTOMER_NAME 
FROM DEPOSITOR NATURAL JOIN BORROWER;

-- 13
SELECT DISTINCT CUSTOMER_NAME
FROM BORROWER 
WHERE CUSTOMER_NAME NOT IN (SELECT CUSTOMER_NAME FROM DEPOSITOR);

-- 14
SELECT DISTINCT CUSTOMER.CUSTOMER_NAME
FROM CUSTOMER,ACCOUNT,LOAN,DEPOSITOR,BORROWER
WHERE CUSTOMER.CUSTOMER_NAME = DEPOSITOR.CUSTOMER_NAME
AND DEPOSITOR.ACCOUNT_NUMBER = ACCOUNT.ACCOUNT_NUMBER
AND ACCOUNT.BRANCH_NAME = 'Perryridge'
AND CUSTOMER.CUSTOMER_NAME = BORROWER.CUSTOMER_NAME
AND BORROWER.LOAN_NUMBER = LOAN.LOAN_NUMBER
AND LOAN.BRANCH_NAME = 'Perryridge';

-- 15
SELECT * 
FROM BRANCH
WHERE ASSETS > (SELECT MIN(ASSETS) 
FROM BRANCH WHERE BRANCH_CITY = 'Brooklyn');

-- 16
SELECT * 
FROM BRANCH
WHERE ASSETS > (SELECT MAX(ASSETS)
FROM BRANCH WHERE BRANCH_CITY = 'Brooklyn');

-- pager cat >> /Users/luzixu/Documents/Git/MySQL-Experiment/EXP1/out
-- source /Users/luzixu/Documents/Git/MySQL-Experiment/EXP1/work.sql