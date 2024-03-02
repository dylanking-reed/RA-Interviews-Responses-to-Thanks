.mode csv
.import "RA Interviews Responses to Thanks.csv" responses
.headers on

create table thanks_level as select "Thanks Level", "Age Bin", count(*) as "#Interviews", 
round(cast(sum("No problem") as real)/count(*)*100, 1) as "%No problem",
round(cast(sum("You're Welcome") as real)/count(*)*100, 1) as "%You're Welcome",
round(cast(sum("Acknowledgement") as real)/count(*)*100, 1) as "%Acknowledgement",
round(cast(sum("Farewell") as real)/count(*)*100, 1)  as "%Farewell",
round(cast(sum("Non-Verbal") as real)/count(*)*100, 1) as "%Non-Verbal",
round(cast(sum("No Response") as real)/count(*)*100, 1) as "%No Response"
from responses
group by "Thanks Level", "Age Bin";

.output Analysis/thanks_level.csv   
select * from thanks_level;

create table age_bin as select "Age Bin", count(*) as "#Interviews", 
round(cast(sum("No problem") as real)/count(*)*100, 1) as "%No problem",
round(cast(sum("You're Welcome") as real)/count(*)*100, 1) as "%You're Welcome",
round(cast(sum("Acknowledgement") as real)/count(*)*100, 1) as "%Acknowledgement",
round(cast(sum("Farewell") as real)/count(*)*100, 1)  as "%Farewell",
round(cast(sum("Non-Verbal") as real)/count(*)*100, 1) as "%Non-Verbal",
round(cast(sum("No Response") as real)/count(*)*100, 1) as "%No Response"
from responses
group by "Age Bin";


.output Analysis/age_bin.csv         
select * from age_bin;

create table on_campus as select "On Campus", "Age Bin", count(*) as "#Interviews", 
round(cast(sum("No problem") as real)/count(*)*100, 1) as "%No problem",
round(cast(sum("You're Welcome") as real)/count(*)*100, 1) as "%You're Welcome",
round(cast(sum("Acknowledgement") as real)/count(*)*100, 1) as "%Acknowledgement",
round(cast(sum("Farewell") as real)/count(*)*100, 1)  as "%Farewell",
round(cast(sum("Non-Verbal") as real)/count(*)*100, 1) as "%Non-Verbal",
round(cast(sum("No Response") as real)/count(*)*100, 1) as "%No Response"
from responses
group by "On Campus", "Age Bin";

.output Analysis/on_campus.csv    
select * from on_campus; 

create table familiarity as select "Familiarity", "Age Bin", count(*) as "#Interviews", 
round(cast(sum("No problem") as real)/count(*)*100, 1) as "%No problem",
round(cast(sum("You're Welcome") as real)/count(*)*100, 1) as "%You're Welcome",
round(cast(sum("Acknowledgement") as real)/count(*)*100, 1) as "%Acknowledgement",
round(cast(sum("Farewell") as real)/count(*)*100, 1)  as "%Farewell",
round(cast(sum("Non-Verbal") as real)/count(*)*100, 1) as "%Non-Verbal",
round(cast(sum("No Response") as real)/count(*)*100, 1) as "%No Response"
from responses
group by "Familiarity", "Age Bin";

.output Analysis/familiarity.csv
select * from familiarity; 

create table distractedness as select "Distractedness","Age Bin",count(*) as "#Interviews", 
round(cast(sum("No problem") as real)/count(*)*100, 1) as "%No problem",
round(cast(sum("You're Welcome") as real)/count(*)*100, 1) as "%You're Welcome",
round(cast(sum("Acknowledgement") as real)/count(*)*100, 1) as "%Acknowledgement",
round(cast(sum("Farewell") as real)/count(*)*100, 1)  as "%Farewell",
round(cast(sum("Non-Verbal") as real)/count(*)*100, 1) as "%Non-Verbal",
round(cast(sum("No Response") as real)/count(*)*100, 1) as "%No Response"
from responses
group by "Distractedness", "Age Bin";      

.output Analysis/distractedness.csv 
select * from distractedness;

create table age_bin_by_on_campus as select 
  "On Campus",
  count(*) as "#Interviews",
  count(case when "Age Bin" = 20 then "Age Bin" end) as "#20yo Age Bin",
  count(case when "Age Bin" = 35 then "Age Bin" end) as "#35yo Age Bin",
  count(case when "Age Bin" = 50 then "Age Bin" end) as "#50yo Age Bin",
  count(case when "Age Bin" = 65 then "Age Bin" end) as "#65yo Age Bin"
from responses 
group by "On Campus";

.output Analysis/age_bin_by_on_campus.csv 
select * from age_bin_by_on_campus;

.output stdout
select count(*) 
  from responses 
  where "Age Bin" == 20 
  and "On Campus" == 1        
  and "No problem" == 1;
.exit
