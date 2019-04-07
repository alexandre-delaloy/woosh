#!/usr/local/bin/bash
# shellcheck disable=SC1090

. ~/.exports
. ~/.functions


# COLORS
J_PURPLE="\e[38;5;99m"
WHITE="\e[38;5;154m"

# STATUS COLOR
ERROR="\e[38;5;196m"
VALID="\e[38;5;47m"

# HOME MESSAGE
HELLO="$J_PURPLE\r╔═════════════════╗
║$WHITE Hello, blyndusk$J_PURPLE ║
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
    echo -e "
$HELLO
$OSHI_STATUS
$APPS_STATUS
$CHR_STATUS
$TASKS_STATUS
"
}

UPDATE_STATUS () { sleep 1 ; "$@" ; sleep 1 ; clear ; }

clear ; PROCESS_STATUS

UPDATE_STATUS oShi
OSHI_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE oShi"
PROCESS_STATUS

UPDATE_STATUS apps
APPS_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Apps"
PROCESS_STATUS

UPDATE_STATUS chr
CHR_STATUS="$J_PURPLE  ╠══ $VALID [v]$J_PURPLE Chrome"
PROCESS_STATUS

UPDATE_STATUS todo
TASKS_STATUS="$J_PURPLE  ╚══ $VALID [v]$J_PURPLE Tasks"
PROCESS_STATUS