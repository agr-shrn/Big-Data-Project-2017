create table C106_rpt_fog
select RPT_DATE, Num_Crimes, Fog as All_Fog from C106_rpt_day_count, fog where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), All_Fog from C106_rpt_fog group by All_Fog;

create table C106_rpt_hfog
select RPT_DATE, Num_Crimes, (HEAVY_FOG>0 ) as HeavyFog from C106_rpt_day_count, fog_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), HeavyFog from C106_rpt_hfog group by HeavyFog;

create table C106_rpt_fogic
select RPT_DATE, Num_Crimes, (FOG_IC>0 ) as FOG_IC from C106_rpt_day_count, fog_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), FOG_IC from C106_rpt_fogic group by FOG_IC;


create table C106_rpt_IceFog
select RPT_DATE, Num_Crimes, (IceFog>0 ) as IceFog from C106_rpt_day_count, fog_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), IceFog from C106_rpt_IceFog group by IceFog;


create table C106_rpt_rain
select RPT_DATE, Num_Crimes, rain as All_rain from C106_rpt_day_count, rains where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), All_rain from C106_rpt_rain group by All_rain;

create table C106_rpt_driz_only
select RPT_DATE, Num_Crimes, (DRIZZLE>0) as drizzle from C106_rpt_day_count, rain_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), drizzle from C106_rpt_driz_only group by drizzle;

create table C106_rpt_rain_only
select RPT_DATE, Num_Crimes, (RAIN>0) as rain from C106_rpt_day_count, rain_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), rain from C106_rpt_rain_only group by rain;

create table C106_rpt_mist_only
select RPT_DATE, Num_Crimes, (MIST>0) as mist from C106_rpt_day_count, rain_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), mist from C106_rpt_mist_only group by mist;


create table C106_rpt_allhail
select RPT_DATE, Num_Crimes, hail as All_hail from C106_rpt_day_count, hails where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), All_hail from C106_rpt_allhail group by All_hail;

create table C106_rpt_hails
select RPT_DATE, Num_Crimes, (hails > 0) as hails from C106_rpt_day_count, hail_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), hails from C106_rpt_hails group by hails;

create table C106_rpt_pellets
select RPT_DATE, Num_Crimes, (pellets > 0) as pellets from C106_rpt_day_count, hail_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), pellets from C106_rpt_pellets group by pellets;


create table C106_rpt_ICsnow
select RPT_DATE, Num_Crimes, (icSnow > 0) as icSnow from C106_rpt_day_count, hail_table where RPT_DATE = W_Date order by RPT_DATE;
select avg(Num_Crimes), icSnow from C106_rpt_ICsnow group by icSnow;
