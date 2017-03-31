import csv
import sys
import os
import datetime

def validate(date_text, counter):
    try:
        datetime.datetime.strptime(date_text, '%H:%M:%S')
    except ValueError:
        print(date_text)
        counter+=1
    return counter

with open(sys.argv[1], newline='') as file:

    entry = csv.reader(file)
    file.seek(0)
    next(entry, None)
    
    count_crm = 0
    count_lvl = 0

    for row in entry:

        if row[10] != "":
                
                row[10].upper()
                
                if row[10] not in ['ATTEMPTED', 'COMPLETED']:
                    count_crm+=1

        if row[11] != "":

                row[11].upper()
                
                if row[11] not in ['FELONY', 'MISDEMEANOR', 'VIOLATION']:
                    count_lvl+=1

    print(count_crm, count_lvl)