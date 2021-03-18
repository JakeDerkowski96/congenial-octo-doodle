import os
import sys
import calendar
import my_functions as func
import file_functions as ff

trimont = 'SOC Response Metrics '

rootdir = os.getcwd()
print(rootdir)

for subdir in os.walk(rootdir):
    for folder in subdir:
        week = str(subdir)
        name = trimont + week
        print(name)
        # print(folder)
    # print(subdir)
    # for dir in subdir:
    #     name_end = dir
    #     weekly_metrics = trimont_metrics + name_end
    #     print(weekly_metrics)
    #     print(dir)
