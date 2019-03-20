#!/bin/sh

MESSAGE=$1

git add .
echo Enter your commit message:
read MESSAGE
git commit -m "$MESSAGE"
git push