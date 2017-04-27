# Big-Data-Project-2017
 Official Repository for Big Data Project

Open Putty.

Login using credentials.

Login to dumbo.

---------------------------------------

wget https://data.cityofnewyork.us/api/views/qgea-i56i/rows.csv?accessType=DOWNLOAD

mv downloaded_filename.csv NYPD.csv

hadoop fs -copyFromLocal NYPD.csv

----------------------------------------

#if metastore_db folder exists 

rm -r metastore_db

module load python/gnu/3.4.4 

export PYSPARK_PYTHON=/share/apps/python/3.4.4/bin/python 

export PYTHONHASHSEED=0 

export SPARK_YARN_USER_ENV=PYTHONHASHSEED=0

pyspark2


----------------------------------------

#run the commands in SPARK_SQL.txt

------------------------------------------

Type ctrl+d(exit pyspark)

#get all files from hadoop to working directory like this.
hadoop fs -getmerge Borough_wise_Count.csv Borough_wise_Count.csv
