#!/usr/local/bin/bash

MESSAGE=$1

git add .
echo Enter your commit message:
read -r MESSAGE
git commit -m "$MESSAGE"
git push