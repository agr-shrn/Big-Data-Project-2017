import csv
import sys
import os
import pickle

with open(sys.argv[1], newline='') as file:

    entry = csv.reader(file)
    nulls = dict()
    col_to_ind = dict()

    for row in entry:

        for i in range(len(row)):

            col_to_ind[i] = row[i]
            nulls[col_to_ind[i]] = 0

        break

    file.seek(0)
    next(entry, None)
    
    count = 0
    for row in entry:

        for i in range(len(row)):

            if row[i] == "":

                nulls[col_to_ind[i]]+=1
    

    with open('nulls.pickle', 'wb') as handle:
        pickle.dump(nulls, handle, protocol=pickle.HIGHEST_PROTOCOL)
        
