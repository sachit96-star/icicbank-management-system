create database icicbank;
use icicbank;

create table account_type ( account_no int primary key not null,typt_account varchar(20),manager_id int not null,department_name varchar(20),opening_date date);

create table department ( department_id int primary key not null,department_name varchar(20),manager_id int not null,employee_id int not null,
account_no int not null, 
foreign key(account_no) references account_type(account_no));

CREATE TABLE bank_details (
    branch_code INT PRIMARY KEY,
    address VARCHAR(20),
    department_id INT,
    branch_name VARCHAR(20),
    state VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

create table job_details (job_id int primary key, department_id int, branch_code int, 
foreign key ( department_id) references department(department_id),
foreign key (branch_code) references bank_details(branch_code));

create table employees(employee_id int primary key, first_name varchar(20),department_id int,manager_id int,job_id int,email varchar(20),hire_date date,phone_no varchar(20),
salary float, 
foreign key (department_id) references department(department_id) on update cascade,
foreign key (job_id) references job_details(job_id) on update cascade);

create table customer( account_no int primary key, first_name varchar(20),city varchar(20),branch_code int,employee_id int,phone_no varchar(20),ATM_no int unique,
exp_date date, pin_no int unique, 
foreign key (branch_code) references bank_details(branch_code) on update cascade,
foreign key (employee_id) references employees(employee_id) on update cascade);


INSERT INTO account_type (account_no, typt_account, manager_id, department_name, opening_date)
VALUES
(12345, 'Saving', 20, 'Account', '2003-04-23'),
(67899, 'loan', 21, 'Loan', '2004-05-24'),
(10112, 'Saving', 22, 'HR', '2006-01-04'),
(13145, 'loan', 23, 'Admin', '2003-04-23'),
(15167, 'current', 24, 'Sales', '2004-05-24'),
(18190, 'business', 25, 'Security', '2006-01-04'),
(20210, 'loan', 26, 'Account', '2003-04-23'),
(22230, 'Saving', 27, 'Loan', '2004-05-24'),
(24250, 'loan', 28, 'HR', '2006-01-04'),
(26270, 'current', 29, 'Admin', '2003-04-23'),
(28290, 'business', 30, 'Sales', '2004-05-24'),
(30310, 'current', 31, 'Security', '2006-01-04'),
(32330, 'Saving', 32, 'Account', '2003-04-23'),
(34350, 'loan', 33, 'Loan', '2004-05-24'),
(36370, 'current', 34, 'HR', '2006-01-04'),
(38390, 'current', 35, 'Admin', '2003-04-23'),
(40410, 'business', 36, 'Sales', '2004-05-24'),
(42430, 'loan', 37, 'Security', '2006-01-04'),
(44450, 'Saving', 38, 'Account', '2003-04-23'),
(46470, 'loan', 39, 'Loan', '2004-05-24'),
(48490, 'Saving', 40, 'HR', '2006-01-04');

select * from account_type;


INSERT INTO department (department_id, department_name, manager_id, employee_id, account_no)
VALUES
(1, 'Account', 20, 50, 12345),
(8, 'Loan', 21, 51, 67899),
(11, 'HR', 22, 52, 10112),
(16, 'Admin', 23, 53, 13145),
(19, 'Sales', 24, 54, 15167),
(21, 'Security', 25, 55, 18190);
select * from department;


INSERT INTO bank_details (branch_code, address, department_id, branch_name, state)
VALUES
(100, 'Ngapur', 1, 'ICIC_N', 'Maharashtra'),
(101, 'pune', 1, 'ICIC_P', 'Maharashtra'),
(102, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),
(103, 'delhi', 1, 'ICIC_D', 'DEL'),
(104, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),
(105, 'delhi', 1, 'ICIC_D', 'DEL'),
(106, 'Ngapur', 1, 'ICIC_N', 'Maharashtra'),
(107, 'pune', 8, 'ICIC_P', 'Maharashtra'),
(108, 'Mumbai', 8, 'ICIC_M', 'Maharashtra'),
(109, 'Ngapur', 8, 'ICIC_N', 'Maharashtra'),
(110, 'pune', 11, 'ICIC_P', 'Maharashtra'),
(111, 'Mumbai', 11, 'ICIC_M', 'Maharashtra'),
(112, 'delhi', 11, 'ICIC_D', 'DEL'),
(113, 'Ngapur', 11, 'ICIC_N', 'Maharashtra'),
(114, 'pune', 11, 'ICIC_P', 'Maharashtra'),
(115, 'Mumbai', 16, 'ICIC_M', 'Maharashtra'),
(116, 'Ngapur', 16, 'ICIC_N', 'Maharashtra'),
(117, 'pune', 16, 'ICIC_P', 'Maharashtra'),
(118, 'Mumbai', 19, 'ICIC_M', 'Maharashtra'),
(119, 'delhi', 19, 'ICIC_D', 'DEL'),
(120, 'Pune', 21, 'ICIC_P', 'Maharashtra');
select * from bank_details;

INSERT INTO job_details (job_id, department_id, branch_code)
VALUES
(22, 1, 101),
(33, 8, 108),
(44, 11, 113),
(55, 19, 118);
select * from job_details;

INSERT INTO employees (employee_id, first_name, department_id, manager_id, job_id, email, hire_date, phone_no, salary)
VALUES
(50, 'Samuel', 1, 20, '22', 'SMCCAIN', '2007-11-23', '650.505.1876', 3800),
(51, 'Allan', 8, 21, '22', 'SSEWALL', '2004-01-30', '650.505.2876', 3600),
(52, 'Irene', 11, 22, '22', 'SSTILES', '2004-03-04', '650.505.3876', 2900),
(53, 'Kevin', 16, 23, '22', 'STOBIAS', '2004-08-01', '650.505.4876', 2500),
(54, 'Julia', 19, 24, '22', 'SVOLLMAN', '2005-03-10', '650.501.1876', 4000),
(55, 'Donald', 21, 25, '22', 'TFOX', '2005-12-15', '650.501.2876', 3900),
(56, 'Christopher', 1, 26, '22', 'TGATES', '2006-11-03', '650.501.3876', 3200),
(57, 'TJ', 8, 27, '33', 'TJOLSON', '2005-11-11', '650.501.4876', 2800),
(58, 'Lisa', 11, 28, '33', 'TRAJS', '2007-03-19', '650.507.9811', 3100),
(59, 'Karen', 16, 29, '33', 'VJONES', '2008-01-24', '650.507.9822', 3000),
(60, 'Valli', 19, 30, '33', 'VPATABAL', '2008-02-23', '650.507.9833', 2600),
(61, 'Joshua', 21, 31, '33', 'WGIETZ', '2003-05-01', '650.507.9844', 6400),
(62, 'Randall', 1, 32, '44', 'WSMITH', '2005-10-10', '515.123.4444', 6200),
(63, 'Hazel', 8, 33, '44', 'WTAYLOR', '2007-11-16', '515.123.5555', 11500),
(64, 'Luis', 11, 34, '44', 'JNAYER', '2005-07-16', '603.123.6666', 10000),
(65, 'Trenna', 16, 35, '44', 'JPATEL', '2006-09-28', '515.123.7777', 9600),
(66, 'Den', 19, 36, '44', 'JRUSSEL', '2007-01-14', '515.123.8888', 7400),
(67, 'Michael', 21, 37, '55', 'JSEO', '2008-03-08', '515.123.8080', 7300),
(68, 'John', 1, 38, '55', 'JTAYLOR', '2005-08-20', '011.44.1346.329268', 6100),
(69, 'Nandita', 8, 39, '55', 'JWHALEN', '2005-10-30', '011.44.1346.529268', 11000),
(70, 'Ismael', 11, 40, '55', 'KCHUNG', '2005-02-16', '011.44.1346.52', 8800);
select * from employees;

INSERT INTO customer (account_no, first_name, city, branch_code, employee_id, phone_no, ATM_no, exp_date, pin_no) VALUES
(12345, 'Samuel', 'Ngapur', 100, 50, '650.505.1876', 423705689, '2006-04-23', 5689),
(67899, 'Allan', 'pune', 101, 51, '650.505.2876', 423568971, '2007-05-24', 8971),
(10112, 'Irene', 'Mumbai', 102, 52, '650.505.3876', 423432253, '2008-01-04', 12253),
(13145, 'Kevin', 'delhi', 103, 53, '650.505.4876', 423295535, '2006-01-24', 15535),
(15167, 'Julia', 'Mumbai', 104, 54, '650.501.1876', 423158817, '2006-02-23', 18817),
(18190, 'Donald', 'delhi', 105, 55, '650.501.2876', 423022099, '2007-06-21', 22099),
(20210, 'Christopher', 'Ngapur', 106, 56, '650.501.3876', 422885381, '2008-02-03', 25381),
(22230, 'TJ', 'pune', 107, 57, '650.501.4876', 422748663, '2004-01-27', 28663),
(24250, 'Lisa', 'Mumbai', 108, 58, '650.507.9811', 422611945, '2005-02-20', 31945),
(26270, 'Karen', 'Ngapur', 109, 59, '650.507.9822', 422475227, '2006-06-24', 35227),
(28290, 'Valli', 'pune', 110, 60, '650.507.9833', 422338509, '2007-02-07', 38509),
(30310, 'Joshua', 'Mumbai', 111, 61, '650.507.9844', 422201791, '2008-01-13', 41791),
(32330, 'Randall', 'delhi', 112, 62, '515.123.4444', 422065073, '2003-09-17', 45073),
(34350, 'Hazel', 'Ngapur', 113, 63, '515.123.5555', 421928355, '2004-02-17', 48355),
(36370, 'Luis', 'pune', 114, 64, '603.123.6666', 421791637, '2005-08-17', 51637),
(38390, 'Trenna', 'Mumbai', 115, 65, '515.123.7777', 421654919, '2002-06-07', 54919),
(40410, 'Den', 'Ngapur', 116, 66, '515.123.8888', 421518201, '2002-06-07', 58201),
(42430, 'Michael', 'pune', 117, 67, '515.123.8080', 421381483, '2002-06-07', 61483),
(44450, 'John', 'Mumbai', 118, 68, '011.44.1346.329268', 421244765, '2002-06-07', 64765),
(46470, 'Nandita', 'delhi', 119, 69, '011.44.1346.529268', 421108047, '2008-04-21', 68047),
(48490, 'Ismael', 'Pune', 120, 70, '011.44.1346.52', 420971329, '2005-03-11', 71329);
select * from customer;

# QUERIES
# 1)
SELECT employees.*, branch_name.branch_name
FROM employees 
JOIN bank_details branch_name ON employees.department_id = branch_name.department_id
WHERE employees.employee_id = 52 AND branch_name.branch_name = 'ICIC_P';

# 2)
SELECT * FROM bank_details WHERE address NOT IN ('Pune', 'Mumbai', 'Delhi');

# 3)

SELECT 
    d.department_name,
    bd.address,
    bd.branch_code,
    d.department_id,
    c.city
FROM 
    customer c
JOIN 
    bank_details bd ON c.branch_code = bd.branch_code
JOIN 
    department d ON bd.department_id = d.department_id
WHERE 
    c.account_no = 18190;


# 4)
SELECT 
    d.department_id,
    d.department_name,
    e.job_id
FROM 
    employees e
JOIN 
    department d ON e.department_id = d.department_id
WHERE 
    d.department_name IN ('Loan', 'HR', 'Admin');

# 5)
SELECT 
    a.typt_account,
    b.state,
    c.account_no
FROM 
    customer c
JOIN 
    bank_details b ON c.branch_code = b.branch_code
JOIN 
    account_type a ON c.account_no = a.account_no
WHERE 
    c.ATM_no = 422748663;
    
# 6)
CREATE VIEW employee_branch_details AS
SELECT 
    bd.address,
    bd.branch_name,
    d.department_name,
    e.first_name,
    e.phone_no
FROM 
    bank_details bd
JOIN 
    department d ON bd.department_id = d.department_id
JOIN 
    employees e ON d.department_id = e.department_id;

SELECT * FROM employee_branch_details;

# 7)
CREATE VIEW city_department_view AS
SELECT 
    bd.address AS city,
    d.department_name
FROM 
    bank_details bd
JOIN 
    department d ON bd.department_id = d.department_id
JOIN 
    account_type at ON d.account_no = at.account_no
WHERE 
    at.opening_date < '2004-05-24';
    
    SELECT * FROM city_department_view;
    
# 8)
CREATE VIEW employee_job_details AS
SELECT 
    e.employee_id,
    e.first_name,
    e.department_id AS emp_department_id, -- Alias to avoid conflict
    e.manager_id,
    e.job_id,
    e.email,
    e.hire_date,
    e.phone_no,
    e.salary,
    jd.branch_code,
    jd.department_id AS job_department_id, -- Alias to avoid conflict
    d.department_name
FROM 
    employees e
JOIN 
    job_details jd ON e.job_id = jd.job_id
JOIN 
    department d ON e.department_id = d.department_id
WHERE 
    jd.job_id IN ('ST_CLERK', 'ST_MAN', 'FI_ACCOUNT');

SELECT * FROM employee_job_details;

# 9)
UPDATE customer
SET ATM_no = 42321992
WHERE ATM_no = 423295535;

select * from customer;

# 10)
set sql_safe_updates=0;

UPDATE account_type
SET department_name = 'Admin'
WHERE department_name = 'Sales';

select department_name from account_type;