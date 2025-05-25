# Practice Scenario: Training & Job Application System 
# Part 1: UNION Practice 
### 1. List all unique people who either trained or applied for a job. 
o Show their full names and emails. 

o Use UNION (not UNION ALL) to avoid duplicates.
```
select FullName, Email from Trainees 
UNION 
select FullName, Email from Applicants 


```
!['all unique people who either trained or applied for a job'](images/1.1.jpg)




