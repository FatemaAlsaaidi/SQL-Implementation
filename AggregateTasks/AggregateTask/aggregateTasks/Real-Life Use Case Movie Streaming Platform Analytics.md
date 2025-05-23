# Real-Life Use Case: Movie Streaming Platform Analytics

The company wants to track user engagement, movie popularity, watch time, and 
subscription statistics to improve platform performance and personalize user 
recommendations. 
➢ You must use this exact structure to create the tables, insert the sample 
data, and then apply the aggregation queries listed for Beginner, 
Intermediate, and Advanced levels.

* Beginner Level (Basic Practice) 
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

