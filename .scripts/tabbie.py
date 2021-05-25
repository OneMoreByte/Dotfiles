#!/usr/bin/env python3

import json
import os
import sys
import collections
from subprocess import DEVNULL, STDOUT, check_call



def get_desktop_file(name):
    home =  os.getenv("HOME")
    desktop_paths = [
        home + "/.local/share/applications",
        home + "/.local/share/flatpak/exports/share/applications",
        "/usr/share/applications"]
    
    for path in desktop_paths:
        files = os.scandir(path)
        for f in files:
            if name in f.name:
                return f.path
    return None
    
    

def get_outputs():
    output_tree = os.popen("swaymsg -t get_tree").read()
    json_tree = json.loads(output_tree)
    outputs = []
    for displays in json_tree["nodes"]:
        if displays.get("name") not in "__i3_scratch":
            outputs += displays["nodes"]
    
    return outputs


# Traverse the tree to get all windows in root node
def get_name(leaf):
    titles = []

    wname = leaf.get("name")
    if wname is None:
        for branch in leaf.get("nodes"):
            temp = get_name(branch)
            for a in temp:
                titles.append(a)

    else:
        app = leaf.get("app_id") or ""
        wclass = leaf.get("window_properties", {"class": ""}).get("class") or ""
        titles.append(wclass + app + ":" + wname[:32])
    return titles


def main():
    args = sys.argv
    if len(args) is  1:
        outputs = get_outputs()
        titles = collections.defaultdict(list)
        for workspace in outputs:
            name = workspace["name"]
            windows = []
           
            for leaf in workspace["nodes"]:
                windows += get_name(leaf)
            titles[name] += (windows)

        for k, v in titles.items():
            temp = ""
            for windows in v:
                temp += windows + " "
            print("{}: {}".format(k, temp))
    else:
        workspace = args[1].split(':')[0]
        check_call(['swaymsg', 'workspace', workspace], stdout=DEVNULL, stderr=STDOUT)
        

if __name__ == "__main__":
    main()
