#!/bin/zsh

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================


# absolute path
PATH="/usr/local/bin/"

# I - CREATE FILE PATH ==============================

# perso
TD_1_0="$PATH""td-perso-ls"
TD_1_1="$PATH""td-perso-st"

# II - IMPORT FILES =============================

. $TD_1_0
. $TD_1_1

# III - UPDATE VARIABLES ========================

PERSO_LIST=(${TODO_PERSO_LIST[*]})
PERSO_STATUS=(${TODO_PERSO_STATUS[*]})

# Status color
ERROR="\e[38;5;196m[x]"
VALID="\e[38;5;47m[v]"
PURPLE="\e[38;5;99m"
WHITE="\e[38;5;225m"

# texts
HOME="\n$PURPLE\e[1mHello blyndusk, here is you to-do list : \e[0m"
TMP="$WHITE"

# first param
PARAM=$1

# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================

DISPLAY_TODO () {
    # for every task
    for i in {1..${#PERSO_LIST[*]}} ; do 
        # if PERSO_STATUS[$i] is true, update $TMP with $VALID status
        if [ ${PERSO_STATUS[$i]} -eq "1" ] ; then TMP+=" - \e[1m$VALID\e[0m $WHITE${PERSO_LIST[$i]}\n" ; fi
        # else if PERSO_STATUS[$i] is FALSE, update $TMP with $ERROR status
        elif [ ${PERSO_STATUS[$i]} -eq "0" ] ; then TMP+=" - \e[1;5m$ERROR\e[0m $WHITE${PERSO_LIST[$i]}\n"
    done
    # echo $HOME message with $TMP
    echo "$HOME\n$TMP"
}

# if $PARAM exist
if [ $PARAM ] ; then 
    # if $PARAM is "-c" or "--check"
    if [[ $PARAM -eq "-c" || $PARAM -eq "--check" ]] ; then 
        # add a 2nd param, $INDEX
        INDEX=$2
        # if 0 < $INDEX < $PERSO_LIST length 
        if [[ $INDEX -le ${#PERSO_LIST[*]} && $INDEX -gt 0 ]] ; then 
            # update $PERSO_STATUS with new status
            PERSO_STATUS[$INDEX]=1
            # rewrite $TD_1_1 with new $PERSO_STATUS
            echo "#!/bin/zsh\n\nTODO_PERSO_STATUS=(${PERSO_STATUS[*]})" > $TD_1_1
            DISPLAY_TODO
        fi
    # if $PARAM is "-u" or "--uncheck"
    elif [[ $PARAM -eq "-u" || $PARAM -eq "--uncheck" ]] ; then 
        # same logic
        INDEX=$2
        if [[ $INDEX -le ${#PERSO_LIST[*]} && $INDEX -gt 0 ]] ; then 
            PERSO_STATUS[$INDEX]=0
            echo "#!/bin/zsh\n\nTODO_PERSO_STATUS=(${PERSO_STATUS[*]})" > $TD_1_1
            DISPLAY_TODO
        fi
    fi
# display the list
else DISPLAY_TODO ; fi