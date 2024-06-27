#!/bin/bash

API_TOKEN=$1
MARKDOWN=`cat /home/jenkins/workspace/github-test/README.md`
URL="https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
HEADER3="X-GitHub-Api-Version: 2022-11-28"

response=$(curl -s -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $URL)

#Retrieve commits from current day only
date=$(date '+%Y-%m-%d')
commits_today=`echo $response | jq -r --arg DATE "$date" '[.[] | select(.commit.author.date|startswith($DATE))]'`

commits_lst=`echo $commits_today | jq '[.[].parents[].url']`



echo $commits_lst



# max=`echo $commits_lst | jq 'length'`
# for ((i=0; i < max; i++ ));
# do
#     commit_url=`echo $commits_lst | jq --arg i $i '.[$i|tonumber]'`
#     filename=`curl -s ${commit_url} | jq '.files[].filename'`
#     if [ $filename != "README.md" ] && [ ! -z $filename ]; then
#         commit_metadata=`curl -s ${commit_url}`
#         name=`echo $commit_metadata | jq -r '.commit.committer.name'`
#         email=`echo $commit_metadata | jq -r '.commit.committer.email'`
#         date=`echo $commit_metadata | jq -r '.commit.committer.date | strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%m-%d-%Y")'`
#         message=`echo $commit_metadata | jq -r '.commit.message'`
#         url=`echo $commit_metadata | jq -r '.html_url'`
#     fi
# done

# LIST_LENGTH=`echo $COMMITS_LIST | jq 'length'`

# for COMMIT in "${LST[@]}"; do
#     echo $COMMIT
#     echo "next"
# done

# COMMIT_URL_RESPONSE=`curl -s ${COMMIT_URL}`

# FILENAME=$(echo $COMMIT_URL_RESPONSE | jq '.files[0].filename ')

# if [ $FILENAME != "README.md" ]; then

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
