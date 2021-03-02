''' create the files and templates all at once so time does not need to be wasted creating files and copying templates. '''

import os, sys
import calendar
# import datetime
from datetime import date, time, datetime

print("Ensure this is the directory in which you want to create the workspace for the year! \n exit now if unsure.")

today = datetime.today()

# conver to string
today_string = today
date.fromisoformat(today_string)
format_string = "%m-%d-%Y %H:%M:%S"
# https://realpython.com/python-datetime/#using-the-python-datetime-module


year =
filename_base = "SOC Response Metrics"

def make_month_dir():
