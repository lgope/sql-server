
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

-- 1 ) Make the first selection from the album table. Then join the results by providing the relevant keyword and selecting from the artist table.
    SELECT
        album_id AS ID,
        title AS description,
        'Album' AS Source
    -- Complete the FROM statement
    FROM album
    -- Combine the result set using the relevant keyword
UNION
    SELECT
        artist_id AS ID,
        name AS description,
        'Artist'  AS Source
    -- Complete the FROM statement
    FROM artist;