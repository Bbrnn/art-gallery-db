# Art Gallery Inventory & Sales Database

## Description
This project provides a relational database schema for managing an art gallery’s inventory, exhibitions, sales, artists, and buyers. The system is designed using MySQL and supports tracking artworks, organizing exhibitions, recording sales, and managing artist and buyer information.

## Features
- Manage artists and their artworks
- Track artwork status (available/sold)
- Organize exhibitions and associate artworks with exhibitions
- Record sales and buyer information

## How to Set Up

1. **Clone the Repository**
   ```sh
   git clone https://github.com/Bbrnn/art-gallery-db.git
   cd art-gallery-db

2. **Create the database**
   CREATE DATABASE art_gallery;
   USE art_gallery;

3. **Import the SQL Schema**
   mysql -u your_mysql_user -p art_gallery < art_gallery.sql


 -- Example constraints:
-- - Each artwork is created by one artist (1-M)
-- - Each artwork can be in multiple exhibitions (M-M)
-- - Each sale links an artwork and a buyer (M-M via Sales)
-- - Each buyer can buy multiple artworks (1-M)
   
