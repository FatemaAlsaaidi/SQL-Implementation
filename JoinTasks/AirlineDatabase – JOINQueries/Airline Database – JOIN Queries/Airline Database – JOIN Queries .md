# Airline Database – JOIN Queries 
##### 1. Display each flight leg's ID, schedule, and the name of the airplane assigned to it. 
```
select f_leg.let_no,  f_leg.secheduled_arr_time, f_leg.secheduled_dep_time, airport.name
from flight_leg f_leg inner join airport 
on airport.airport_code = f_leg.airport_code

```
![](images/1.jpg)

##### 2. Display all flight numbers and the names of the departure and arrival airports. 
```
SELECT 
    f.number AS flight_number,
    airport.city AS city
FROM flight f
INNER JOIN flight_leg f_leg 
    ON f.number = f_leg.number
INNER JOIN airport 
    ON f_leg.airport_code = airport.airport_code


```
![](images/2.jpg)
