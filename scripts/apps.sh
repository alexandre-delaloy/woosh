#!/usr/local/bin/bash

APPS_LIST=(
    "Discord"
    "Dashlane"
    "Activity Monitor"
)

for i in "${APPS_LIST[@]}" ; do open -a "$i" ; done