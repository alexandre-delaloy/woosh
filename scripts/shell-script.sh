#!/bin/sh

FILENAME=$*

cd ~/../../usr/local/bin
touch $FILENAME
chmod a+rx $FILENAME
vim $FILENAME