
SET LINESIZE <set print page length>;
set PAGESIZE 200;

-- 1. Create the following table
---- a. book_details(ISBN, title, MRP, publisher name, author)
CREATE TABLE book_details (
    ISBN VARCHAR(5),
    title VARCHAR(20),
    MRP NUMBER,
    publisher_name VARCHAR(20),
    author VARCHAR(20)
);

DESC book_details;

---- b. publisher (publisher_id, publisher name, city, state, country)
CREATE TABLE publisher (
    publisher_id VARCHAR(15),
    publisher_name VARCHAR(20),
    city VARCHAR(15),
    state VARCHAR(15),
    country VARCHAR(15)
);

DESC publisher;

-- 2 Populate the tables.
INSERT INTO book_details VALUES ('&ISBN', '&title', &MRP, '&publisher_name', '&author');

-- ISBN  title        MRP  publisher_name  author
-- 11    Green Birds  180  DC Books        Johns
-- 12    Red Carpet   190  Main Books      Jeswin
-- 13    Outline      170  PK Books        Joe
-- 14    Timeline     160  LM Prints       Thomas

INSERT INTO publisher VALUES ('&publisher_id', '&publisher_name', '&city', '&state', '&country');

-- publisher_id  publisher_name  city     state        country
-- 111           DC Books        cochin   kerala       India
-- 123           Main Books      bombay   Maharashtra  India
-- 134           PK Books        madras   Thamil Nadu  India
-- 145           TL Books        chennai  Thamil Nadu  India

-- 3. Display the details of all books.
SELECT *
FROM book_details;

-- 4. Retrieve the details of all publishers.
SELECT *
FROM publisher;

-- 5. List the name of books, price and city of publisher of all books.
SELECT title, MRP AS price, city
FROM book_details
JOIN publisher
ON book_details.publisher_name = publisher.publisher_name;

-- 6. List the details of books and their corresponding publisher details.
SELECT *
FROM book_details
JOIN publisher
ON book_details.publisher_name = publisher.publisher_name;

-- 7. List all publishers, details of books published by each publisher.
SELECT *
FROM publisher
JOIN book_details
ON book_details.publisher_name = publisher.publisher_name;

-- 8. List the name of publishers which have got entry either in book_details or publisher table.
SELECT publisher_name FROM book_details
UNION
SELECT publisher_name FROM publisher;

-- 9. List the name of publisher which have got entry in both tables.
SELECT publisher_name FROM book_details
INTERSECT
SELECT publisher_name FROM publisher;

-- 10. List the name of publisher that have got entry in book_details but not in publisher table
SELECT publisher_name FROM book_details
EXCEPT
SELECT publisher_name FROM publisher;