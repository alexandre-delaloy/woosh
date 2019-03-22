#!/bin/sh

# ===============================================
# ------------------ VARIABLES ------------------
# ===============================================

# tabs url arrays
DEV_URLS=(
    "https://github.com"
    "https://gitstalk.netlify.com"
)
MAIL_URLS=(
    "https://mail.google.com/"
    "https://outlook.live.com/"
)
MUSICVIDS_URLS=(
    "https://music.youtube.com/"
    "https://youtube.com/"
    "https://netflix.com"
)
SOCIAL_URLS=(
    "https://reddit.com"
    "https://twitter.com"
    "https://messenger.com"
)

# YouTube Music & Youtube playlists
PLAYLISTS=(
    # grandson
    "PL5UDQMgl1JYhU8PD-3GudN_twxxuGp6y2"
    # to sleep
    "PL5UDQMgl1JYjG1e7dGyuHKv22JConOoh2"
    # dope
    "PL5UDQMgl1JYiNa9UOSVEJNf61SEcVuThW"
    # lofi relax
    "hHW1oY26kxQ"
    # lofi sleep
    "axOhJh1x2n8"
)

# https://youtube.com/$VID/video_id
VID="watch?v="
# https://youtube.com/$LIST/playlist_id
MUSIC="playlist?list="

# First parameter
PARAM=$1


# ===============================================
# ------------------ FUNCTIONS ------------------
# ===============================================

# will open new tabs in chrome with given arguments
CHR () { open -a "Google Chrome" $* ; }

# set $MUSICVIDS_URLS array with new value; 
# $1 is the $MUSICVIDS_URLS index,
# $2 is the $PLAYLISTS index,
# $3 is the type ($MUSIC or $VID)
SET_MV_ARRAY () { MUSICVIDS_URLS[$1]="${MUSICVIDS_URLS[$1]}$3${PLAYLISTS[$2]}" ; } 

# update the $DEV_URLS if $USER param exist
UPDATE_DEV () {
    if [ $USER ] ; then
        DEV_URLS[0]="https://github.com/$USER"
        DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
    fi
}

# update the $MUSICVIDS_URLS if $PLAYLIST_TYPE param exist
UPDATE_MUSICVIDS () {
    if [ $PLAYLIST_TYPE = "xx" ] ; then SET_MV_ARRAY 0 0 $MUSIC
    elif [ $PLAYLIST_TYPE = "sleep" ] ; then SET_MV_ARRAY 0 1 $MUSIC
    elif [ $PLAYLIST_TYPE = "dope" ] ; then SET_MV_ARRAY 0 2 $MUSIC
    elif [ $PLAYLIST_TYPE = "lofi" ] ; then
        if [ $LOFI = "-r" ] || [ $LOFI = "--relax" ] ; then SET_MV_ARRAY 1 3 $VID
        elif [ $LOFI = "-s" ] || [ $LOFI = "--sleep" ] ; then SET_MV_ARRAY 1 4 $VID
        fi
    fi
}

# if the param exist
if [ $PARAM ] ; then
    # if the param is -d or --dev
    if [ $PARAM = "-d" ] || [ $PARAM = "--dev" ] ; then
        # create a new user param
        USER=$2
        # update dev urls
        UPDATE_DEV
        # open chrome with dev urls
        CHR ${DEV_URLS[*]}
    # else if param is -m or --mail, open chrome with mail urls
    elif [ $PARAM = "-m" ] || [ $PARAM = "--mail" ] ; then CHR ${MAIL_URLS[*]}
    # you got the logic for the 4 next cases
    elif [ $PARAM = "-s" ] || [ $PARAM = "--social" ] ; then CHR ${SOCIAL_URLS[*]}
    elif [ $PARAM = "-mv" ] || [ $PARAM = "--musicvids" ] ; then
        PLAYLIST_TYPE=$2
        LOFI=$3
        UPDATE_MUSICVIDS
        CHR ${MUSICVIDS_URLS[*]}
    elif [ $PARAM = "-w" ] || [ $PARAM = "--work" ] ; then CHR ${MAIL_URLS[*]} ${DEV_URLS[*]}
    elif [ $PARAM = "-c" ] || [ $PARAM = "--chill" ] ; then 
        PLAYLIST_TYPE=$2
        LOFI=$3
        UPDATE_MUSICVIDS
        CHR ${SOCIAL_URLS[*]} ${MUSICVIDS_URLS[*]}
    # else if the param is -a or --all
    elif [ $PARAM = "-a" ] || [ $PARAM = "--all" ] ; then
        # same logic
        USER=$2
        UPDATE_DEV
        # but open all the urls
        CHR ${MAIL_URLS[*]} ${SOCIAL_URLS[*]} ${MUSICVIDS_URLS[*]} ${DEV_URLS[*]}
    # else if the param is -k or --kill, kill the chrome process
    elif [ $PARAM = "-k" ] || [ $PARAM = "--kill" ] ; then killall "Google Chrome"
    # else, open chrome with given param
    else CHR $PARAM ; fi
# else, open chrome with root directory
else CHR `pwd` ; fi