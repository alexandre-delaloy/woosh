#!/bin/sh


# Arrays of urls
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

LISTS=(
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

# will update the dev urls if user param was given
UPDATE_DEV () {
    # if the 2nd param exist
    if [ $USER ] ; then
        # update dev url with user param
        DEV_URLS[0]="https://github.com/$USER"
        DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
    fi
}

MUSIC () {
    if [ $MUSIC_PLAYLIST = "lofi" ] ; then
        if [ $LOFI = "-r" ] || [ $LOFI = "--relax" ] ; then MUSICVIDS_URLS[1]="${MUSICVIDS_URLS[1]}$VID${LISTS[3]}"
        elif [ $LOFI = "-s" ] || [ $LOFI = "--sleep" ] ; then MUSICVIDS_URLS[1]="${MUSICVIDS_URLS[1]}$VID${LISTS[4]}"
        fi
    elif [ $MUSIC_PLAYLIST = "xx" ] ; then MUSICVIDS_URLS[0]="${MUSICVIDS_URLS[0]}$LIST${LISTS[0]}"
    elif [ $MUSIC_PLAYLIST = "sleep" ] ; then MUSICVIDS_URLS[0]="${MUSICVIDS_URLS[0]}$LIST${LISTS[1]}"
    elif [ $MUSIC_PLAYLIST = "dope" ] ; then MUSICVIDS_URLS[0]="${MUSICVIDS_URLS[0]}$LIST${LISTS[2]}"
    fi
}

# will open new tabs in chrome with given arguments
CHR () { open -a "Google Chrome" $* ; }

VID="watch?v="
LIST="playlist?list="

# First parameter
PARAM=$1

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
        MUSIC_PLAYLIST=$2
        LOFI=$3
        MUSIC
        CHR ${MUSICVIDS_URLS[*]}
    elif [ $PARAM = "-w" ] || [ $PARAM = "--work" ] ; then CHR ${MAIL_URLS[*]} ${DEV_URLS[*]}
    elif [ $PARAM = "-c" ] || [ $PARAM = "--chill" ] ; then 
        MUSIC_PLAYLIST=$2
        LOFI=$3
        MUSIC
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