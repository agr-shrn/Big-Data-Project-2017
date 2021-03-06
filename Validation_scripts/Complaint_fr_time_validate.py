from __future__ import print_function

import sys
from operator import add
from pyspark import SparkContext
from csv import reader 
from datetime import datetime

if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print("Usage: Complaint_fr_time.py <file>", file=sys.stderr)
        exit(-1)

    def new_map(x):

        if x[2] == "":
            return(str(x[2]),"Time, " + "Complaint for time, " + "NULL")
        
        try:
            
            datetime.strptime(str(x[2]), "%H:%M:%S")
            
            try:

                ts_to = datetime.strptime(str([3])+"/"+str(x[4]),"%m/%d/%Y/%H:%M:%S")
                ts_for = datetime.strptime(str(x[1])+"/"+str(x[2]),"%m/%d/%Y/%H:%M:%S")

                if ts_for > ts_to:
                
                    return(str(x[2]),"Time, " + "Complaint for time, " + "Invalid")
                
                else: 

                    return(str(x[2]),"Time, " + "Complaint for time, " + "Valid")
            
            except:
                   
                return(str(x[2]),"Time, " + "Complaint for time, " + "Valid")
 
        except:
            
            return(str(x[2]),"Time, " + "Complaint for time, " + "Invalid")


    sc = SparkContext()
    lines = sc.textFile(sys.argv[1], 1) 
    lines2 = lines.mapPartitions(lambda x: reader(x))
    
    lines_final = lines2.map(lambda x: new_map(x))
    final = lines_final.map(lambda x: '%s\t%s' % (x[0], x[1]))
    
    final.saveAsTextFile("Complaint_fr_time.out")

    sc.stop()
