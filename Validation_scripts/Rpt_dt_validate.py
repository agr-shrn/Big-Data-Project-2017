from __future__ import print_function

import sys
from operator import add
from pyspark import SparkContext
from csv import reader 
from datetime import datetime

if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print("Usage: Rpt_dt_validate.py <file>", file=sys.stderr)
        exit(-1)

    def new_map(x):

        if x[5] == "":
            return(str(x[5]),"Date, " + "Report date, " + "NULL")
        
        try:
            
            rep = datetime.strptime(str(x[5]), "%m/%d/%Y")
            
            if rep.year < 2006 or rep.year > 2016:
                
                return(str(x[5]),"Date, " + "Report date, " + "Invalid")
                
            else: 

                return(str(x[5]),"Date, " + "Report date, " + "Valid")
 
        except:
            
            return(str(x[5]),"Date, " + "Report date, " + "Invalid")


    sc = SparkContext()
    lines = sc.textFile(sys.argv[1], 1) 
    lines2 = lines.mapPartitions(lambda x: reader(x))
    
    lines_final = lines2.map(lambda x: new_map(x))
    final = lines_final.map(lambda x: '%s\t%s' % (x[0], x[1]))
    
    final.saveAsTextFile("Rpt_dt.out")

    sc.stop()
