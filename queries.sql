-- queries.sql
-- Example queries for Library Management database

-- 1. List all books with their authors and genres
SELECT b.title, a.name AS author, b.genre, b.year_published
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
ORDER BY b.year_published DESC;

-- 2. Show all currently borrowed books (not yet returned)
SELECT b.title, m.name AS borrowed_by, l.loan_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- 3. Count how many books each member has borrowed
SELECT m.name, COUNT(l.loan_id) AS total_books_borrowed
FROM Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
GROUP BY m.name
ORDER BY total_books_borrowed DESC;

-- 4. Find all books by a specific author (e.g., George Orwell)
SELECT b.title
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE a.name = 'George Orwell';

-- 5. List overdue books (borrowed more than 14 days ago and not returned)
SELECT b.title, m.name AS borrowed_by, l.loan_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL
  AND julianday('now') - julianday(l.loan_date) > 14;
