#!/bin/bash

which git-auto-merger

# This is to fix the following error
# fatal: detected dubious ownership in repository at '/github/workspace'
# To add an exception for this directory, call:
#
#	git config --global --add safe.directory /github/workspace
git config --global --add safe.directory $(pwd)

git fetch --all
git pull --all

INCLUDE_PATTERN_ENTRIES=$(node /scripts/convert-array-to-args.js $2 --include-pattern)
EXCLUDE_PATTERN_ENTRIES=$(node /scripts/convert-array-to-args.js $3 --exclude-pattern)
NOTIFY_EMAILS=$(node /scripts/convert-array-to-args.js $4 --notify-email)

USE_TLS=$9
if [[ "$USE_TLS" == "1" || "$USE_TLS" == "true" || "$USE_TLS" == "TRUE" ]];
then
  TLS_FLAG="--tls"
else
  TLS_FLAG=""
fi

git-auto-merger set:credentials:smtp --host=$5 --port=$6 --username=$7 --password=$8 ${TLS_FLAG} --from-address=$10

git-auto-merger merge --base-branch=$1 ${INCLUDE_PATTERN_ENTRIES} ${EXCLUDE_PATTERN_ENTRIES} ${NOTIFY_EMAILS}
