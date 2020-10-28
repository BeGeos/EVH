-- Top 10 queries for EVH Database --

-- What songs were written by who? Just change the name at the end to find Out
USE VanHalen;
SELECT DISTINCT ar.name, s.title, a.year
FROM Artist ar
JOIN Songs_Artist sar ON ar.artist_id=sar.artist_id
JOIN Songs s ON s.song_id=sar.song_id
JOIN Songs_Album sa ON s.song_id=sa.song_id
JOIN Album a ON a.album_id=sa.album_id
WHERE name = 'Eddie Van Halen' -- make sure to use the same name PS: SQL is not case sensitive

-- Give me all the versions of a song (again just change the name of the song)
USE VanHalen;
SELECT s.title, s.length, s.link
FROM Songs s
WHERE s.title = 'unchained' -- just change the name of the song
ORDER BY s.song_id ASC

-- Which albums have {song}?
USE VanHalen;
SELECT a.title, a.length, a.year
FROM Album a
JOIN Songs_album sa ON a.album_id=sa.album_id
JOIN Songs s ON s.song_id=sa.song_id
WHERE s.title = "Ain't talking about love" -- change the name here
ORDER BY a.year ASC

-- If you don't remember precisely the title of a song, or can't be bother typing it in Full
USE VanHalen;
SELECT s.title, s.length, s.link, s.live
FROM Songs s
WHERE s.title REGEXP '^ain' -- this will find everysong strating with ain

-- Which songs were released before/after {year}?
USE VanHalen;
SELECT s.title, s.length, s.link, a.year
FROM Songs s
JOIN Songs_album sa ON s.song_id=sa.song_id
JOIN Album a ON a.album_id=sa.album_id
WHERE a.year < '1986-01-01' -- change the date right here and the <> symbol
ORDER BY a.year ASC

-- All the songs longer or shorter than {length}
USE VanHalen;
SELECT s.title, s.length, s.link, s.live
FROM Songs s
WHERE s.length < 3.00
ORDER BY s.song_id ASC

-- All the artist that collaborated in writing an {album}
USE VanHalen;
SELECT DISTINCT a.title, ar.name, a.year
FROM Album a
JOIN Songs_album sa ON a.album_id=sa.album_id
JOIN Songs_artist sar ON sar.song_id=sa.song_id
JOIN Artist ar ON ar.artist_id=sar.artist_id
WHERE a.title = 'Van halen II' -- change the title of the album

-- Changing database: what genre is {band}?
USE Artists;
SELECT ar.artists_name, g.genre
FROM Artists ar
JOIN Genre g ON g.genre_id=ar.genre_id
WHERE ar.artists_name = 'Van halen' -- change band's name Here

-- Which bands have {genre}?
USE Artists;
SELECT ar.artists_name
FROM Artists ar
JOIN Genre g ON g.genre_id=ar.genre_id
WHERE g.genre = 'hard rock'

-- All live versions of a songs
USE VanHalen;
SELECT DISTINCT s.title, a.year
FROM Songs s
JOIN Songs_album sa ON s.song_id=sa.song_id
JOIN Album a ON a.album_id=sa.album_id
WHERE s.live = 'yes'
ORDER BY a.year ASC

-- Reminder: all these queries can be improved via Regular expression if you fancy
-- @BeGeos
