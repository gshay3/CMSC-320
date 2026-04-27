/* 
 * Description: This SQL script resets and repopulates a movie rental database with sample data.
 * It first deletes all existing records from the tables in an order that maintains
 * referential integrity, then inserts new test data for customers, movies, distributors,
 * inventory, rentals, actors, directors, and awards.
 * @author Griffin Shay
 */

-- Clear all existing data from tables (in dependency-safe order).
DELETE FROM director_award;
DELETE FROM actor_award;
DELETE FROM movie_award;
DELETE FROM academy_award;
DELETE FROM movie_director;
DELETE FROM director;
DELETE FROM movie_actor;
DELETE FROM actor;
DELETE FROM rental_line_item;
DELETE FROM rental;
DELETE FROM inventory_item;
DELETE FROM purchase_line_item;
DELETE FROM purchase_order;
DELETE FROM catalog_line_item;
DELETE FROM distributor_catalog;
DELETE FROM distributor;
DELETE FROM movie;
DELETE FROM customer;

-- Save the deletions.
COMMIT;

-- Instert sample customer data.
INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state_name, zip_code, phone_number, email)
VALUES (1, 'Salim', 'Bradly', 'Washington Ave', 'Witchita', 'WA', '11540', '(620)-326-1928', 'SBradly@gmail.com');
INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state_name, zip_code, phone_number, email)
VALUES (2, 'Spike', 'Spiegal', 'Mars Blvd', 'Tiajuana', 'NM', '52301', '(492)-824-3451', 'Bebop@hotmail.com');
INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state_name, zip_code, phone_number, email)
VALUES (3, 'Light', 'Yagami', 'Leming St', 'San Diego', 'CA', '74236', '(165)-248-7624', 'Shinigami6@hotmail.com');
INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state_name, zip_code, phone_number, email)
VALUES (4, 'Celty', 'Sterlingson', 'Dulahan St', 'Miami', 'FL', '22013', '(852)-645-2381', 'TheNumbers@yahoo.com');
INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state_name, zip_code, phone_number, email)
VALUES (5, 'Marta', 'Cabrera', 'Harlan Blvd', 'Blanc Blvd', 'MA', '02357', '(732)-841-7524', 'KnvesOut@gmail.com');

-- Insert movie records with meta data.
INSERT INTO movie (movie_id, title, release_date, duration, rating, genre, format)
VALUES (1, 'The Velocipastor', TO_DATE ('03/20/2004', 'MM/DD/YYYY'), 126, 'R', 'Comedy', 'VHS');
INSERT INTO movie (movie_id, title, release_date, duration, rating, genre, format)
VALUES (2, 'Treasure Planet', TO_DATE ('01/07/2001', 'MM/DD/YYYY'), 93, 'PG-13', 'Action', 'DVD');
INSERT INTO movie (movie_id, title, release_date, duration, rating, genre, format)
VALUES (3, 'Spirited Away', TO_DATE ('07/16/1996', 'MM/DD/YYYY'), 103, 'T', 'Fantasy', 'DVD');
INSERT INTO movie (movie_id, title, release_date, duration, rating, genre, format)
VALUES (4, 'Baby Driver', TO_DATE ('04/25/2018', 'MM/DD/YYYY'), 133, 'PG-13', 'Drama', 'VHS');
INSERT INTO movie (movie_id, title, release_date, duration, rating, genre, format)
VALUES (5, 'Spy Kids', TO_DATE ('09/01/2021', 'MM/DD/YYYY'), 98, 'T', 'Action', 'VHS');

-- Insert distributor information.
INSERT INTO distributor (distributor_id, distributor_name, phone_number, email)
VALUES (1, 'Blockbuster', '(906)-572-1237', 'blockbuster@gmail.com');
INSERT INTO distributor (distributor_id, distributor_name, phone_number, email)
VALUES (2, 'Movie Seller', '(453)-844-2008', 'movieseller@gmail.com');
INSERT INTO distributor (distributor_id, distributor_name, phone_number, email)
VALUES (3, 'Movies R Us', '(832)-156-8546', 'moviesrus@gmail.com');
INSERT INTO distributor (distributor_id, distributor_name, phone_number, email)
VALUES (4, 'Buy VHS Now', '(537)-831-7812', 'buyvhsnow@gmail.com');
INSERT INTO distributor (distributor_id, distributor_name, phone_number, email)
VALUES (5, 'Your Movies or VHSs', '(724)-641-6425', 'moviesvhss@gmail.com');

-- Link distributors with their catalogs.
INSERT INTO distributor_catalog (catalog_id, distributor_id)
VALUES (1, 1);
INSERT INTO distributor_catalog (catalog_id, distributor_id)
VALUES (2, 2);
INSERT INTO distributor_catalog (catalog_id, distributor_id)
VALUES (3, 3);
INSERT INTO distributor_catalog (catalog_id, distributor_id)
VALUES (4, 4);
INSERT INTO distributor_catalog (catalog_id, distributor_id)
VALUES (5, 5);

-- Catalog line items showing which movies each distributor sells and pricing.
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (1, 1, 1, 1, 25, 15);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (101, 2, 2, 2, 23, 13);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (1001, 3, 3, 3, 30, 20);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (10001, 4, 4, 4, 22, 12);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (100001, 5, 5, 5, 20, 10);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (102, 2, 2, 1, 28, 18);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (1002, 3, 3, 2, 24, 14);
INSERT INTO catalog_line_item (serial_number, catalog_id, distributor_id, movie_id, regular_price, wholesale_price)
VALUES (100002, 5, 5, 3, 27, 17);

-- Purchase orders made to distributors
INSERT INTO purchase_order (purchase_order_id, order_date, delivery_date, order_total)
VALUES (1, TO_DATE ('11/17/2025', 'MM/DD/YYYY'), TO_DATE ('11/20/2025', 'MM/DD/YYYY'), 1500);
INSERT INTO purchase_order (purchase_order_id, order_date, delivery_date, order_total)
VALUES (2, TO_DATE ('11/19/2025', 'MM/DD/YYYY'), TO_DATE ('11/25/2025', 'MM/DD/YYYY'), 1550);
INSERT INTO purchase_order (purchase_order_id, order_date, delivery_date, order_total)
VALUES (3, TO_DATE ('11/22/2025', 'MM/DD/YYYY'), TO_DATE ('11/27/2025', 'MM/DD/YYYY'), 2920);
INSERT INTO purchase_order (purchase_order_id, order_date, delivery_date, order_total)
VALUES (4, TO_DATE ('11/26/2025', 'MM/DD/YYYY'), TO_DATE ('11/30/2025', 'MM/DD/YYYY'), 600);
INSERT INTO purchase_order (purchase_order_id, order_date, delivery_date, order_total)
VALUES (5, TO_DATE ('01/03/2026', 'MM/DD/YYYY'), TO_DATE ('01/10/2026', 'MM/DD/YYYY'), 1020);

-- Line items within each purchase order (movies and quantities ordered).
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (1, 1, 1, 1, 100);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (2, 101, 2, 2, 50);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (3, 102, 2, 1, 50);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (4, 1001, 3, 3, 4);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (5, 1002, 3, 2, 200);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (6, 10001, 4, 4, 50);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (7, 100001, 5, 5, 75);
INSERT INTO purchase_line_item (purchase_line_item_id, serial_number, purchase_order_id, movie_id, quantity)
VALUES (8, 100002, 5, 3, 10);

-- Inventory items available for rental and their status.
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (1, 1, 1, 'Y');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (2, 102, 1, 'N');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (3, 101, 2, 'Y');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (4, 1002, 2, 'N');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (5, 1001, 3, 'N');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (6, 100002, 3, 'Y');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (7, 10001, 4, 'Y');
INSERT INTO inventory_item (inventory_id, serial_number, movie_id, is_rented_out)
VALUES (8, 100001, 5, 'N');

-- Rental transactions made by customers.
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (1, 1, 30.48);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (2, 2, 14.99);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (3, 3, 16.49);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (4, 4, 18.99);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (5, 5, 9.99);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (6, 1, 12.99);
INSERT INTO rental (rental_id, customer_id, rental_total)
VALUES (7, 3, 12.99);

-- Detailed rental line items (customer, dates, fees, penalties, etc.).
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (1, 1, 1, 1, TO_DATE ('12/01/2025', 'MM/DD/YYYY'), TO_DATE ('12/05/2025', 'MM/DD/YYYY'), TO_DATE ('12/04/2025', 'MM/DD/YYYY'), 10.00, 0, 0, 2.50, 2.99, 0);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (2, 1, 1, 6, TO_DATE ('12/01/2025', 'MM/DD/YYYY'), TO_DATE ('12/05/2025', 'MM/DD/YYYY'), TO_DATE ('12/04/2025', 'MM/DD/YYYY'), 12.00, 0, 0, 0, 2.99, 0);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (3, 2, 2, 3, TO_DATE ('12/02/2025', 'MM/DD/YYYY'), TO_DATE ('12/06/2025', 'MM/DD/YYYY'), TO_DATE ('12/07/2025', 'MM/DD/YYYY'), 9.00, 0, 2.00, 0, 1.99, 0);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (4, 3, 3, 4, TO_DATE ('12/03/2025', 'MM/DD/YYYY'), TO_DATE ('12/07/2025', 'MM/DD/YYYY'), TO_DATE ('12/07/2025', 'MM/DD/YYYY'), 15.00, 0, 0, 0, 2.99, 1.50);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (5, 4, 4, 2, TO_DATE ('12/04/2025', 'MM/DD/YYYY'), TO_DATE ('12/08/2025', 'MM/DD/YYYY'), TO_DATE ('12/06/2025', 'MM/DD/YYYY'), 14.00, 0, 2.00, 0, 2.99, 0);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (6, 5, 5, 5, TO_DATE ('12/05/2025', 'MM/DD/YYYY'), TO_DATE ('12/09/2025', 'MM/DD/YYYY'), TO_DATE ('12/08/2025', 'MM/DD/YYYY'), 8.00, 0, 0, 0, 2.99, 1.00);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (7, 6, 1, 5, TO_DATE ('01/25/2026', 'MM/DD/YYYY'), TO_DATE ('01/29/2026', 'MM/DD/YYYY'), TO_DATE ('01/30/2026', 'MM/DD/YYYY'), 8.00, 2.00, 0, 0, 2.99, 0);
INSERT INTO rental_line_item (rental_line_item_id, rental_id, customer_id, inventory_id, rental_date, due_date, return_date, rental_fee, late_fee, damage_fee, rewind_fee, tax, discount)
VALUES (8, 7, 3, 1, TO_DATE ('02/06/2026', 'MM/DD/YYYY'), TO_DATE ('02/10/2026', 'MM/DD/YYYY'), TO_DATE ('02/10/2026', 'MM/DD/YYYY'), 10.00, 0, 0, 0, 2.99, 0);

-- Actor records.
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (1, 'Sam', 'Neill');
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (2, 'Emma', 'Watson');
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (3, 'Leonardo', 'DiCaprio');
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (4, 'Tom', 'Holland');
INSERT INTO actor (actor_id, first_name, last_name)
VALUES (5, 'Scarlett', 'Johansson');

-- Link actors to movies.
INSERT INTO movie_actor (movie_actor_id, actor_id, movie_id)
VALUES (1, 1, 1);
INSERT INTO movie_actor (movie_actor_id, actor_id, movie_id)
VALUES (2, 2, 2);
INSERT INTO movie_actor (movie_actor_id, actor_id, movie_id)
VALUES (3, 3, 3);
INSERT INTO movie_actor (movie_actor_id, actor_id, movie_id)
VALUES (4, 4, 4);
INSERT INTO movie_actor (movie_actor_id, actor_id, movie_id)
VALUES (5, 5, 5);

-- Director records.
INSERT INTO director (director_id, first_name, last_name, production_co)
VALUES (1, 'Steven', 'Spielberg', NULL);
INSERT INTO director (director_id, first_name, last_name, production_co)
VALUES (2, 'Robert', 'Rodriguez', 'Troublemaker');
INSERT INTO director (director_id, first_name, last_name, production_co)
VALUES (3, 'Hayao', 'Miyazaki', 'Studio Ghibli');
INSERT INTO director (director_id, first_name, last_name, production_co)
VALUES (4, 'Edgar', 'Wright', NULL);
INSERT INTO director (director_id, first_name, last_name, production_co)
VALUES (5, 'James', 'Cameron', 'Lightstorm');

-- Link directors to movies.
INSERT INTO movie_director (movie_director_id, director_id, movie_id)
VALUES (1, 1, 1);
INSERT INTO movie_director (movie_director_id, director_id, movie_id)
VALUES (2, 2, 2);
INSERT INTO movie_director (movie_director_id, director_id, movie_id)
VALUES (3, 3, 3);
INSERT INTO movie_director (movie_director_id, director_id, movie_id)
VALUES (4, 4, 4);
INSERT INTO movie_director (movie_director_id, director_id, movie_id)
VALUES (5, 5, 5);

-- Academy awards data.
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (1, 'Best Picture', 1996, 'Film');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (2, 'Best Picture', 2004, 'Film');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (3, 'Best Picture', 2018, 'Film');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (4, 'Best Animation', 1996, 'Animation');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (5, 'Best Sound', 2018, 'Technical');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (6, 'Best Actor', 2019, 'Acting');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (7, 'Best Actor', 2020, 'Acting');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (8, 'Best Actor', 2021, 'Acting');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (9, 'Best Actor', 2022, 'Acting');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (10, 'Best Actor', 2023, 'Acting');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (11, 'Best Director', 2018, 'Directing');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (12, 'Best Director', 2019, 'Directing');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (13, 'Best Director', 2020, 'Directing');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (14, 'Best Director', 2021, 'Directing');
INSERT INTO academy_award (award_id, award_name, award_year, award_category)
VALUES (15, 'Best Director', 2022, 'Directing');


-- Link awards to movies.
INSERT INTO movie_award (movie_award_id, movie_id, award_id)
VALUES (1, 3, 1);
INSERT INTO movie_award (movie_award_id, movie_id, award_id)
VALUES (2, 1, 2);
INSERT INTO movie_award (movie_award_id, movie_id, award_id)
VALUES (3, 4, 3);
INSERT INTO movie_award (movie_award_id, movie_id, award_id)
VALUES (4, 3, 4);
INSERT INTO movie_award (movie_award_id, movie_id, award_id)
VALUES (5, 4, 5);

-- Link awards to actors.
INSERT INTO actor_award (actor_award_id, actor_id, award_id)
VALUES (1, 2, 6);
INSERT INTO actor_award (actor_award_id, actor_id, award_id)
VALUES (2, 4, 7);
INSERT INTO actor_award (actor_award_id, actor_id, award_id)
VALUES (3, 1, 8);
INSERT INTO actor_award (actor_award_id, actor_id, award_id)
VALUES (4, 2, 9);
INSERT INTO actor_award (actor_award_id, actor_id, award_id)
VALUES (5, 5, 10);

-- Link awards to directors.
INSERT INTO director_award (director_award_id, director_id, award_id)
VALUES (1, 5, 11);
INSERT INTO director_award (director_award_id, director_id, award_id)
VALUES (2, 3, 12);
INSERT INTO director_award (director_award_id, director_id, award_id)
VALUES (3, 1, 13);
INSERT INTO director_award (director_award_id, director_id, award_id)
VALUES (4, 1, 14);
INSERT INTO director_award (director_award_id, director_id, award_id)
VALUES (5, 1, 15);

-- Final commit to save all inserted data.
COMMIT;
