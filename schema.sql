-- Run this once in MySQL to create the tables the backend expects.
-- Adjust the database name if yours isn't "ecommerce".

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL  -- stores a bcrypt HASH, never plaintext
);

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  image VARCHAR(255)  -- filename only, matched against your Flutter assets/ folder
);

-- Demo login: admin@example.com / 1234
-- The hash below was generated with bcryptjs (10 salt rounds) for the
-- plaintext password "1234" - it is NOT the plaintext, it's a real hash.
INSERT INTO users (email, password) VALUES
  ('admin@example.com', '$2b$10$zq14yLXuA46v/9K.7umfS.GlYwgAl.YlouNVuSimkmDoQNfIY21fO');

-- Demo products, matching the asset filenames already in your Flutter project
INSERT INTO products (name, price, image) VALUES
  ('T-Shirt', 19.99, 'tshirt.jpg'),
  ('Jeans', 49.99, 'jeans.jpg'),
  ('Sneakers', 89.99, 'sneakers.jpg');
