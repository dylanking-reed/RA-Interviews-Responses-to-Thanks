.mode csv
.import "Responses to Thanks (Cleaned).csv" responses
.headers on

create table thanks_level as select "Thanks Level", count(*) as "#Interviews", 
(cast(sum("No problem") as real)/count(*))*100 as "%No problem",
(cast(sum("You're Welcome") as real)/count(*))*100 as "%You're Welcome",
(cast(sum("Acknowledgement") as real)/count(*))*100 as "%Acknowledgement",
(cast(sum("Farewell") as real)/count(*))*100  as "%Farewell",
(cast(sum("Non-Verbal") as real)/count(*))*100 as "%Non-Verbal",
(cast(sum("No Response") as real)/count(*))*100 as "%No Response"
from responses
group by "Thanks Level";

.output Analysis/thanks_level.csv   
select * from thanks_level;

create table age_bin as select "Age Bin", count(*) as "#Interviews", 
(cast(sum("No problem") as real)/count(*))*100 as "%No problem",
(cast(sum("You're Welcome") as real)/count(*))*100 as "%You're Welcome",
(cast(sum("Acknowledgement") as real)/count(*))*100 as "%Acknowledgement",
(cast(sum("Farewell") as real)/count(*))*100  as "%Farewell",
(cast(sum("Non-Verbal") as real)/count(*))*100 as "%Non-Verbal",
(cast(sum("No Response") as real)/count(*))*100 as "%No Response"
from responses
group by "Age Bin";


.output Analysis/age_bin.csv         
select * from age_bin;

create table on_campus as select "On Campus", count(*) as "#Interviews", 
(cast(sum("No problem") as real)/count(*))*100 as "%No problem",
(cast(sum("You're Welcome") as real)/count(*))*100 as "%You're Welcome",
(cast(sum("Acknowledgement") as real)/count(*))*100 as "%Acknowledgement",
(cast(sum("Farewell") as real)/count(*))*100  as "%Farewell",
(cast(sum("Non-Verbal") as real)/count(*))*100 as "%Non-Verbal",
(cast(sum("No Response") as real)/count(*))*100 as "%No Response"
from responses
group by "On Campus";

.output Analysis/on_campus.csv    
select * from on_campus; 

create table familiarity as select "Familiarity", count(*) as "#Interviews", 
(cast(sum("No problem") as real)/count(*))*100 as "%No problem",
(cast(sum("You're Welcome") as real)/count(*))*100 as "%You're Welcome",
(cast(sum("Acknowledgement") as real)/count(*))*100 as "%Acknowledgement",
(cast(sum("Farewell") as real)/count(*))*100  as "%Farewell",
(cast(sum("Non-Verbal") as real)/count(*))*100 as "%Non-Verbal",
(cast(sum("No Response") as real)/count(*))*100 as "%No Response"
from responses
group by "Familiarity";

.output Analysis/familiarity.csv
select * from familiarity; 

create table distractedness as select "Distractedness",count(*) as "#Interviews", 
(cast(sum("No problem") as real)/count(*))*100 as "%No problem",
(cast(sum("You're Welcome") as real)/count(*))*100 as "%You're Welcome",
(cast(sum("Acknowledgement") as real)/count(*))*100 as "%Acknowledgement",
(cast(sum("Farewell") as real)/count(*))*100  as "%Farewell",
(cast(sum("Non-Verbal") as real)/count(*))*100 as "%Non-Verbal",
(cast(sum("No Response") as real)/count(*))*100 as "%No Response"
from responses
group by "Distractedness";      

.output Analysis/distractedness.csv 
select * from distractedness;
.exit
