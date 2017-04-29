from __future__ import print_function

import sys
from operator import add
from pyspark import SparkContext
from csv import reader 
from datetime import datetime

if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print("Usage: Complaint_to_dt.py <file>", file=sys.stderr)
        exit(-1)

    def new_map(x):

        if x[3] == "":
            return(str(x[3]),"Date, " + "Complaint to date, " + "NULL")
        
        try:
            
            datetime.strptime(str(x[3]), "%m/%d/%Y")
            
            try:

                ts_to = datetime.strptime(x[3]+"/"+x[4],"%m/%d/%Y/%H:%M:%S")
                ts_for = datetime.strptime(x[1]+"/"+x[2],"%m/%d/%Y/%H:%M:%S")

                if ts_for > ts_to:
                
                    return(str(x[3]),"Date, " + "Complaint to date, " + "Invalid")
                
                else: 

                    return(str(x[3]),"Date, " + "Complaint to date, " + "Valid")
            
            except:
                   
                return(str(x[3]),"Date, " + "Complaint to date, " + "Valid")
 
        except:
            
            return(str(x[3]),"Date, " + "Complaint to date, " + "Invalid")


    sc = SparkContext()
    lines = sc.textFile(sys.argv[1], 1) 
    lines2 = lines.mapPartitions(lambda x: reader(x))
    
    lines_final = lines2.map(lambda x: new_map(x))
    final = lines_final.map(lambda x: '%s\t%s' % (x[0], x[1]))
    
    final.saveAsTextFile("Complaint_to_dt.out")

    sc.stop()
