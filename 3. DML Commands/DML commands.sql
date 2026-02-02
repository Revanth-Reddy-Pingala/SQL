use MyDatabase;

-- Data Manipulation Language
-- Insert syntax (Manual Entry)
-- Insert into table_name (column 1, column 2, column 3...) Values (value 1, value 2, value 3....) 
-- if no columns are specified SQL expects values for all columns
-- Rule: Match the number of columns and values

Insert into customers (id, first_name, country, score) values (6, 'Anna', 'USA', NULL);

-- Rules: Matching data types, column count & constraints
-- Note: you can skip the columns if you insert values for every column
-- Note: Columns not included in Insert become NULL (Unless a default or constraint exists)

-- Insert using Select, Query from source table, the result from source table insert to target table

-- Copy data from customers table into persons
insert into persons (id, person_name, birth_date, phone)
Select id,first_name,null, 'unknown' from customers;

select * from customers;

-- Update: Update existing data
-- Syntax: Update table_name set column1 = value1, column2 = value2 where <conditon>;
-- Note: Always use where to avoid updating all rows unintentionally

-- Change the score of the customer 6 to 0
Update customers set score = 0 where id = 6;
-- Caution: Without a where, all rows will be updated

select * from customers;

-- Change the score of customer 10 to 0 and update the country to UK
Update customers set score = 0, country = 'UK' where id = 10;

-- Update all customers with a NULL by setting their score to 0
Update customers set score = 0 where score is null;


-- DELETE
-- Delete: Delete from table_name where <condition>
-- Note: Always use where to avoid deleting all rows unintentionally
-- Delete all customers with an ID greater than 5
Select * from customers where id > 5;
Delete from customers where id > 5;

-- Best Practice: Check with select before running delete to avoid deleting the wrong data

-- Delete all data from table persons
Truncate table persons;

-- Truncate: clears the whole table at once without checking or logging
