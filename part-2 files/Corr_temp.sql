#SELECT * from Weather;

create table WINDY_DATES 
SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') as High_Wind, AVG_WND from Weather where AVG_WND > 5 ;



create table TEMPERATURE
SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') as W_Date, (TMAX + TMIN)/2.0 AS AVG_TMP, TMAX, TMIN from Weather;



create table from_day_count 
SELECT STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y') as FR_DATE, count(*) as Num_Crimes from MyData where CMPLNT_FR_DT <> '' and (STR_TO_DATE(MyData.CMPLNT_FR_DT, '%m/%d/%Y') >= '2005-01-01') and (STR_TO_DATE(MyData.CMPLNT_FR_DT, '%m/%d/%Y') < '2017-01-01') group by FR_DATE;

select * from from_day_count order by FR_DATE;

create table rpt_day_count 
SELECT STR_TO_DATE(RPT_DT, '%m/%d/%Y') as RPT_DATE, count(*) as Num_Crimes from MyData where RPT_DT <> '' and (STR_TO_DATE(MyData.RPT_DT, '%m/%d/%Y') >= '2005-01-01') group by RPT_DATE;

create table frm_temp
select FR_DATE, Num_Crimes, AVG_TMP from from_day_count, TEMPERATURE where FR_DATE = W_Date;


create table rpt_temp
select RPT_DATE, Num_Crimes, AVG_TMP from rpt_day_count, TEMPERATURE where RPT_DATE = W_Date;


select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  rpt_temp
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, AVG_TMP as y 
	from  rpt_temp
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


drop table precipitate;

create table precipitate 
SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') as W_Date, COALESCE(SNOW, 0) AS SnowFall, COALESCE(PRCP, 0) AS Rainfall, COALESCE(SNWD, 0) AS SnowDepth FROM Weather;

create table rpt_prec
select RPT_DATE, Num_Crimes, SnowFall, Rainfall, SnowDepth from rpt_day_count, precipitate where RPT_DATE = W_Date order by RPT_DATE;

drop table rpt_monthly;
create table rpt_monthly
select month(RPT_DATE), year(RPT_DATE), sum(Num_Crimes) as Num_Crimes, sum(SnowFall) as SnowFall, sum(Rainfall) as Rainfall, sum(SnowDepth) as SnowDepth from rpt_prec group by month(RPT_DATE), year(RPT_DATE);

select @ax := avg(x), 
       @ay := avg(y), 
       @div := (stddev_samp(x) * stddev_samp(y))
from 
(
	select Num_Crimes as x, Rainfall + SnowDepth + SnowFall as y 
	from  rpt_monthly
) a;


select sum( ( x - @ax ) * (y - @ay) ) / ((count(x) -1) * @div) 
from 
(
	select Num_Crimes as x, Rainfall + SnowDepth + SnowFall as y 
	from  rpt_monthly
) a;

drop table fog_table;
CREATE TABLE fog_table SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') AS W_Date,
    COALESCE(FOG_IC_FF, 0) AS FOG_IC,
    COALESCE(HF_HFFOG, 0) AS HEAVY_FOG,
    COALESCE(IF_FFOG, 0) AS IceFog FROM
    Weather;


create table fog 
select W_Date, (FOG_IC or HEAVY_FOG or IceFog) as Fog from fog_table;

create table rpt_fog
select RPT_DATE, Num_Crimes, Fog from rpt_day_count, fog where RPT_DATE = W_Date order by RPT_DATE;

select avg(Num_Crimes), Fog from rpt_fog group by Fog;


CREATE TABLE fog_table SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') AS W_Date,
    COALESCE(FOG_IC_FF, 0) AS FOG_IC,
    COALESCE(HF_HFFOG, 0) AS HEAVY_FOG,
    COALESCE(IF_FFOG, 0) AS IceFog FROM
    Weather;


create table fog 
select W_Date, (FOG_IC or HEAVY_FOG or IceFog) as Fog from fog_table;

create table rpt_fog
select RPT_DATE, Num_Crimes, Fog from rpt_day_count, fog where RPT_DATE = W_Date order by RPT_DATE;

select avg(Num_Crimes), Fog from rpt_fog group by Fog;

create table rpt_hfog
select RPT_DATE, Num_Crimes, (HEAVY_FOG>0 ) as Fog from rpt_day_count, fog_table where RPT_DATE = W_Date order by RPT_DATE;

select avg(Num_Crimes), Fog from rpt_hfog group by Fog;

drop table rain_table;

CREATE TABLE rain_table SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') AS W_Date,
    COALESCE(DRIZZLE, 0) AS DRIZZLE,
    COALESCE(RAIN, 0) AS RAIN,
    COALESCE(MIST, 0) AS MIST FROM
    Weather;

select * from rain_table;

create table rains 
select W_Date, (DRIZZLE or RAIN or MIST) as rain from rain_table;

create table rpt_rain
select RPT_DATE, Num_Crimes, rain from rpt_day_count, rains where RPT_DATE = W_Date order by RPT_DATE;

select avg(Num_Crimes), rain from rpt_rain group by rain;

drop table rpt_rain_only;

create table rpt_driz_only
select RPT_DATE, Num_Crimes, (DRIZZLE>0) as rain from rpt_day_count, rain_table where RPT_DATE = W_Date order by RPT_DATE;

select * from rpt_rain_only;

select avg(Num_Crimes), rain from rpt_rain_only group by rain;


CREATE TABLE hail_table SELECT STR_TO_DATE(W_DATE, '%d/%m/%Y') AS W_Date,
    COALESCE(HAIL, 0) AS hails,
    COALESCE(I_S_PELLETS, 0) AS pellets,
    COALESCE(SNOW_IC, 0) AS icSnow FROM
    Weather;

create table hails 
select W_Date, (hails or pellets or icSnow) as hail from hail_table;

create table rpt_ICsnow
select RPT_DATE, Num_Crimes, (icSnow > 0) as hail from rpt_day_count, hail_table where RPT_DATE = W_Date order by RPT_DATE;


select avg(Num_Crimes), hail from rpt_ICsnow group by hail;

#select count(*), year(STR_TO_DATE(MyData.RPT_DT, '%m/%d/%Y')) as MonthOfYear from MyData group by MonthOfYear

select count(*)/10 as MonthlyAverage, month(STR_TO_DATE(MyData.RPT_DT, '%m/%d/%Y')) as MonthOfYear from MyData group by MonthOfYear;

select sum(Num_Crimes)/count(*) as Average_crimes, round(AVG_TMP) as TEMP from rpt_temp group by TEMP;

select sum(Num_Crimes)/count(*) as Average_crimes, round(SnowFall+ Rainfall) as depth from rpt_prec group by depth;

