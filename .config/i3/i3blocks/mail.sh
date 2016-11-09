#!/bin/bash

. ${1}
USER=$USERNAME
PASS=$PASSWORD

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
WORD="mail"
COLOR="#d5d5d5"
[[ $((COUNT)) -gt 1 ]] && WORD="mails";
[[ $((COUNT)) -gt 0 ]] && COLOR="#aa0000"

echo $COUNT
echo "$COUNT unread $WORD"
echo $COLOR

