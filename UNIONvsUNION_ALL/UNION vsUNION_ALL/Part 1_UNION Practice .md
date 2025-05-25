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

### 2.  Now use UNION ALL. What changes in the result? 
o Explain why one name appears twice. 
because Layla Al Riyami is both a trainee and an applicant, so her name appears in both tables.
```
select FullName, Email from Trainees 
UNION All
select FullName, Email from Applicants 

```
!['Now use UNION ALL'](images/1.2.jpg)


