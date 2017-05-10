
create table C235_rpt_prec
select RPT_DATE, Num_Crimes, SnowFall, Rainfall, SnowDepth from C235_rpt_day_count, precipitate where RPT_DATE = W_Date order by RPT_DATE;

create table C235_rpt_monthly
select month(RPT_DATE), year(RPT_DATE), sum(Num_Crimes) as Num_Crimes, sum(SnowFall) as SnowFall, sum(Rainfall) as Rainfall, sum(SnowDepth) as SnowDepth 
from C235_rpt_prec group by month(RPT_DATE), year(RPT_DATE);

select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, Rainfall + SnowDepth + SnowFall as y 
	from  C235_rpt_monthly
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, Rainfall + SnowDepth + SnowFall as y 
	from  C235_rpt_monthly
) a;