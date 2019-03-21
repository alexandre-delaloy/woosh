#!/bin/sh

clear

echo "
╔═════════════════╗
║ Hello, blyndusk ║
╚═════════════════╝

Starting your daily tasks right now !"

echo "
╔══════════╗
║ oShi [x] ║
╚══════════╝
"

cd ~/Dev/oShi && pm2 start . --watch && cd `pwd`

echo "
╔══════════╗
║ oShi [v] ║
╚══════════╝
"

echo "
╔════════════╗
║ Chrome [x] ║
╚════════════╝
"

USER=$1

if [ $USER = "me" ]
then
    chr -a "blyndusk"
else 
    chr -a $USER
fi

echo "
╔════════════╗
║ Chrome [v] ║
╚════════════╝
"

echo "Finished !"
