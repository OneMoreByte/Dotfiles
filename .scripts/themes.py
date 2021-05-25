#!/usr/bin/env python3

import os
import sys
import collections
from subprocess import DEVNULL, STDOUT, check_call

theme_loc="/home/jsck/Code/personal/wallpaper-with-theme/"

def main():
    args = sys.argv
    if len(args) is 1:
        files = os.listdir(theme_loc + "themes")
        files.sort()
        for f in files:
            print(f)
    else:
        os.chdir(theme_loc)
        theme = args[1]
        check_call([theme_loc + 'deploy.sh', theme], stdout=DEVNULL, stderr=STDOUT)
        

if __name__ == "__main__":
    main()
