-- Art Gallery Inventory & Sales Database
-- Author: Bridget Ngugi
-- Description: SQL schema for managing artworks, artists, exhibitions, sales, and buyers

-- Drop tables if they exist (for re-import)

-- Create database
CREATE DATABASE art_gallery;
USE art_gallery;

-- Create tables
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100) NOT NULL
);

-- Artworks table
CREATE TABLE Artworks (
    artwork_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    year_created YEAR NOT NULL,
    medium VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status ENUM('available', 'sold') NOT NULL DEFAULT 'available',
    UNIQUE(title, artist_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)

);

-- Exhibitions table
CREATE TABLE Exhibitions (
  exhibition_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  location VARCHAR(100) NOT NULL,
  description TEXT,
  UNIQUE(name, start_date, end_date)
);

-- Exhitibition Artworks table(M-M: Exhibitions <-> Artworks)
CREATE TABLE ExhibitionArtworks (
    exhibition_id INT NOT NULL,
    artwork_id INT NOT NULL,
    PRIMARY KEY (exhibition_id, artwork_id),
    FOREIGN KEY (exhibition_id) REFERENCES Exhibitions(exhibition_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id)
);

-- Buyers table
CREATE TABLE Buyers (
    buyer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

-- Sales table
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    artwork_id INT NOT NULL,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id)
);

-- Example constraints:
-- - Each artwork is created by one artist (1-M)
-- - Each artwork can be in multiple exhibitions (M-M)
-- - Each sale links an artwork and a buyer (M-M via Sales)
-- - Each buyer can buy multiple artworks (1-M)



