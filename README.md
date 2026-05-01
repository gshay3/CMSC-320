📘 CMSC-320 Database Project <br>

This repository contains a complete relational database project completed for CMSC 320 (Database Systems). The project focuses on designing, building, populating, and querying a fully normalized movie rental database using SQL (Oracle syntax).

The system models a real-world movie rental business, including customers, movies, distributors, inventory tracking, rentals, employees (actors and directors), and academy awards, along with all required relationships between entities.
 <br> <br>  <br>
📂 Project Overview

This project is divided into three main SQL scripts, each representing a key stage of database development. <br>
 <br> <br>
🔹 Tables.sql : Database Schema Creation A full SQL script that builds the entire database structure from scratch.

Features:

Drops all existing tables in dependency-safe order using CASCADE constraints <br>
Creates all required tables for the system <br>
Defines primary keys for each entity <br>
Establishes relationships between tables using foreign keys <br>
Implements referential integrity across the schema <br>
Commits all structural changes <br>

Key Entities:

Customer and Rental System <br>
Movie Catalog <br>
Distributor and Catalog System <br>
Inventory Tracking <br>
Purchase Orders and Line Items <br>
Actors and Directors <br>
Academy Awards and relationships <br>

Concepts Covered:

Relational database design <br>
Normalization principles <br>
DDL (Data Definition Language) <br>
Primary and foreign keys <br>
Referential integrity <br>
 <br> <br>
🔹 Populate.sql : Data Population Script A SQL script that populates the database with realistic sample data for testing and demonstration.

Features:

Deletes existing data in dependency-safe order <br>
Inserts sample customers with contact information <br>
Populates movie catalog with titles, genres, and formats <br>
Adds distributor records and catalog relationships <br>
Creates purchase orders and line items <br>
Populates inventory items for rental tracking <br>
Inserts rental transactions and detailed rental line items <br>
Adds actor, director, and award data <br>
Links all entities through relationship tables <br>
Commits all inserted data <br>

Concepts Covered:

Data insertion (DML) <br>
Referential integrity enforcement <br>
Relationship mapping <br>
Realistic dataset construction <br>
Transaction control (COMMIT) <br>
 <br> <br>
🔹 Queries.sql : Query & Data Manipulation Script A SQL script demonstrating retrieval and modification of data within the database.

Features:

SELECT queries for customer and distributor information <br>
JOIN operations across rental and movie tables <br>
Filtering rental data by date range <br>
UPDATE operation to modify customer information <br>
DELETE operation to remove a customer record <br>
Demonstrates real-world database interaction patterns <br>

Concepts Covered:

SELECT queries and filtering <br>
JOIN operations across multiple tables <br>
Data modification (UPDATE, DELETE) <br>
CRUD operations <br>
Relational querying techniques <br>
