
CREATE TABLE employee (
    emp_id     NUMBER(10)          PRIMARY KEY,
    emp_name   VARCHAR2(10)       NOT NULL,
    emp_email  VARCHAR2(20)       UNIQUE NOT NULL,
    emp_salary NUMBER(10, 2)       DEFAULT 0.00
);
INSERT INTO employee (emp_id, emp_name, emp_email, emp_salary) 
VALUES (101, 'Shashank', 'shashank@gmail.com', 75000.00);

INSERT INTO employee (emp_id, emp_name, emp_email, emp_salary) 
VALUES (102, 'Sharath', 'sharath@gmail.com', 62500.50);

INSERT INTO employee (emp_id, emp_name, emp_email, emp_salary) 
VALUES (103, 'Shashi Kumar', 'shashikumar@gmail.com', 88000.00);

select * from employee;
COMMIT;

select * from employee;

UPDATE employee 
SET emp_name = CASE emp_id
    WHEN 101 THEN 'Shashank K'
    WHEN 102 THEN 'Sharath Gowda'
    WHEN 103 THEN 'Shashi Kumar M'
    ELSE emp_name
END
WHERE emp_id IN (101, 102, 103);

select* from employee;

UPDATE employee 
SET emp_email = CASE emp_id
    WHEN 101 THEN 'shashank@gmail.com'
    WHEN 102 THEN 'sharath@gmail.com'
    WHEN 103 THEN 'shashi@gmail.com'
    ELSE emp_email
END
WHERE emp_id IN (101, 102, 103);
COMMIT;
select * from employee;
INSERT INTO employee (emp_id, emp_name, emp_email, emp_salary) 
VALUES (101, 'Shashank', 'shashank@gmail.com', 75000.00);
INSERT INTO employee (emp_id, emp_name, emp_email, emp_salary) 
VALUES (102, 'Sharath', 'sharath@gmail.com', 62500.50);

select * from employee;
COMMIT;





