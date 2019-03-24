#!/bin/zsh

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================

# list of tasks
TASKS=(
    "buy coffee"
    "buy rings"
    "see Quentin"
    "see Chicha"
    "reduce Lucky consommation"
)

# status acorded to the task
STATUS=(
    0
    0
    1
    1
    0
)

# Status color
ERROR="\e[38;5;196m[x]"
VALID="\e[38;5;47m[v]"
J_PURPLE="\e[38;5;99m"

# texts
HOME="\n$J_PURPLE\e[1mHello blyndusk, here is you to-do list : \e[0m"
TMP="$J_PURPLE"

# first param
PARAM=$1

# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================

DISPLAY_TODO () {
    for i in {1..${#TASKS[*]}} ; do 
        if [ ${STATUS[$i]} = "0" ] ; then TMP+=" - \e[1;5m$ERROR\e[0m $J_PURPLE${TASKS[$i]}\n"
        elif [ ${STATUS[$i]} = "1" ] ; then TMP+=" - \e[1m$VALID\e[0m $J_PURPLE${TASKS[$i]}\n" ; fi
    done
    clear ; echo "$HOME\n$TMP"
}

# WIP
if [ $PARAM ] ; then 
    if [ $PARAM = "done" ] ; then 
        INDEX=$2
        if [[ $INDEX < ${#TASKS[*]} && $INDEX > 0 ]] ; then 
            STATUS[$INDEX]=1
            DISPLAY_TODO
        fi
    fi
else DISPLAY_TODO ; fi
