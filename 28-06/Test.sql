CREATE DATABASE rocket36;
USE rocket36;

CREATE Table students
(
stundents_id	int,
students_name	varchar(30),
email			varchar(30),
age				int,
dob				date
);


CREATE Table Customers (
customer_id	int,
first_name	varchar(50),
last_name	varchar(50),
email_address varchar(50),
number__of_complaints	int
);

CREATE Table Sale (
purchase_number	int,
date_of_purchase date,
customer_id int,
item_code varchar(50)
);

