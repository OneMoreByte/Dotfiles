#!/bin/bash


grim -g "$(slurp)"  - | swappy -f - $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')
