#!/usr/local/bin/bash

FILENAME=$*

cd ~/../../usr/local/bin || exit
touch "$FILENAME"
chmod a+rx "$FILENAME"
vim "$FILENAME"