-- Database: CarDealership
CREATE DATABASE "CarDealership"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

 -- Table: Car
CREATE TABLE Car (
    car_id serial  NOT NULL,
    serial_number int  NOT NULL,
	car_color varchar(50)  NOT NULL,
    model_name varchar(150)  NOT NULL,
    manufacturer_name varchar(255)  NOT NULL,
    price numeric(10,2)  NOT NULL,
    weight numeric(5,2)  NOT NULL,
    CONSTRAINT car_id PRIMARY KEY (car_id)
);

-- Table: Transaction
CREATE TABLE Transaction (
    transaction_id serial  NOT NULL,
    car_id serial  NOT NULL,
    customer_name varchar(255)  NOT NULL,
    characteristic_of_car varchar(255)  NOT NULL,
    customer_phone int  NOT NULL,
    salesperson_name varchar(255)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (transaction_id)
);

-- foreign keys
-- Reference: Car_Transaction (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Car_Transaction
    FOREIGN KEY (car_id)
    REFERENCES Car (car_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;