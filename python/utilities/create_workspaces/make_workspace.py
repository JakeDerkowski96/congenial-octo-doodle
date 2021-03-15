''' create the files and templates all at once so time does not need to be wasted creating files and copying templates. '''

import os
import sys
import time
import calendar
from datetime import date
import datetime
import my_functions as func

# specifically for trimont
# filename_base = "SOC Response Metrics"
# workspace_name = input("Enter the name of the workspace you are creating:\t")

func.clear_screen()

func.welcome_msg()

time.sleep(1)

func.clear_screen()

print("Verify this is the directory where you want to build your yearly workspace.\n")

init_dir = os.getcwd()
print("Current directory:\t", init_dir)

while True:
    answer = func.get_user_answer()
    if answer == 'y':
        print("Building workspace file structure now.")
        workspace_dir = init_dir
        break
    elif answer == 'n':
        print("\nPlease navigate to desired directory and try again.\n")
        sys.exit(0)
    else:
        print("\nInvalid entry, please enter (Y/y) or (N/n)")


print('\n~~~~~~~~~~~~~~~~~\n'.format())
print("Building workspace in:\n", workspace_dir)

# print(workspace_dir)

# print current year
# print(func.year_int())
year = func.get_year()
year_int = int(year)

print(year)
print(type(year))
print(type(year_int))

func.create_year_dir(year)

calendar_output = "calendar_year.txt"
year_calendar = calendar.calendar(year_int)
func.write_to_file(year_calendar, calendar_output)

func.create_month_dir()
func.list_directory()
