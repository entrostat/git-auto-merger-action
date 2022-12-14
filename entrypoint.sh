#!/bin/sh -l

which git-auto-merger

# This is to fix the following error
# fatal: detected dubious ownership in repository at '/github/workspace'
# To add an exception for this directory, call:
#
#	git config --global --add safe.directory /github/workspace
git config --global --add safe.directory $(pwd)

set -x

echo $1
echo $2
echo $3

git-auto-merger merge --base-branch=develop --include-pattern='develop$' --include-pattern='feature\/.*' --exclude-pattern='main'
