/* 
 * Description: This SQL script rebuilds the entire movie rental database schema from scratch.
 * It first drops all existing tables (along with their constraints) to ensure a clean
 * environment, then recreates all tables needed for the system. After defining the
 * tables, it establishes relationships between them using foreign key constraints.
 * @author Griffin Shay
 */

-- Drop all tables in reverse dependency order to avoid constraint violations.
DROP TABLE director_award CASCADE CONSTRAINTS;
DROP TABLE actor_award CASCADE CONSTRAINTS;
DROP TABLE movie_award CASCADE CONSTRAINTS;
DROP TABLE academy_award CASCADE CONSTRAINTS;
DROP TABLE movie_director CASCADE CONSTRAINTS;
DROP TABLE director CASCADE CONSTRAINTS;
DROP TABLE movie_actor CASCADE CONSTRAINTS;
DROP TABLE actor CASCADE CONSTRAINTS;
DROP TABLE rental_line_item CASCADE CONSTRAINTS;
DROP TABLE rental CASCADE CONSTRAINTS;
DROP TABLE inventory_item CASCADE CONSTRAINTS;
DROP TABLE purchase_line_item CASCADE CONSTRAINTS;
DROP TABLE purchase_order CASCADE CONSTRAINTS;
DROP TABLE catalog_line_item CASCADE CONSTRAINTS;
DROP TABLE distributor_catalog CASCADE CONSTRAINTS;
DROP TABLE distributor CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;

-- Save the changes after dropping tables.
COMMIT;

-- Create customer table to store customer information.
CREATE TABLE customer
(
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    street_address VARCHAR2(30) NOT NULL,
    city VARCHAR2(30) NOT NULL,
    state_name VARCHAR2(2) NOT NULL,
    zip_code NUMBER NOT NULL,
    phone_number VARCHAR2(16) NOT NULL,
    email VARCHAR2(30) NOT NULL
);

-- Create movie table to store movie details.
CREATE TABLE movie
(
    movie_id NUMBER PRIMARY KEY,
    title VARCHAR2(30) NOT NULL,
    release_date DATE NOT NULL,
    duration NUMBER NOT NULL,
    rating VARCHAR2(5) NOT NULL,
    genre VARCHAR2(10) NOT NULL,
    format VARCHAR2(3) NOT NULL
);

-- Create distributor table to store distributor information.
CREATE TABLE distributor
(
    distributor_id NUMBER PRIMARY KEY,
    distributor_name VARCHAR2(30) NOT NULL,
    phone_number VARCHAR2(16) NOT NULL,
    email VARCHAR2(30) NOT NULL
);

-- Create distributor catalog table to store assigned catalogs for each distributor.
CREATE TABLE distributor_catalog
(
    catalog_id NUMBER PRIMARY KEY,
    distributor_id NUMBER NOT NULL
);

-- Create catalog line item table to store items within each distributor catalog.
CREATE TABLE catalog_line_item
(
    serial_number NUMBER PRIMARY KEY,
    catalog_id NUMBER NOT NULL,
    distributor_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    regular_price NUMBER NOT NULL,
    wholesale_price NUMBER
);

-- Create purchase order catalog to store purchase orders placed to distributors.
CREATE TABLE purchase_order
(
    purchase_order_id NUMBER PRIMARY KEY,
    order_date DATE NOT NULL,
    delivery_date DATE NOT NULL,
    order_total NUMBER NOT NULL
);

-- Create purchase line item table to store line items within each purchase order.
CREATE TABLE purchase_line_item
(
    purchase_line_item_id NUMBER PRIMARY KEY,
    serial_number NUMBER NOT NULL,
    purchase_order_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL
);

-- Create inventory item table to store inventory of movies available for rental.
CREATE TABLE inventory_item
(
    inventory_id NUMBER PRIMARY KEY,
    serial_number NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    is_rented_out VARCHAR2(1) NOT NULL
);

-- Create rental table to store rental transactions.
CREATE TABLE rental
(
    rental_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    rental_total NUMBER NOT NULL
);

-- Create rental line item table to store detailed rental records for each item.
CREATE TABLE rental_line_item
(
    rental_line_item_id NUMBER PRIMARY KEY,
    rental_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    inventory_id NUMBER NOT NULL,
    rental_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NOT NULL,
    rental_fee NUMBER NOT NULL,
    late_fee NUMBER,
    damage_fee NUMBER,
    rewind_fee NUMBER,
    tax NUMBER NOT NULL,
    discount NUMBER
);

-- Create actor table to store actor information.
CREATE TABLE actor
(
    actor_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL
);

-- Create movie actor table to store the relationship between movies and actors.
CREATE TABLE movie_actor
(
    movie_actor_id NUMBER PRIMARY KEY,
    actor_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL
);

-- Create director table to store director information.
CREATE TABLE director
(
    director_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    production_co VARCHAR2(30)
);

-- Create movie director table to store the relationship between movies and directors.
CREATE TABLE movie_director
(
    movie_director_id NUMBER PRIMARY KEY,
    director_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL
);

-- Create academy award table to store academy award information.
CREATE TABLE academy_award
(
    award_id NUMBER PRIMARY KEY,
    award_name VARCHAR2(30) NOT NULL,
    award_year NUMBER NOT NULL,
    award_category VARCHAR2(30) NOT NULL
);

-- Create movie award table to store the relationship between movies and awards.
CREATE TABLE movie_award
(
    movie_award_id NUMBER PRIMARY KEY,
    movie_id NUMBER NOT NULL,
    award_id NUMBER NOT NULL
);

-- Create actor award table to store the relationship between actors and awards.
CREATE TABLE actor_award
(
    actor_award_id NUMBER PRIMARY KEY,
    actor_id NUMBER NOT NULL,
    award_id NUMBER NOT NULL
);

-- Create director award table to store the relationship between directors and awards.
CREATE TABLE director_award
(
    director_award_id NUMBER PRIMARY KEY,
    director_id NUMBER NOT NULL,
    award_id NUMBER NOT NULL
);

-- Save table creation.
COMMIT;


-- Add foreign key constraints to enforce relationships between tables.

ALTER TABLE distributor_catalog
ADD CONSTRAINT fk_discatalog_distributor
FOREIGN KEY (distributor_id)
REFERENCES distributor(distributor_id);

ALTER TABLE catalog_line_item
ADD CONSTRAINT fk_cataloglineitem_distributorcatalog
FOREIGN KEY (catalog_id)
REFERENCES distributor_catalog(catalog_id);

ALTER TABLE catalog_line_item
ADD CONSTRAINT fk_cataloglineitem_distributor
FOREIGN KEY (distributor_id)
REFERENCES distributor(distributor_id);

ALTER TABLE catalog_line_item
ADD CONSTRAINT fk_cataloglineitem_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE purchase_line_item
ADD CONSTRAINT fk_purchaselineitem_cataloglineitem
FOREIGN KEY (serial_number)
REFERENCES catalog_line_item(serial_number);

ALTER TABLE purchase_line_item
ADD CONSTRAINT fk_purchaselineitem_purchaseorder
FOREIGN KEY (purchase_order_id)
REFERENCES purchase_order(purchase_order_id);

ALTER TABLE purchase_line_item
ADD CONSTRAINT fk_purchaselineitem_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE inventory_item
ADD CONSTRAINT fk_inventoryitem_cataloglineitem
FOREIGN KEY (serial_number)
REFERENCES catalog_line_item(serial_number);

ALTER TABLE inventory_item
ADD CONSTRAINT fk_inventoryitem_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
ON DELETE CASCADE;

ALTER TABLE rental_line_item
ADD CONSTRAINT fk_rentallineitem_rental
FOREIGN KEY (rental_id)
REFERENCES rental(rental_id);

ALTER TABLE rental_line_item
ADD CONSTRAINT fk_rentallineitem_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
ON DELETE CASCADE;

ALTER TABLE rental_line_item
ADD CONSTRAINT fk_rentallineitem_inventoryitem
FOREIGN KEY (inventory_id)
REFERENCES inventory_item(inventory_id);

ALTER TABLE movie_actor
ADD CONSTRAINT fk_movieactor_actor
FOREIGN KEY (actor_id)
REFERENCES actor(actor_id);

ALTER TABLE movie_actor
ADD CONSTRAINT fk_movieactor_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE movie_director
ADD CONSTRAINT fk_moviedirector_director
FOREIGN KEY (director_id)
REFERENCES director(director_id);

ALTER TABLE movie_director
ADD CONSTRAINT fk_moviedirector_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE movie_award
ADD CONSTRAINT fk_movieaward_movie
FOREIGN KEY (movie_id)
REFERENCES movie(movie_id);

ALTER TABLE movie_award
ADD CONSTRAINT fk_movieaward_academyaward
FOREIGN KEY (award_id)
REFERENCES academy_award(award_id);

ALTER TABLE actor_award
ADD CONSTRAINT fk_actoraward_actor
FOREIGN KEY (actor_id)
REFERENCES actor(actor_id);

ALTER TABLE actor_award
ADD CONSTRAINT fk_actoraward_academyaward
FOREIGN KEY (award_id)
REFERENCES academy_award(award_id);

ALTER TABLE director_award
ADD CONSTRAINT fk_directoraward_director
FOREIGN KEY (director_id)
REFERENCES director(director_id);

ALTER TABLE director_award
ADD CONSTRAINT fk_directoraward_academyaward
FOREIGN KEY (award_id)
REFERENCES academy_award(award_id);

-- Final commit to save all constraints.
COMMIT;
