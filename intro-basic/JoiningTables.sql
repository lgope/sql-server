-- Database (track)
/*
track_id	name	        album_id	mediatype_id	genre_id	composer	                    milliseconds	bytes	unit_price
 1	        Blind Man	        5	        1	            1	    Steven Tyler Joe Perry	            240718	    7877453	    0.99
 2	        Deuces Are Wild	    5	        1	            1	    Steven Tyler Jim Vallance	        215875	    7074167	    0.99
 3	        The Other Side  	5	        1	            1	    Steven Tyler Jim Vallance	        244375	    7983270	    0.99
 4	        Crazy	            5	        1	            1	    Steven Tyler Joe Perry Desmond      316656	    10402398	0.99
 5	        Eat The Rich        5	        1	            1	    Steven Tyler Joe Perry Jim  	    251036	    8262039	    0.99
 6	        Angel	            5	        1	            1	    Steven Tyler Desmond Child	        307617	    9989331	    0.99
 7	        Livin' On The Edge	5	        1	            1	    Steven Tyler Joe Perry Mark 	    381231	    12374569	0.99
 8	        All I Really Want	6	        1	            1	    Alanis Morissette & Glenn Ballard	284891	    9375567	    0.99
 9	        You Oughta Know	    6	        1	            1	    Alanis Morissette & Glenn Ballard	249234	    8196916	    0.99
10	        Perfect	            6	        1	            1	    Alanis Morissette & Glenn Ballard	188133	    6145404	    0.99
11	        Hand In My Pocket	6	        1	            1	    Alanis Morissette & Glenn Ballard	221570	    7224246	    0.99
12	        Right Through You	6	        1	            1	    Alanis Morissette & Glenn Ballard	176117	    5793082	    0.99
13	        Forgiven	        6	        1	            1	    Alanis Morissette & Glenn Ballard	300355	    9753256	    0.99
14      	You Learn	        6	        1	            1	    Alanis Morissette & Glenn Ballard	239699	    7824837	    0.99
15	        Head Over Feet  	6	        1	            1	    Alanis Morissette & Glenn Ballard	267493	    8758008	    0.99
*/

-- Database (album)
/*
album_id	title	                                artist_id
 1	        For Those About To Rock We Salute You	    1
 2	        Balls to the Wall	                        2
 3	        Restless and Wild	                        2
 4	        Let There Be Rock	                        1
 5	        Big Ones	                                3
 6	        Jagged Little Pill	                        4
 7	        Facelift	                                5
 8	        Warner 25 Anos	                            6
 9	        Plays Metallica By Four Cellos	            7
 10	        Audioslave	                                8
 11	        Out Of Exile	                            8
 12	        BackBeat Soundtrack	                        9
 13	        The Best Of Billy Cobham	                10
 14	        Alcohol Fueled Brewtality Live! Disc 1	    11
 15	        Alcohol Fueled Brewtality Live! Disc 2	    11
*/

-- Database(artist)
/*
artist_id	name
    1	    AC/DC
    2	    Accept
    3	    Aerosmith
    4	    Alanis Morissette
    5	    Alice In Chains
    6	    Ant├┤nio Carlos Jobim
    7	    Apocalyptica
    8	    Audioslave
    9	    BackBeat
    10	    Billy Cobham
    11	    Black Label Society
    12	    Black Sabbath
    13	    Body Count
    14	    Bruce Dickinson
    15	    Buddy Guy
*/

-- Inner Joins - a perfect match
-- 1) Perform an inner join between album and track using the album_id column.
SELECT
    track_id,
    name AS track_name,
    title AS album_title
FROM track
    -- Complete the join type and the common joining column
    INNER JOIN album on album.album_id = track.album_id;


-- 2) Select the album_id and title columns from album (the main source table name). Select the name column from artist and alias it as artist. Identify a common column between the album and artist tables and perform an inner join.
-- Select album_id and title from album, and name from artist
SELECT
    album_id,
    title,
    artist.name AS artist
-- Enter the main source table name
FROM album
    -- Perform the inner join
    INNER JOIN artist on artist.artist_id = album.artist_id;


-- 3) Qualify the name column by specifying the correct table prefix in both cases. Complete both INNER JOIN clauses to join album with track, and artist with album.

SELECT track_id,
    -- Enter the correct table name prefix when retrieving the name column from the track table
    track.name AS track_name,
    title as album_title,
    -- Enter the correct table name prefix when retrieving the name column from the artist table
    artist.name AS artist_name
FROM track
    -- Complete the matching columns to join album with track, and artist with album
    INNER JOIN album on album.album_id = track.album_id
    INNER JOIN artist on artist.artist_id = album.artist_id;