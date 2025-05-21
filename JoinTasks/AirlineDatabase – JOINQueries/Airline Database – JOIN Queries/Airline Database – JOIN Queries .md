# Airline Database – JOIN Queries 
##### 1. Display each flight leg's ID, schedule, and the name of the airplane assigned to it. 
```
select f_leg.let_no,  f_leg.secheduled_arr_time, f_leg.secheduled_dep_time, airport.name
from flight_leg f_leg inner join airport 
on airport.airport_code = f_leg.airport_code

```
![](images/1.jpg)