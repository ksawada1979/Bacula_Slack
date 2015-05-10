#!/bin/sh

WEBHOOKURL="xxxxxxx"
MESSAGEFILE=$1
#slack 送信チャンネル
CHANNEL=${CHANNEL:-"#xxxxxxx"}
#slack 送信名
BOTNAME=${BOTNAME:-"bacula job result"}
#slack アイコン
FACEICON=${FACEICON:-":hamster:"}
TMPFILE=$(mktemp)

cat ${MESSAGEFILE} | tr '\n' '\\' | sed 's/\\/\\n/g' > ${TMPFILE}
WEBMESSAGE=$(cat ${TMPFILE})

curl -s -S -X POST --data-urlencode "payload={ \
    \"channel\": \"${CHANNEL}\", \
    \"username\": \"${BOTNAME}\", \
    \"icon_emoji\": \"${FACEICON}\", \
    \"text\": \"${WEBMESSAGE}\" \
    }" ${WEBHOOKURL} >/dev/null

if [ -f "${TMPFILE}" ] ; then
    rm -f ${TMPFILE}
fi

exit 0
