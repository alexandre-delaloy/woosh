#!/bin/sh

MESSAGE=$1

git add .
<<<<<<< HEAD 
echo Enter your commit message:
read MESSAGE
=======
>>>>>>> parent of 1e7953a... :wrench: update acp command
git commit -m "$MESSAGE"
git push