



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

select count(*) as total, KY_CD  from MyData where PREM_TYP_DESC = 'TRANSIT - NYC SUBWAY' group by KY_CD order by total desc;


select KY_CD from MyData where OFNS_DESC = 'KIDNAPPING AND RELATED OFFENSES';

Select count(*) as total, RPT_DT  from MyData where (STR_TO_DATE(MyData.RPT_DT, '%m/%d/%Y') > '2006-01-01') group by RPT_DT order by total desc;

select count(*) as total, KY_CD from MyData where PREM_TYP_DESC like 'parks/%' group by KY_CD order by total desc;
select count(*) as total from MyData where PREM_TYP_DESC like 'parks/%';

select count(*), STR_TO_DATE(RPT_DT, '%m/%d/%Y') as mydate from MyData where STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y')  > '2005-01-01' group by mydate order by mydate; 

select count(*) as total, LAW_CAT_CD  from MyData group by LAW_CAT_CD order by total desc; 


select count(*) as total, KY_CD from MyData where LAW_CAT_CD like 'MIS%' group by KY_CD order by total desc; 

select count(*) as total, ADDR_PCT_CD from MyData where BORO_NM = 'BRONX' group by ADDR_PCT_CD order by ADDR_PCT_CD;

select * from MyData where BORO_NM like 'BRON%' and ADDR_PCT_CD = '114'; 

select count(*) as total, KY_CD from MyData where PARKS_NM like 'WASHINGTON SQ%' group by KY_CD order by total desc; 

select count(*) as total, OFNS_DESC from MyData where KY_CD = 360 group by OFNS_DESC order by total desc; 


SELECT COUNT(DISTINCT OFNS_DESC), KY_CD FROM MyData where OFNS_DESC NOT LIKE '' GROUP BY KY_CD;
SELECT DISTINCT OFNS_DESC, KY_CD FROM MyData where KY_CD =677 AND OFNS_DESC NOT LIKE '';
select COUNT(*), OFNS_DESC from MyData WHERE KY_CD = 124 GROUP BY OFNS_DESC;

SELECT COUNT(*) FROM MyData where STR_TO_DATE(RPT_DT, '%m/%d/%Y') < STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y') OR STR_TO_DATE(RPT_DT, '%m/%d/%Y') < STR_TO_DATE(CMPLNT_TO_DT, '%m/%d/%Y') OR STR_TO_DATE(CMPLNT_TO_DT, '%m/%d/%Y') < STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y');
SELECT * FROM MyData where STR_TO_DATE(CMPLNT_TO_DT, '%m/%d/%Y') = STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y') AND CMPLNT_FR_TM > CMPLNT_TO_TM;


SELECT COUNT(DISTINCT PD_CD), PD_DESC FROM MyData WHERE PD_CD not like '' and PD_DESC not like ''group BY PD_DESC;



