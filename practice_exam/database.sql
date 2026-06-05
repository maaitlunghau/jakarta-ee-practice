CREATE DATABASE IF NOT EXISTS exam;
USE exam;

CREATE TABLE IF NOT EXISTS Phone (
    PhoneID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(15,2) NOT NULL,
    Image VARCHAR(255)
);

-- Fill some records
INSERT INTO Phone (Name, Price, Image) VALUES ('iPhone 13', 799.00, 'iphone13.png');
INSERT INTO Phone (Name, Price, Image) VALUES ('Samsung Galaxy S21', 699.00, 's21.png');
INSERT INTO Phone (Name, Price, Image) VALUES ('Google Pixel 6', 599.00, 'pixel6.png');
