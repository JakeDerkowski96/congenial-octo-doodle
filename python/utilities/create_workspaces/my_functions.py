import os
import sys
import time
import calendar
from datetime import date
import datetime

def program_exit(code_block):
    try:
        code_block
    except KeyboardInterrupt:
        sys.exit(0)

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def welcome_msg():
    welcome = "Welcome to the workspace creation wizard! This program creates a directory that makes a workspace encironment where files can be arranged by the time in which they were created. Separated by month, and week. \n\n Example: 'MAR\1_8'"

    print(welcome)

def write_to_file(content, out_file):
    with open(out_file, 'a') as f:
        print(content, file=f)




def get_user_answer():
    user_decision = input("\nConstruct here? (Y/n)\t")
    usr_decision = user_decision.lower()
    print(usr_decision)
    return usr_decision

def check_dir_exists(dir):
    exists = os.path.isdir(dir)
    if exists == False:
        os.mkdir(dir)

def get_year():
    today = date.today()
    year = today.strftime("%Y")
    # year_int = int(year)
    return year

def create_year_dir(year):
    check_dir_exists(year)
    os.chdir(year)
    print(os.getcwd())

def create_month_dir():
    i = 0
    for name in calendar.month_name:
        abbr = name[0:3]
        abbr = abbr.upper()
        print(abbr)

        num = str(i)
        if i < 10:
            ordered = "0" + num + '_'
        else:
            ordered = num + '_'

        mon_dir = ordered + abbr
        check_dir_exists(mon_dir)
        i=+1


def list_directory():
    curr = os.getcwd()
    os.listdir(curr)



# month = today.strftime("%m")
# day = today.strftime("%d")

# today_int = int(today)
# year_int = int(year)
# month_int = int(month)
# day_int = int(day)
