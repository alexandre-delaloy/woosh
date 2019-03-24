#!/bin/zsh

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================

# list of tasks
. td-perso-ls
. td-perso-st

PERSO_LIST=(${TODO_PERSO_LIST[*]})
PERSO_STATUS=(${TODO_PERSO_STATUS[*]})


# Status color
ERROR="\e[38;5;196m[x]"
VALID="\e[38;5;47m[v]"
J_PURPLE="\e[38;5;99m"
WHITE="\e[38;5;225m"

# texts
HOME="\n$J_PURPLE\e[1mHello blyndusk, here is you to-do list : \e[0m"
TMP="$J_PURPLE"

# first param
PARAM=$1

# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================

DISPLAY_TODO () {
    for i in {1..${#PERSO_LIST[*]}} ; do 
        if [ ${PERSO_STATUS[$i]} -eq "0" ] ; then TMP+=" - \e[1;5m$ERROR\e[0m $WHITE${PERSO_LIST[$i]}\n"
        elif [ ${PERSO_STATUS[$i]} -eq "1" ] ; then TMP+=" - \e[1m$VALID\e[0m $WHITE${PERSO_LIST[$i]}\n" ; fi
    done
    echo "$HOME\n$TMP"
}

# WIP
if [ $PARAM ] ; then 
    if [ $PARAM = "v" ] ; then 
        INDEX=$2
        if [[ $INDEX -le ${#PERSO_LIST[*]} && $INDEX -gt 0 ]] ; then 
            PERSO_STATUS[$INDEX]=1
            echo "${PERSO_STATUS[*]}"
            echo "#!/bin/zsh\n\nTODO_PERSO_STATUS=(${PERSO_STATUS[*]})" > td-perso-st
            DISPLAY_TODO
        fi
    elif [ $PARAM = "x" ] ; then 
        INDEX=$2
        if [[ $INDEX -le ${#PERSO_LIST[*]} && $INDEX -gt 0 ]] ; then 
            PERSO_STATUS[$INDEX]=0
            echo "#!/bin/zsh\n\nTODO_PERSO_STATUS=(${PERSO_STATUS[*]})" > . td-perso-st
            DISPLAY_TODO
        fi
    fi
else DISPLAY_TODO ; fi
