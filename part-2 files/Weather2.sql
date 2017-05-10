
create table rpt_temp
select RPT_DATE, Num_Crimes- avg, AVG_TMP from rpt_day_count, TEMPERATURE where RPT_DATE = W_Date;

create table N_rpt_temp
select RPT_DATE, (Num_Crimes- (SELECT AVG(Num_Crimes) from rpt_temp))/(SELECT STDDEV(Num_Crimes) from rpt_temp) as N_crimes, (AVG_TMP - (SELECT AVG(AVG_TMP) from rpt_temp))/(SELECT STDDEV(AVG_TMP)  from rpt_temp) as avg_temp from rpt_temp ;



select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select N_crimes as x, avg_temp as y 
	from  N_rpt_temp
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select N_crimes as x, avg_temp as y 
	from  N_rpt_temp
) a;


select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  frm_temp
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  frm_temp
) a;

drop table rpt_temp_monthly;
create table rpt_temp_monthly
select month(RPT_DATE), year(RPT_DATE), sum(Num_Crimes) as Num_Crimes, sum(AVG_TMP) as AVG_TMP from rpt_temp group by month(RPT_DATE), year(RPT_DATE);

select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  rpt_temp_monthly
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  rpt_temp_monthly
) a;
