create database Movie_Streaming
use Movie_Streaming
create table Users
(
UserID INT PRIMARY KEY,
FullName VARCHAR(100) not null,
Email VARCHAR(100) not null,
JoinDate DATE not null,
SubscriptionType VARCHAR(20)  not null check (SubscriptionType in ('Free','Basic','Premium') ) 
)

create table Movies
(
MovieID INT PRIMARY KEY,
Title VARCHAR(100) not null,
Genre VARCHAR(50) not null,
ReleaseYear INT not null,
DurationMinutes INT not null
);

create table WatchHistory
(WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE not null,
WatchDuration INT -- in minutes
);

--Sample Data Insertion
-- Users table 
INSERT INTO Users (UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Ali Al Hinai', 'ali@example.com', '2024-01-01', 'Premium'),
(2, 'Noor Al Busaidi', 'noor@example.com', '2024-02-15', 'Basic'),
(3, 'Hassan Al Rawahi', 'hassan@example.com', '2024-03-10', 'Free'),
(4, 'Muna Al Lawati', 'muna@example.com', '2024-04-05', 'Premium'),
(5, 'Salim Al Zadjali', 'salim@example.com', '2024-05-01', 'Basic');
-- Movies table 
INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'The Silent Ocean', 'Sci-Fi', 2023, 120),
(2, 'Omani Roots', 'Documentary', 2022, 90),
(3, 'Fast Track', 'Action', 2024, 130),
(4, 'Code & Coffee', 'Drama', 2023, 110),
(5, 'The Last Byte', 'Thriller', 2023, 105);

-- WatchHistory table 
INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 1, '2025-05-10', 120),
(2, 2, 2, '2025-05-11', 80),
(3, 3, 3, '2025-05-12', 60),
(4, 4, 1, '2025-05-12', 90),
(5, 5, 5, '2025-05-13', 105);

-- Aggregation tasks
--1. Total Number of Users
select count(*) as Total_num_users from Users
-- 2. Average Duration of All Movies
select * from WatchHistory
SELECT AVG(WatchDuration) as Average_WatchDuration from WatchHistory

-- 3. Total Watch Time 
SELECT sum(WatchDuration) as Total_WatchTime from WatchHistory

-- 4. Number of Movies per Genre
select count(MovieID) as Number_of_movies, Genre
from Movies
group by Genre

--5. Earliest User Join Date

select Min(JoinDate) as EarliestUserJoinDate from Users

-- 6. Latest Movie Release Year 
select Max(ReleaseYear) as LatestMovieReleaseYear  from Movies

-- Intermediate Level (Deeper Insights) 
-- 4. Number of Users Per Subscription Type

select count(UserID) as Number_of_Users, SubscriptionType
from Users
group by SubscriptionType

-- 5. Total Watch Time per User 
SELECT sum(WatchDuration) as Total_Watch_Time  , UserID 
from WatchHistory
GROUP BY UserID

--6. Average Watch Duration per Movie
SELECT avg(WatchDuration) as Average_Watch_Duration  , MovieID 
from WatchHistory
GROUP BY MovieID

--7. Average Watch Time per Subscription Type 
SELECT avg(WH.WatchDuration) as Average_Watch_Duration , Users.SubscriptionType
from WatchHistory WH join Users 
on Users.UserID = WH.UserID
group by Users.SubscriptionType

--8. Number of Views per Movie (Including Zero) 
select count(UserID) as number_of_views , MovieID
from WatchHistory
group by MovieID

-- 9. Average Movie Duration per Release Year
SELECT avg(WH.WatchDuration) as Average_Watch_Duration , Movies.ReleaseYear
from WatchHistory WH join Movies 
on Movies.MovieID = WH.MovieID
group by  Movies.ReleaseYear

-- Advanced Level (Challenging Scenarios) 
-- 10. Most Watched Movie
select Top 1 sum(WH.WatchDuration) as Most_Watched_Movie , Movies.Title
from WatchHistory WH join Movies
on Movies.MovieID = WH.MovieID
group by Movies.Title

-- 11. Users Who Watched More Than 100 Minutes
select sum(WH.WatchDuration) as Minutes_Of_Watch , Users.FullName
from WatchHistory WH join Users
on Users.UserID = WH.UserID
group by Users.FullName
having sum(WH.WatchDuration) > 100

--12. Total Watch Time per Genre 
select sum(WH.WatchDuration) as Total_Watch_Time , Movies.Genre
from WatchHistory WH join Movies
on Movies.MovieID = WH.MovieID
group by Movies.Genre

-- 13. Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day) 
select count(WH.WatchID) AS MoviesWatched , WH.WatchDate, Users.FullName
from WatchHistory WH join Users
on Users.UserID = WH.UserID
group by Users.FullName ,  WH.WatchDate
having count(WH.WatchID) >=2

-- 14. Genre Popularity (Total Watch Duration by Genre)
SELECT Top 1 SUM(WH.WatchDuration) as TotalWatchDuration , Movies.Genre
from WatchHistory WH join Movies
on Movies.MovieID = WH.MovieID
group by Movies.Genre
ORDER BY 
    TotalWatchDuration DESC;

-- 15. User Retention Insight: Number of Users Joined Each Month
select count(UserID) as Number_of_Users, JoinDate
from Users
group by JoinDate
