CREATE DATABASE IF NOT EXISTS exam_wcd;
USE exam_wcd;

CREATE TABLE tbBook (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(60) NOT NULL,
    edition INT,
    photo VARCHAR(150)
);

-- Bắt đầu từ 2026100 theo yêu cầu đề bài
ALTER TABLE tbBook AUTO_INCREMENT = 2026100;

-- Thêm một bản ghi mẫu (1 mark)
INSERT INTO tbBook (title, author, edition, photo) VALUES ('Java Programming', 'James Gosling', 8, 'java.jpg');
