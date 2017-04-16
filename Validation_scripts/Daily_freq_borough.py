import csv
import sys
import os
import datetime


with open(sys.argv[1], newline='') as file:

    entry = csv.reader(file)
    file.seek(0)
    next(entry, None)
    
    daily = dict()

    for row in entry:

        if row[5] not in daily.keys():
            daily[row[5]] = dict()

        if row[13] not in daily[row[5]].keys():
            daily[row[5]][row[13]] = 0

        daily[row[5]][row[13]] += 1                
           

    print(count_crm, count_lvl)