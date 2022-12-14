#!/bin/sh -l

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

set -x

git-auto-merger merge --base-branch=$1 ${INCLUDE_PATTERN_ENTRIES[@]} ${EXCLUDE_PATTERN_ENTRIES[@]}
