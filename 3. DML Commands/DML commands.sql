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
-- Syntax: Update table_name set column1 = value1, column2 = value2;