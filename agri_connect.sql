-- Database: AgriConnect
CREATE DATABASE IF NOT EXISTS AgriConnect;
USE AgriConnect;

-- Table: Farmers
CREATE TABLE Farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    phone VARCHAR(15)
);

-- Table: Crops
CREATE TABLE Crops (
    crop_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT,
    crop_name VARCHAR(50),
    quantity_kg INT,
    price_per_kg DECIMAL(6,2),
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id)
);

-- Table: Trades
CREATE TABLE Trades (
    trade_id INT PRIMARY KEY AUTO_INCREMENT,
    crop_id INT,
    buyer_name VARCHAR(100),
    quantity_purchased INT,
    total_price DECIMAL(10,2),
    trade_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (crop_id) REFERENCES Crops(crop_id)
);

-- Insert sample data
INSERT INTO Farmers (name, location, phone) VALUES
('Ramesh', 'Hyderabad', '9876543210'),
('Suresh', 'Warangal', '9123456789');

INSERT INTO Crops (farmer_id, crop_name, quantity_kg, price_per_kg) VALUES
(1, 'Wheat', 100, 25.50),
(2, 'Rice', 200, 30.00);

INSERT INTO Trades (crop_id, buyer_name, quantity_purchased, total_price)
VALUES (1, 'AgroMart', 50, 1275.00);

-- Example query: View all trades with farmer details
SELECT F.name AS Farmer, C.crop_name, T.buyer_name, T.quantity_purchased, T.total_price
FROM Trades T
JOIN Crops C ON T.crop_id = C.crop_id
JOIN Farmers F ON C.farmer_id = F.farmer_id;
 