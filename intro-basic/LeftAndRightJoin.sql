-- Database (invoice)
/*
invoice_Id	customer_id	    invoice_Date	        billing_address	    billing_city	billing_state	billing_country	billing_postalcode	total
1	            2	        1900-01-01 00:00:00	    Theodor-Heuss-Stra	Stuttgart	    NULL	        Germany	        70174	            1.98
2	            4	        1900-01-01 00:00:00	    Ullev├Ñlsveien 14	Oslo	        NULL	        Norway	        171	                3.96
3	            8	        1900-01-01 00:00:00	    Gr├⌐trystraat 63	Brussels	    NULL	        Belgium         1000                5.94
4	            14	        1900-01-01 00:00:00	    8210 111 ST NW	    Edmonton	    AB	            Canada	        T6G 2C7	            8.91
5	            23	        1900-01-01 00:00:00	    69 Salem Street	    Boston	        MA	            USA             2113	            13.86
6	            37	        1900-01-01 00:00:00	    Berger Stra├ƒe 10	Frankfurt	    NULL	        Germany	        60316	            0.99
7	            38	        1900-01-01 00:00:00	    Barbarossastr       Berlin	        NULL	        Germany	        10779	            1.98
8	            40	        1900-01-01 00:00:00	    8 Rue Hanovre	    Paris	        NULL	        France	        75002	            1.98
9	            42	        1900-01-01 00:00:00	    9 Place Louis Ba	Bordeaux	    NULL	        France	        33000	            3.96
10	            46	        1900-01-01 00:00:00	    3 Chatham Street	Dublin	        Dublin	        Ireland	        NULL	            5.94
11	            52	        1900-01-01 00:00:00	    202 Hoxton Street	London      	NULL	        United Kingdom	N1 5LH	            8.91
12	            2	        1900-01-01 00:00:00	    Theodor-Heuss-S     Stuttgart       NULL	        Germany	        70174	            13.86
13	            16	        1900-01-01 00:00:00	    1600 Amphitheatre	Mountain View   CA	            USA	            94043-1351	        0.99
14	            17	        1900-01-01 00:00:00	    1 Microsoft Way	    Redmond	        WA	            USA	            98052-8300	        1.98
15	            19	        1900-01-01 00:00:00	    1 Infinite Loop  	CA	            New York        USA	            95014               1.98
*/

-- Database (invoiceline)
/*
invoiceline_id	invoice_id	track_id	unit_price	quantity
1	                1	        2	    0.99	        1
2	                1	        4	    0.99	        1
3	                2	        6	    0.99	        1
4	                2	        8	    0.99	        1
5	                2	        10  	0.99        	1
6	                2	        12  	0.99        	1
7	                3	        16  	0.99        	1
8	                3	        20  	0.99        	1
9	                3	        24  	0.99        	1
10	                3	        28  	0.99        	1
11	                3	        32  	0.99        	1
12	                3	        36  	0.99        	1
13	                4	        42  	0.99        	1
14	                4	        48  	0.99        	1
15	                4	        54  	0.99        	1
*/

-- 1) Complete the LEFT JOIN, returning all rows from the specified columns from invoiceline and any matches from invoice.
SELECT
    invoiceline_id,
    unit_price,
    quantity,
    billing_state
-- Specify the source table
FROM invoiceline
    -- Complete the join to the invoice table
    LEFT JOIN invoice
    ON invoiceline.invoice_id = invoice.invoice_id;





-- 2) SELECT the fully qualified column names album_id from album and name from artist. Then, join the tables so that only matching rows are returned (non-matches should be discarded).
-- SELECT the fully qualified album_id column from the album table
SELECT
    album_id,
    title,
    album.artist_id,
    -- SELECT the fully qualified name column from the artist table
    artist.name as artist
FROM album
    -- Perform a join to return only rows that match from both tables
    INNER JOIN artist ON album.artist_id = artist.artist_id
WHERE album.album_id IN (213,214)

-- 3) To complete the query, join the album table to the track table using the relevant fully qualified album_id column. The album table is on the left-hand side of the join, and the additional join should return all matches or NULLs.

SELECT
    album.album_id,
    title,
    album.artist_id,
    artist.name as artist
FROM album
    INNER JOIN artist ON album.artist_id = artist.artist_id
    -- Perform the correct join type to return matches or NULLS from the track table
    LEFT JOIN track on album.album_id = track.album_id
WHERE album.album_id IN (213,214)