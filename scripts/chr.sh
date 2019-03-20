#!/bin/sh

PARAM=$*

DEV_URLS=(
    "https://github.com"
    "https://gitstalk.netlify.com"
)

MAIL_URLS=(
    "https://mail.google.com/"
    "https://outlook.live.com/"
)

SOCIAL_URLS=(
    "https://messenger.com"
    "https://twitter.com"
    "https://reddit.com"
)

if [ $PARAM ]
then
    if [ $PARAM = "-d" ] || [ $PARAM = "--dev" ]
    then
        USER=$2
        if [ $USER ]
        then
            DEV_URLS[0]="https://github.com/$USER"
            DEV_URLS[1]="https://gitstalk.netlify.com/$USER"
        fi
        open -a "Google Chrome" ${DEV_URLS[*]}
    elif [ $PARAM = "-m" ] || [ $PARAM = "--mail" ]
    then
        open -a "Google Chrome" ${MAIL_URLS[*]}
    elif [ $PARAM = "-s" ] || [ $PARAM = "--social" ]
    then
        open -a "Google Chrome" ${SOCIAL_URLS[*]}
    elif [ $PARAM = "-a" ] || [ $PARAM = "--all" ]
    then
        open -a "Google Chrome" ${MAIL_URLS[*]} ${SOCIAL_URLS[*]} ${DEV_URLS[*]}
    else 
        open -a "Google Chrome" $PARAM
    fi
else
    open -a "Google Chrome" ./
fi

