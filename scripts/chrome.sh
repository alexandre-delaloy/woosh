#!/bin/sh

# Arrays of urls
D_URLS=(
    "https://github.com"
    "https://gitstalk.netlify.com"
)
M_URLS=(
    "https://mail.google.com/"
    "https://outlook.live.com/"
)
MV_URLS=(
    "https://music.youtube.com"
    "https://youtube.com"
    "https://netflix.com"
)
S_URLS=(
    "https://reddit.com"
    "https://twitter.com"
    "https://messenger.com"
)

# will update the dev urls if user param was given
UPDATE_DEV () {
    # if the 2nd param exist
    if [ $USER ] ; then
        # update dev url with user param
        D_URLS[0]="https://github.com/$USER"
        D_URLS[1]="https://gitstalk.netlify.com/$USER"
    fi
}

# will open new tabs in chrome with given arguments
CHR () { open -a "Google Chrome" $* ; }

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
        CHR ${D_URLS[*]}
    # else if param is -m or --mail, open chrome with mail urls
    elif [ $PARAM = "-m" ] || [ $PARAM = "--mail" ] ; then CHR ${M_URLS[*]}
    # you got the logic for the 4 next cases
    elif [ $PARAM = "-s" ] || [ $PARAM = "--social" ] ; then CHR ${S_URLS[*]}
    elif [ $PARAM = "-mv" ] || [ $PARAM = "--musicvids" ] ; then CHR ${MV_URLS[*]}
    elif [ $PARAM = "-w" ] || [ $PARAM = "--work" ] ; then CHR ${M_URLS[*]} ${D_URLS[*]}
    elif [ $PARAM = "-c" ] || [ $PARAM = "--chill" ] ; then CHR ${S_URLS[*]} ${MV_URLS[*]}
    # else if the param is -a or --all
    elif [ $PARAM = "-a" ] || [ $PARAM = "--all" ] ; then
        # same logic
        USER=$2
        UPDATE_DEV
        # but open all the urls
        CHR ${M_URLS[*]} ${S_URLS[*]} ${MV_URLS[*]} ${D_URLS[*]}
    # else if the param is -k or --kill, kill the chrome process
    elif [ $PARAM = "-k" ] || [ $PARAM = "--kill" ] ; then killall "Google Chrome"
    # else, open chrome with given param
    else CHR $PARAM
    fi
# else, open chrome with root directory
else CHR `pwd`
fi