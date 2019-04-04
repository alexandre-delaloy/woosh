#!/usr/local/bin/bash

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================

. $HOME/.exports



# https://youtube.com/$VID/video_id
VID="watch?v="
# https://youtube.com/$LIST/playlist_id
MUSIC="playlist?list="
# me
MAC_USER="blyndusk"

# First parameter, given tabs
TABS=$1

# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================

# will open new tabs in chrome with given arguments
CHR () { open -a "Google Chrome" $@ ; }

# error message when the param doesn't exist
WRONG_PARAM () { echo -e "\e[1;5;38;5;160m\"$*\" \e[0mparameter doesn't exist !" ; }

# update $MUSICVIDS_URLS array with new value; 
# $1 is the $MUSICVIDS_URLS index,
# $2 is the $PLAYLISTS index,
# $3 is the type ($MUSIC or $VID)
UPD_MV_ARR () { MUSICVIDS_URLS[$1]="${MUSICVIDS_URLS[$1]}$3${PLAYLISTS[$2]}" ; } 

# update the $DEV_URLS if $USER param exist
UPDATE_DEV () {
    UPD_DEV_ARR () { 
        TEMPO_DEV[0]="${TEMPO_DEV[0]}$1" ; 
        TEMPO_DEV[1]="${TEMPO_DEV[1]}$1" ; 
    }
    if [ "$USER" ] ; then 
        TEMPO_DEV=("${DEV_URLS[@]}")
        # if $USER is me, update $DEV_URLS with $MAC_USER
        if [ "$USER" = "me" ] ; then UPD_DEV_ARR $MAC_USER
        else UPD_DEV_ARR "$USER" ; fi
        CHR "${TEMPO_DEV[*]}"
    else CHR "${DEV_URLS[*]}" ; fi
}

# update the $MUSICVIDS_URLS if $PLAYLIST_TYPE param exist
UPDATE_MUSICVIDS () {
    if [ "$PLAYLIST_TYPE" ] ; then 
        # if $PLAYLIST_TYPE is "xx" update the 1st element of $MUSICVIDS_URLS with the 1st element of $PLAYLISTS, $MUSIC type
        if [ "$PLAYLIST_TYPE" = "xx" ] ; then UPD_MV_ARR 1 1 "$MUSIC"
        elif [ "$PLAYLIST_TYPE" = "sleep" ] ; then UPD_MV_ARR 1 2 "$MUSIC"
        elif [ "$PLAYLIST_TYPE" = "dope" ] ; then UPD_MV_ARR 1 3 "$MUSIC"
        elif [ "$PLAYLIST_TYPE" = "lofi" ] ; then
            # if $LOFI is "-r" update the 2nd element of $MUSICVIDS_URLS with the 4th element of $PLAYLISTS, $VID type
            if [[ $LOFI = "-r" || $LOFI = "--relax" ]] ; then UPD_MV_ARR 2 4 "$VID"
            elif [[ $LOFI = "-s" || $LOFI = "--sleep" ]] ; then UPD_MV_ARR 2 5 "$VID"
            # else, display error message with $LOFI param given
            else WRONG_PARAM "$LOFI" ; fi
            # same logic
        else WRONG_PARAM "$PLAYLIST_TYPE" ; fi
    fi
}

# ===============================================
# ------------------ EXECUTION ------------------
# ===============================================

# if "$TABS" exist
if [ "$TABS" ] ; then
    # if param is "-m" or "--mail", open chrome with all $MAIL_URLS, same logic for the 2 next cases
    if [[ "$TABS" = "-m" || "$TABS" = "--mail" ]] ; then CHR "${MAIL_URLS[*]}"
    elif [[ "$TABS" = "-s" || "$TABS" = "--social" ]] ; then CHR "${SOCIAL_URLS[*]}"
    # else if the param is -k or --kill, kill the chrome process
    elif [[ "$TABS" = "-k" || "$TABS" = "--kill" ]] ; then killall "Google Chrome"
    # else if "$TABS" is "-d" or "--dev"
    elif [[ "$TABS" = "-d" || "$TABS" = "--dev" ]] ; then
        # create $USER 2nd param
        USER=$2
        # update $DEV_URLS
        UPDATE_DEV
        # open chrome with all $DEV_URLS
    elif [[ "$TABS" = "-mv" || "$TABS" = "--musicvids" ]] ; then
        # create $PLAYLIST_TYPE 2nd param & $LOFI 3rd param
        PLAYLIST_TYPE=$2
        LOFI=$3
        # update $MUSICVIDS_URLS
        UPDATE_MUSICVIDS
        # open chrome with all $MUSICVIDS_URLS
        CHR "${MUSICVIDS_URLS[*]}"
    elif [[ "$TABS" = "-w" || "$TABS" = "--work" ]] ; then 
        # same logic
        USER=$2
        UPDATE_DEV
        # but open chrome with all $MAIL_URLS & all $DEV_URLS
        CHR "${MAIL_URLS[*]}" "${DEV_URLS[*]}"
    elif [[ "$TABS" = "-c" || "$TABS" = "--chill" ]] ; then 
        # same logic
        PLAYLIST_TYPE=$2
        LOFI=$3
        UPDATE_MUSICVIDS
        # but open chrome with all $SOCIAL_URLS & all $MUSICVIDS_URLS
        CHR "${SOCIAL_URLS[*]}" "${MUSICVIDS_URLS[*]}"
    # else if the param is -a or --all
    elif [[ "$TABS" = "-a" || "$TABS" = "--all" ]] ; then
        # same logic
        USER=$2
        UPDATE_DEV
        PLAYLIST_TYPE=$3
        LOFI=$4
        UPDATE_MUSICVIDS
        # but open chrome with all the urls
        CHR "${MAIL_URLS[*]}" "${SOCIAL_URLS[*]}" "${MUSICVIDS_URLS[*]}" "${DEV_URLS[*]}"
    # else, open chrome with "$TABS" param
    else CHR "$TABS" ; fi
# else, open chrome with root directory
else CHR "$(pwd)" ; fi