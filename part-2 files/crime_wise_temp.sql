create table C361_rpt_day_count 
SELECT RPT_DATE, count(*) as Num_Crimes from inter_C_rpt where KY_CD = 361 group by RPT_DATE, KY_CD; 

create table C361_rpt_temp
select RPT_DATE, Num_Crimes, AVG_TMP from C361_rpt_day_count, TEMPERATURE where RPT_DATE = W_Date;


select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  C361_rpt_temp
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  C361_rpt_temp
) a;


create table C361_rpt_temp_monthly
select month(RPT_DATE), year(RPT_DATE), sum(Num_Crimes) as Num_Crimes, sum(AVG_TMP) as AVG_TMP 
from C361_rpt_temp group by month(RPT_DATE), year(RPT_DATE);

select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  C361_rpt_temp_monthly
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  C361_rpt_temp_monthly
) a;
