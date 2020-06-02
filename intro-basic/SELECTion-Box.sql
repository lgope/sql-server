/*  eurovision
euro_id	event_year	country	gender	group_type	place	points	host_country	host_region	is_final	sf_number	song_in_english
 1	    2009	    Israel	Female	    Group	    16	    53  	Away    	Away	        1	        null	    1
 2	    2009	    France	Female  	Solo	    8	    107 	Away    	Away        	1       	null	    0
 3	    2009	    Sweden	Female  	Solo	    21  	33  	Away    	Away          	1       	null	    1
 4	    2009	    Croatia	Both	    Group	    18  	45  	Away    	Away     	    1       	null	    0
 5	    2009	    PortugalBoth	    Group	    15  	57  	Away    	Away        	1       	null	    0
 6	    2009	    Iceland	Female  	Solo	    2	    218 	Away    	Away        	1       	null	    1
 7	    2009	    Greece	Male	    Solo	    7	    120 	Away	    Away        	1       	null	    1
 8	    2009	    Armenia	Female  	Group	    10  	92  	Away    	Home        	1   	    null    	1
 9	    2009	    Russia	Female  	Solo	    11	    91  	Home	    Home        	1       	null	    0
 10	    2009	    Azerbaijan	Both	Group	    3	    207	    Away    	Home        	1       	null    	1
*/


-- SELECT the country column FROM the eurovision table
SELECT country
FROM eurovision

-- Select the points column
SELECT points
FROM eurovision;

-- Limit the number of rows returned
SELECT TOP (50)
    points
FROM eurovision;

-- Return unique countries and use an alias
SELECT DISTINCT country as unique_country
FROM eurovision;

-- Return all columns, but only include the top half of the table - in other words, return 50 percent of the rows.
Select
    country,
    event_year
from
    eurovision;

--select all rows and columns from eurovision
SELECT
    *
FROM
    eurovision;

-- Return all columns, but only include the top half of the table - in other words, return 50 percent of the rows.

SELECT
    TOP (50) PERCENT
    *
FROM
    eurovision;


/* account

 | account_number | balance | 
 | A-109          | 450.00  | 
 | A-101          | 590.00  |
 | A-446          | 645.00  | 
 | A-905          | 950.00  | 

*/
--  Find bank accounts with a balance under $750:
SELECT account_number, balance
FROM account
WHERE balance < 700

-- Order results in increasing order of bank balance:
SELECT account_number, balance
FROM account
ORDER BY balance;

-- Order results in desc order of bank balance:
SELECT *
FROM account
ORDER BY balance desc;

-- select max balance
SELECT MAX(balance)
FROM account

-- select 2nd max balance
SELECT MAX(balance) AS balancebalance
FROM account
WHERE balance < (SELECT MAX(balance)
FROM account)

-- another way // select nth value (n is total lenght start with 0)
SELECT balance
FROM account
ORDER BY balance desc
limit n-1, 1