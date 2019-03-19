#!/bin/sh

filename=$*

cd ~/../../usr/local/bin && touch $filename && chmod a+rx $filename && vim $filename