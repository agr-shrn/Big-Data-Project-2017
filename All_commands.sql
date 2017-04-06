



#Done for all years from 2006 to 2015
#Select Count(*) as total, KY_CD from MyData where CMPLNT_FR_DT like '%2007' group by KY_CD order by total DESC;

#Run for min and max, lat and long
#select min(Longitude) from MyData where Longitude <> '';-73.700315857;
select max(Longitude) from MyData;
Select Latitude, Longitude from MyData where Longitude = -74.255075543;


create table FRM_RPTDT  
select datediff(STR_TO_DATE(MyData.RPT_DT, '%m/%d/%Y'), STR_TO_DATE(MyData.CMPLNT_FR_DT, '%m/%d/%Y')) as Duration, MyData.OFNS_DESC, CMPLNT_FR_DT, RPT_DT from MyData where CMPLNT_FR_DT <> '' and (STR_TO_DATE(MyData.CMPLNT_FR_DT, '%m/%d/%Y') > '2004-01-01');

create table temp
select OFNS_DESC, CMPLNT_TO_DT, CMPLNT_FR_DT from MyData where CMPLNT_FR_DT <> '' and CMPLNT_TO_DT <> '' and (STR_TO_DATE(MyData.CMPLNT_FR_DT, '%m/%d/%Y') > '2004-01-01') and (STR_TO_DATE(MyData.CMPLNT_TO_DT, '%m/%d/%Y') > '2004-01-01');


create table FRM_TODT
select datediff(STR_TO_DATE(CMPLNT_TO_DT, '%m/%d/%Y'), STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y')) as Duration, OFNS_DESC, CMPLNT_TO_DT, CMPLNT_FR_DT from temp order by Duration DESC ;


select avg(Duration) as AVG_DUR, OFNS_DESC from FRM_RPTDT group by OFNS_DESC order by AVG_DUR desc;

drop table FRM_TODT;

select count(OFNS_DESC), avg(Duration) as AVG_DUR, OFNS_DESC from FRM_RPTDT group by OFNS_DESC order by AVG_DUR desc;

select avg(Duration) as AVG_DUR, OFNS_DESC from FRM_TODT group by OFNS_DESC order by AVG_DUR desc;

select count(OFNS_DESC), avg(Duration) as AVG_DUR, OFNS_DESC from FRM_TODT group by OFNS_DESC order by AVG_DUR desc;


select CMPLNT_FR_DT, CMPLNT_TO_DT, RPT_DT from MyData where OFNS_DESC like '%KI%';


select KY_CD from MyData where OFNS_DESC = 'KIDNAPPING AND RELATED OFFENSES';


