#!/bin/sh

# Arrays of links
DEV_URLS=(
    "https://github.com"
    "https://gitstalk.netlify.com"
)
MAIL_URLS=(
    "https://mail.google.com/"
    "https://outlook.live.com/"
)
SOCIAL_URLS=(
    "https://reddit.com"
    "https://twitter.com"
    "https://messenger.com"
)
CHILL_URLS=(
    "https://music.youtube.com"
    "https://youtube.com"
    "https://netflix.com"
)

# First parameter
PARAM=$1

UPDATE_DEV () {
    # create a new user param
    USER=$2
    # if the 2nd param exist
    if [ $USER ] ; then
        # update dev url with user param
        DEV_URLS[0]="https://github.com/$USER"
        DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
    # else open chrome with dev url
    else open -a "Google Chrome" ${DEV_URLS[*]}
    fi
}

# if the param exist
if [ $PARAM ] ; then
    # if the param is -d or --dev
    if [ $PARAM = "-d" ] || [ $PARAM = "--dev" ] ; then
        # create a new user param
        USER=$2
        # if the 2nd param exist
        if [ $USER ] ; then
            # update dev url with user param
            DEV_URLS[0]="https://github.com/$USER"
            DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
        # else open chrome with dev url
        open -a "Google Chrome" ${DEV_URLS[*]}
        fi
    # else if param is -m or --mail, open chrome whith mail url
    elif [ $PARAM = "-m" ] || [ $PARAM = "--mail" ] ; then open -a "Google Chrome" ${MAIL_URLS[*]}
    # you got the logic for the 2 next cases
    elif [ $PARAM = "-s" ] || [ $PARAM = "--social" ] ; then open -a "Google Chrome" ${SOCIAL_URLS[*]}
    elif [ $PARAM = "-c" ] || [ $PARAM = "--chill" ] ; then open -a "Google Chrome" ${CHILL_URLS[*]}

    # else if the param is -a or --all
    elif [ $PARAM = "-a" ] || [ $PARAM = "--all" ] ; then
        USER=$2
        if [ $USER ] ; then
            DEV_URLS[0]="https://github.com/$USER"
            DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
        fi
        open -a "Google Chrome" ${MAIL_URLS[*]} ${SOCIAL_URLS[*]} ${CHILL_URLS[*]} ${DEV_URLS[*]}
    # else, open chrome with giver param
    else open -a "Google Chrome" $PARAM
    fi
# else, open chrome with root directory
else 
    open -a "Google Chrome" `pwd`
fi