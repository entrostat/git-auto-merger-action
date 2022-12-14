#!/bin/sh -l

which git-auto-merger

# This is to fix the following error
# fatal: detected dubious ownership in repository at '/github/workspace'
# To add an exception for this directory, call:
#
#	git config --global --add safe.directory /github/workspace
git config --global --add safe.directory $(pwd)

git-auto-merger merge --base-branch=develop --include-pattern='develop$' --include-pattern='feature\/.*' --exclude-pattern='main'
