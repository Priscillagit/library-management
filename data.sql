-- data.sql
-- Insert sample data into Library Management database

-- Insert authors
INSERT INTO Authors (name, birth_year) VALUES
('J.K. Rowling', 1965),
('George Orwell', 1903),
('Jane Austen', 1775),
('Chinua Achebe', 1930),
('Agatha Christie', 1890);

-- Insert books
INSERT INTO Books (title, author_id, genre, year_published) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', 1998),
('1984', 2, 'Dystopian', 1949),
('Animal Farm', 2, 'Political Satire', 1945),
('Pride and Prejudice', 3, 'Romance', 1813),
('Things Fall Apart', 4, 'Historical Fiction', 1958),
('Murder on the Orient Express', 5, 'Mystery', 1934);

-- Insert members
INSERT INTO Members (name, email, join_date) VALUES
('Alice Johnson', 'alice@example.com', '2025-07-15'),
('Bob Smith', 'bob@example.com', '2025-07-20'),
('Cynthia Lee', 'cynthia@example.com', '2025-08-01');

-- Insert loans
INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-08-01', NULL), -- Alice borrowed Harry Potter 1
(3, 2, '2025-07-20', '2025-08-05'), -- Bob borrowed 1984 and returned it
(6, 3, '2025-08-02', NULL); -- Cynthia borrowed Things Fall Apart
