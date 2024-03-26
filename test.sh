#!/bin/bash

API_TOKEN=$1

URL="https://api.github.com/repos/ez98/Eric-Zacarias.github.io/commits"
HEADER1="Accept: application/vnd.github+json"
HEADER2="Authorization: Bearer $API_TOKEN"
HEADER3="X-GitHub-Api-Version: 2022-11-28"

curl -L -H "$HEADER1" -H "$HEADER2" -H "$HEADER3" $URL

# test new agent with jq installed