#!/bin/bash

API_TOKEN=$1
MARKDOWN=`cat /home/jenkins/workspace/github-test/README.md`
URL="https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
HEADER3="X-GitHub-Api-Version: 2022-11-28"

RESPONSE=$(curl -s -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $URL)
echo $RESPONSE
# COMMIT_URL=$(echo $RESPONSE | jq -r '.[0].parents.[0].url')
COMMIT_URL=$(echo $RESPONSE | jq -r '.[0].parents.[0]')
echo "THIS IS THE COMMIT_URL: ${COMMIT_URL}" 

COMMIT_URL_RESPONSE=$(curl -s "https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits/0f41cf767b8220fb3fb96b1144377215ce068857")


# COMMIT=`echo $RESPONSE | jq '.[0].commit'`

# NAME=`echo $COMMIT | jq -r '.author.name'`
# EMAIL=`echo $COMMIT | jq -r '.author.email'`
# DATE=`echo $COMMIT | jq '.author.date'`
# DATE=`echo $DATE | jq -r 'strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%Y-%m-%d")'`
# MESSAGE=`echo $COMMIT | jq -r '.message'`

# COMMIT_API_URL=`echo $COMMIT | jq -r '.url'`
# COMMIT_CURL_RESPONSE=$(curl -s -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $COMMIT_API_URL)

# COMMIT_CHANGES_URL=`echo $COMMIT_CURL_RESPONSE | jq -r '.html_url'`

# MARKDOWN_LINE="| ${NAME} | ${EMAIL} | ${DATE} | ${MESSAGE} | [View Changes](${COMMIT_CHANGES_URL}) |"


# echo -e $MARKDOWN_LINE >> /home/jenkins/workspace/github-test/README.md

# cat /home/jenkins/workspace/github-test/README.md

# git add README.md
# git commit -m "add readme"
# git push origin main
