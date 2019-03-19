#!/bin/bash

url=$*

if [ $url ]
then
	open -a "Google Chrome" $url
else
	open -a "Google Chrome" "http://google.com"
fi