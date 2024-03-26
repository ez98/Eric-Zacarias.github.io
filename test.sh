#!/bin/bash

API_TOKEN=$1
MARKDOWN=`cat /home/jenkins/workspace/github-test/README.md`
URL="https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
HEADER3="X-GitHub-Api-Version: 2022-11-28"

RESPONSE=$(curl -s -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $URL)
COMMIT=`echo $RESPONSE | jq '.[0].commit'`

NAME=`echo $COMMIT | jq -r '.author.name'`
EMAIL=`echo $COMMIT | jq -r '.author.email'`
DATE=`echo $COMMIT | jq '.author.date'`
DATE=`echo $DATE | jq -r 'strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%Y-%m-%d")'`
MESSAGE=`echo $COMMIT | jq -r '.message'`

COMMIT_API_URL=`echo $COMMIT | jq -r '.url'`
COMMIT_CURL_RESPONSE=$(curl -s -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $COMMIT_API_URL)

COMMIT_CHANGES_URL=`echo $COMMIT_CURL_RESPONSE | jq -r '.html_url'`

MARKDOWN_LINE="\n| ${NAME} | ${EMAIL} | ${DATE} | ${MESSAGE} | [View Changes](${COMMIT_CHANGES_URL}) |"


echo -e $MARKDOWN_LINE >> /home/jenkins/workspace/github-test/README.md

cat /home/jenkins/workspace/github-test/README.md

git config --global user.email "ericzacarias80@gmail.com"
git config --global user.name "ez98"
git remote set-url origin git@github.com:ez98/Eric-Zacarias.github.io.git
git add README.md
git commit -m "add readme"
git push origin HEAD:Eric-Zacarias.github.io
# update README.md