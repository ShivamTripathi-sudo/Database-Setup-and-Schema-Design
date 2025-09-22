create database Library;
use Library;
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    join_date DATE DEFAULT (CURRENT_DATE)
);
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    published_year INT,
    copies_total INT DEFAULT 1,
    copies_available INT DEFAULT 1
);
-- Book_Authors MAny to many //
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50),
    hire_date DATE DEFAULT (CURRENT_DATE)
);
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    staff_id INT,
    loan_date DATE DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
CREATE TABLE Fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT,
    amount DECIMAL(6,2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);
INSERT INTO Members (name, email, phone, address)
VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'New York'),
('Bob Smith', 'bob@example.com', '9123456780', 'California');
-- @@@@@@@@@@@@@@@@@@@ --
INSERT INTO Authors (name, bio)
VALUES
('J.K. Rowling', 'Author of Harry Potter'),
('George Orwell', 'Author of 1984 and Animal Farm');

INSERT INTO Books (title, isbn, published_year, copies_total, copies_available)
VALUES
('Harry Potter and the Philosopher''s Stone', '9780747532699', 1997, 5, 5),
('1984', '9780451524935', 1949, 3, 3);
INSERT INTO Book_Authors (book_id, author_id)
VALUES
(1, 1),  -- Harry Potter by J.K. Rowling
(2, 2);  -- 1984 by George Orwell

INSERT INTO Staff (name, email, role)
VALUES
('Emily White', 'emily@example.com', 'Librarian'),
('John Doe', 'john@example.com', 'Assistant');

INSERT INTO Loans (member_id, book_id, staff_id, due_date)
VALUES
(1, 1, 1, '2025-10-01'),
(2, 2, 2, '2025-10-05');
INSERT INTO Fines (loan_id, amount, paid)
VALUES
(1, 5.00, FALSE);





