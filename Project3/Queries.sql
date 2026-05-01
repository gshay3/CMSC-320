/* 
 * Description: This SQL script demonstrates basic database operations on a movie rental system.
 * It includes SELECT queries to retrieve and display data, as well as UPDATE and
 * DELETE statements to modify existing records.
 * @author Griffin Shay
 */

-- Retrieve a list of all customers with basic contact information.
SELECT 
    customer_id,
    first_name,
    last_name,
    street_address,
    zip_code
FROM customer
ORDER BY customer_id;


-- Retrieve rental activity from the past 30 days.
-- Includes rental ID, rental date, and movie title.
SELECT 
    r.rental_line_item_id,
    r.rental_date,
    m.title
FROM rental_line_item r
JOIN inventory_item i
    ON r.inventory_id = i.inventory_id
JOIN movie m
    ON i.movie_id = m.movie_id
WHERE r.rental_date >= SYSDATE - 30
ORDER BY rental_date;


-- Retrieve all distributor records.
SELECT *
FROM distributor
ORDER BY distributor_name;


-- Update the last name of a specific customer (customer_id = 3).
UPDATE customer
SET last_name = 'Amane'
WHERE customer_id = 3;


-- Delete a customer record (customer_id = 5).
DELETE FROM customer
WHERE customer_id = 5;
