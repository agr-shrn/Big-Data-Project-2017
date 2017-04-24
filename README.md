# Big-Data-Project-2017
 Official Repository for Big Data Project

Open Putty.

Login using credentials.

Login to dumbo.

--one time
wget https://data.cityofnewyork.us/api/views/qgea-i56i/rows.csv?accessType=DOWNLOAD

mv downloaded_filename.csv NYPD.csv

hadoop fs -copyFromLocal NYPD.csv

--

#if metastore_db folder exists
rm -r metastore_db

module load python/gnu/3.4.4
export PYSPARK_PYTHON=/share/apps/python/3.4.4/bin/python
export PYTHONHASHSEED=0
export SPARK_YARN_USER_ENV=PYTHONHASHSEED=0

pyspark2

import csv
csvfile = sc.textFile('NYPD.csv')
data = csvfile.mapPartitions(lambda x: csv.reader(x))

-----------
schema_sd = spark.createDataFrame(data, ('CMPLNT_NUM'  ,'CMPLNT_FR_DT' 	,'CMPLNT_FR_TM' ,'CMPLNT_TO_DT' ,'CMPLNT_TO_TM' ,'RPT_DT' 		,'KY_CD' ,'OFNS_DESC' ,'PD_CD' 	,'PD_DESC' ,'CRM_ATPT_CPTD_CD' 	,'LAW_CAT_CD' ,'JURIS_DESC' ,'BORO_NM' ,'ADDR_PCT_CD' 	,'LOC_OF_OCCUR_DESC' ,'PREM_TYP_DESC' ,'PARKS_NM'  ,'HADEVELOPT' ,'X_COORD_CD' 	,'Y_COORD_CD' ,'Latitude' ,'Longitude' 	,'Lat_Lon' ))

schema_sd.createOrReplaceTempView("nypd_complaints")
-----------

-------

df =spark.sql("select BORO_NM,count(1) count from nypd_complaints where BORO_NM<>'' group by BORO_NM")
df.write.csv('Borough_wise_Count.csv')

-------

Type ctrl+d(exit pyspark)

hadoop fs -getmerge Borough_wise_Count.csv Borough_wise_Count.csv 
