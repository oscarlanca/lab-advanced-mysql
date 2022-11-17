USE Publishers;
SELECT * FROM authors
LIMIT 10;
SELECT title_id FROM sales
;

SELECT title, royalty, title_id FROM titles;

SELECT title FROM titles;

SELECT * FROM roysched;
SELECT * FROM sales;

SELECT royalty, qty
FROM roysched
INNER JOIN sales
ON (title_id);

SELECT title_id, sum(royalty)
FROM roysched
GROUP BY title_id;

SELECT sum(qty), sum(royalty)
FROM sales AS s
LEFT JOIN roysched AS r
ON ('title_id')
GROUP BY title_id;

SELECT * FROM titleauthor;
SELECT CONCAT (au_fname, ' ', au_lname) AS complete_name,
au_id
FROM authors;

CREATE TABLE most_profiting_authors(
SELECT CONCAT (au_fname, ' ', au_lname) AS complete_name,
SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM titles
LEFT JOIN sales 
USING (title_id)
LEFT JOIN titleauthor
USING(title_id)
LEFT JOIN authors
USING (au_id)
GROUP BY au_id, titles.title_id
ORDER BY sales_royalty DESC);

SELECT * FROM most_profiting_authors;