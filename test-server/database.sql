-- Tạo database
CREATE DATABASE IF NOT EXISTS exam;
USE exam;

-- Tạo bảng Phone
CREATE TABLE IF NOT EXISTS Phone (
    PhoneID INT AUTO_INCREMENT PRIMARY KEY,
    Name    VARCHAR(100)   NOT NULL,
    Price   DECIMAL(15, 2) NOT NULL,
    Image   VARCHAR(255)
);

-- Thêm 5 bản ghi mẫu
INSERT INTO Phone (Name, Price, Image) VALUES
('iPhone 15 Pro Max', 1200.00, 'iphone15.jpg'),
('Samsung Galaxy S24 Ultra', 1150.00, 's24ultra.jpg'),
('Google Pixel 8 Pro', 999.00, 'pixel8.jpg'),
('Xiaomi 14 Ultra', 1100.00, 'xiaomi14.jpg'),
('Sony Xperia 1 V', 1300.00, 'xperia1.jpg');
