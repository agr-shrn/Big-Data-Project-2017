#Select Count(*) as total from MyData where CMPLNT_FR_DT like '%2015' and RPT_DT not like '%2015';
#Select Count(*) as total, KY_CD from MyData where CMPLNT_FR_DT like '%2013' and RPT_DT not like '%2013' group by KY_CD order by total DESC;
#select count(*) as total from MyData where PREM_TYP_DESC like 'PARKING %';# group by KY_CD order by total desc;
#select count(*) as total, KY_CD from MyData where PREM_TYP_DESC like 'PARKING %' group by KY_CD order by total desc;
#select count(*) as total, PREM_TYP_DESC from MyData where KY_CD like '110' group by PREM_TYP_DESC order by total desc;
#use NYPD;
#SELECT @@global.secure_file_priv;
#select count(*) as total, KY_CD from MyData where PARKS_NM like '%TON SQUARE PARK' group by KY_CD order by total desc; 
#SHOW VARIABLES LIKE "secure_file_priv";
#select count(*) as total, OFNS_DESC from MyData where KY_CD = 360 group by OFNS_DESC order by total desc; 
#SELECT order_id,product_name,qty FROM orders WHERE foo = 'bar' INTO OUTFILE 'letstestthisout.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
#select STR_TO_DATE(CMPLNT_TO_DT, '%m/%d/%Y'), STR_TO_DATE(CMPLNT_FR_DT, '%m/%d/%Y')) as Duration, OFNS_DESC, CMPLNT_TO_DT, CMPLNT_FR_DT from temp order by Duration DESC ;
#SELECT DISTINCT OFNS_DESC, KY_CD FROM MyData where KY_CD =677 AND OFNS_DESC NOT LIKE '';

SELECT DISTINCT PD_DESC from MyData where PD_DESC like '%AND%';# where KY_CD not like '' and ofns_desc like '';
#SELECT COUNT(DISTINCT PD_CD), PD_DESC FROM MyData WHERE PD_CD not like '' and PD_DESC not like ''group BY PD_DESC;

#SELECT COUNT(DISTINCT OFNS_DESC), KY_CD FROM MyData where OFNS_DESC NOT LIKE '' BY KY_CD;