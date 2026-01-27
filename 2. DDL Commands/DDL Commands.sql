use MyDatabase;

-- Create - Define Structure of your data
/* Create a new table called persons 
with columns: id, person_name, birth_date and phone */

Create table persons(
	id int not null,
    person_name varchar(50) not null,
    birth_date date,
    phone int(15) not null,
    constraint pk_persons primary key(id)
);

Select * from persons;

-- Alter
-- Add a new column called email to the persons table
Alter table persons 
Add email varchar(50) not null;

Select * from persons;
-- Note: Adding Columns: The new columns are appended at the end of the table by default

-- Remove the column phone from the persons table
Alter table persons
drop column phone;

Select * from persons;

-- Drop - removing completely from the database
-- Delete the table persons from the database
drop table persons;
