-- Create Database
CREATE DATABASE library_system;
USE library_system;

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255)
);

-- Genres Table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    price DECIMAL(8, 2),
    stock INT DEFAULT 0,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Borrowings Table
CREATE TABLE Borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Borrow Items Table
CREATE TABLE Borrow_Items (
    borrow_item_id INT AUTO_INCREMENT PRIMARY KEY,
    borrowing_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (borrowing_id) REFERENCES Borrowings(borrowing_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Sample Data Inserts
INSERT INTO Members (name, email, address) VALUES
('Anjali Sharma', 'anjali@example.com', 'Mumbai'),
('Rahul Mehra', 'rahul@example.com', 'Hyderabad'),
('Sneha Iyer', 'sneha@example.com', 'Chennai'),
('Amit Khanna', 'amit@example.com', 'Delhi');

INSERT INTO Genres (genre_name) VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('Technology');

INSERT INTO Books (title, author, price, stock, genre_id) VALUES
('The Alchemist', 'Paulo Coelho', 299.00, 12, 1),
('Sapiens', 'Yuval Noah Harari', 499.00, 8, 2),
('A Brief History of Time', 'Stephen Hawking', 350.00, 5, 3),
('Introduction to Algorithms', 'Cormen et al.', 950.00, 4, 4);

INSERT INTO Borrowings (member_id, borrow_date, return_date) VALUES
(1, '2025-06-20', NULL),
(2, '2025-06-21', '2025-06-25'),
(3, '2025-06-22', NULL);

INSERT INTO Borrow_Items (borrowing_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 4, 1);
