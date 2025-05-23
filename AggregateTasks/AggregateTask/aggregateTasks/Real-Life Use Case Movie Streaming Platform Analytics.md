# Real-Life Use Case: Movie Streaming Platform Analytics

The company wants to track user engagement, movie popularity, watch time, and 
subscription statistics to improve platform performance and personalize user 
recommendations. 
➢ You must use this exact structure to create the tables, insert the sample 
data, and then apply the aggregation queries listed for Beginner, 
Intermediate, and Advanced levels.

## * Beginner Level (Basic Practice) 
1. Total Number of Users 
2. Average Duration of All Movies 
3. Total Watch Time 
4. Number of Movies per Genre 
5. Earliest User Join Date 
6. Latest Movie Release Year 

## 1 . Total Number of Users
```
select count(*) as Total_num_users from Users

```

Output:
!['Total Number of Users'](img3/1.JPG)
## 2. Average Duration of All Movies 
```
SELECT AVG(WatchDuration) as Average_WatchDuration from WatchHistory

```
Output:
!['Average Duration '](img3/2.JPG)

## 3. Total Watch Time 
```
SELECT sum(WatchDuration) as Total_WatchTime from WatchHistory
```

Output
!['Total Watch Time '](img3/3.JPG)

## 4. Number of Movies per Genre
```
select count(MovieID) as Number_of_movies, Genre
from Movies
group by Genre

```
Output
!['Number of Movies '](img3/4.JPG)

## 5. Earliest User Join Date 
```
select Min(JoinDate) as EarliestUserJoinDate from Users

```
Output
!['Earliest User Join Date'](img3/5.JPG)

## 6. Latest Movie Release Year 
```
select Max(ReleaseYear) as LatestMovieReleaseYear  from Movies

```
Output

!['Latest Movie Release Year '](img3/6.JPG)

## Intermediate Level (Deeper Insights) 
4. Number of Users Per Subscription Type 
5. Total Watch Time per User 
6. Average Watch Duration per Movie 
7. Average Watch Time per Subscription Type 
8. Number of Views per Movie (Including Zero) 
9. Average Movie Duration per Release Year


### 4. Number of Users Per Subscription Type
```
select count(UserID) as Number_of_Users, SubscriptionType
from Users
group by SubscriptionType

```
Output:
!['Number of Users Per Subscription Type'](img3/2.1.JPG)

### 5. Total Watch Time per User 
```
SELECT sum(WatchDuration) as Total_Watch_Time  , UserID 
from WatchHistory
GROUP BY UserID

```
Output:
!['Total Watch Time'](img3/2.2.JPG)

### 6. Average Watch Duration per Movie
```
SELECT avg(WatchDuration) as Average_Watch_Duration  , MovieID 
from WatchHistory
GROUP BY MovieID
```
Output:
!['Average Watch Duration per Movie'](img3/2.3.JPG)

### 7. Average Watch Time per Subscription Type 
```
SELECT avg(WH.WatchDuration) as Average_Watch_Duration , Users.SubscriptionType
from WatchHistory WH join Users 
on Users.UserID = WH.UserID
group by Users.SubscriptionType

```
Output:
!['Average Watch Time per Subscription Type'](img3/2.4.JPG)

### 8. Number of Views per Movie (Including Zero) 
```
select count(UserID) as number_of_views , MovieID
from WatchHistory
group by MovieID

```

Output:
!['Number of Views '](img3/2.5.JPG)

### 9. Average Movie Duration per Release Year
```
SELECT avg(WH.WatchDuration) as Average_Watch_Duration , Movies.ReleaseYear
from WatchHistory WH join Movies 
on Movies.MovieID = WH.MovieID
group by  Movies.ReleaseYear

```
Output:
!['Average Movie Duration '](img3/2.6.JPG)






