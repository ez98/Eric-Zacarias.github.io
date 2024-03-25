#!/bin/bash

API_TOKEN=$1

URL="https://github.com/ez98/Eric-Zacarias.github.io"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
I
curl --request GET --url "$URL" --header "$HEADER1" --header "$HEADER2"

