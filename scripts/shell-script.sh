#!/bin/sh

file=$*

cd ~/../../usr/local/bin && touch $file && chmod a+rx $file && vim $file