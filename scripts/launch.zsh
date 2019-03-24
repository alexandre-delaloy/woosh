#!/bin/zsh

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================

# COLORS
ORANGE="\e[38;5;166m"
YELLOW="\e[38;5;226m"
D_BLUE="\e[38;5;21m"
J_PURPLE="\e[38;5;99m"
J_GREEN="\e[38;5;83m"
J_RED="\e[38;5;160m"
L_BLUE="\e[38;5;45m"
L_PURPLE="\e[38;5;225m"
WHITE="\e[38;5;154m"

# STATUS COLOR
ERROR="\e[38;5;196m"
VALID="\e[38;5;47m"

# HOME MESSAGE
HELLO="$J_PURPLE╔═════════════════╗
║$WHITE Hello, blyndusk $J_PURPLE║
╚═════════════════╝"

# STATUS MESSAGES
OSHI_STATUS="$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE oShi"
APPS_STATUS="$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Apps"
CHR_STATUS="$J_PURPLE  ╠══ $ERROR [x]$J_PURPLE Chrome"
TASKS_STATUS="$J_PURPLE  ╚══ $ERROR [x]$J_PURPLE Task List"

# FIRST PARAM
USER=$1



# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================
PROCESS_STATUS () {
    echo "
$HELLO
$OSHI_STATUS
$APPS_STATUS
$CHR_STATUS
$TASKS_STATUS
"
}

UPDATE_STATUS () { sleep 1 ; $* ; sleep 1 ; clear ; }

OSHI () { cd ~/Dev/oShi && pm2 start . --watch && cd `pwd` ; }
APPS () { apps ; }
CHROME () {
    if [ $USER = "me" ] ; then chr -a "blyndusk"
    else chr -a $USER ; fi
}
NONE () { echo "non" }

clear

PROCESS_STATUS
UPDATE_STATUS NONE
OSHI_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE oShi"

PROCESS_STATUS
UPDATE_STATUS NONE
APPS_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Apps"

PROCESS_STATUS
UPDATE_STATUS NONE
CHR_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Chrome"

PROCESS_STATUS
UPDATE_STATUS NONE
TASKS_STATUS="$J_PURPLE  ╚══ $VALID [v]$J_PURPLE Tasks"
PROCESS_STATUS