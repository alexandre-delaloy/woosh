#!/bin/sh

MESSAGE=$1

git add . &&
git commit -m "$MESSAGE"
&& git push