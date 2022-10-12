#!/bin/bash

URL_LIST="www.amazon.com www.google.com"

for URL in $URL_LIST; do

    FAULTY_COUNT=1
    for ((i = 1; i <= 3; i++)); do
        HTTP_CODE=$(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" "$URL")
        if [ $HTTP_CODE -ne 200 ]; then
            let FAULTY_COUNT++
        else
            break
        fi
        sleep 0.5
    done

    if [ "$FAULTY_COUNT" -ge 3 ]; then
        echo "Warning: $URL is NOT reachable."
    else
        echo "Info: $URL is reachable."
    fi

done
