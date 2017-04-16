from __future__ import print_function

import sys
from operator import add
from pyspark import SparkContext
from csv import reader 

if __name__ == "__main__":
    
    if len(sys.argv) != 2:
        print("Usage: Lat_validate.py <file>", file=sys.stderr)
        exit(-1)

    def remove_header(itr_index, itr):
        return iter(list(itr)[1:]) if itr_index == 0 else itr 

    def new_map(x):

        if x[21] == "":
            return(str(x[21]),"Float, " + "Latitude, " + "NULL")
        
        try:
            value = float(x[21])
            return(str(x[21]),"Float, " + "Latitude," + "Valid")
        except ValueError:
            return(str(x[21]),"Float, " + "Latitude, " + "Invalid")


    sc = SparkContext()
    lines = sc.textFile(sys.argv[1], 1) 
    lines = lines.mapPartitionsWithIndex(remove_header)
    lines2 = lines.mapPartitions(lambda x: reader(x))
    
    lines_final = lines2.map(lambda x: new_map(x))
    final = lines_final.map(lambda x: '%s\t%s' (x[0], x[1]))
    
    counts.saveAsTextFile("Latitude.out")

    sc.stop()
