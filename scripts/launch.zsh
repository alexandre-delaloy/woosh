#!/bin/zsh

D_BLUE="\e[38;5;21m"
L_BLUE="\e[38;5;45m"
J_PURPLE="\e[38;5;99m"
J_GREEN="\e[38;5;83m"
J_RED="\e[38;5;160m"

ORANGE="\e[38;5;166m"
YELLOW="\e[38;5;226m"
L_PURPLE="\e[38;5;225m"

ERROR="\e[38;5;196m"
VALID="\e[38;5;118m"


USER=$1

# PROCESS_STATUS () {
#     echo "
# $J_GREEN blyndusk
# $J_PURPLE  ╠══ $ERROR [$1]$J_PURPLE oShi
# $J_PURPLE  ╠══ $ERROR [$2]$J_PURPLE Apps
# $J_PURPLE  ╠══ $ERROR [$3]$J_PURPLE Chrome
# $J_PURPLE  ╚══ $ERROR [$4]$J_PURPLE Task List
# "
# }

OSHI () { cd ~/Dev/oShi && pm2 start . --watch && cd `pwd` ; }

CHROME () {

    if [ $USER = "me" ] ; then chr -a "blyndusk"
    else chr -a $USER ; fi
}

STEP () { sleep 1 ; $* ; sleep 1 ; clear ; }

clear

echo "
$J_PURPLE╔═════════════════╗
║$J_GREEN Hello, blyndusk $J_PURPLE║
╚═════════════════╝
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE oShi
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Apps
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Chrome
$J_PURPLE  ╚══ $ERROR [x]$J_PURPLE Task List
"

STEP OSHI

echo "
$J_PURPLE╔═════════════════╗
║$J_GREEN Hello, blyndusk $J_PURPLE║
╚═════════════════╝
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE oShi
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Apps
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Chrome
$J_PURPLE  ╚══ $ERROR [x]$J_PURPLE Task List
"

STEP apps

echo "
$J_PURPLE╔═════════════════╗
║$J_GREEN Hello, blyndusk $J_PURPLE║
╚═════════════════╝
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE oShi
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Apps
$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Chrome
$J_PURPLE  ╚══ $ERROR [x]$J_PURPLE Task List
"

STEP CHROME

echo "
$J_PURPLE╔═════════════════╗
║$J_GREEN Hello, blyndusk $J_PURPLE║
╚═════════════════╝
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE oShi
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Apps
$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Chrome
$J_PURPLE  ╚══ $ERROR [x]$J_PURPLE Task List
"