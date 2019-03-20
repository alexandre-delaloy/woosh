#!/bin/sh

filename=$1

cd ~/../../usr/local/bin && touch $filename && chmod a+rx $filename && vim $filename