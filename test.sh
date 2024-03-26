#!/bin/bash

API_TOKEN=$1

URL="https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
HEADER3="X-GitHub-Api-Version: 2022-11-28"

RESPONSE=$(curl --silent -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $URL)
COMMIT=`echo $RESPONSE | jq '.[0].commit'`

NAME=`echo $COMMIT | jq '.author.name'`
EMAIL=`echo $COMMIT | jq '.author.email'`
DATE=`echo $COMMIT | jq '.author.date'`
MESSAGE=`echo $COMMIT | jq '.message'`
COMMIT_API_URL=`echo $COMMIT | jq -r '.url'`
COMMIT_CURL_RESPONSE=$(curl -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $COMMIT_API_URL)
echo $COMMIT_CURL_RESPONSE  
# test new agent with jq installed