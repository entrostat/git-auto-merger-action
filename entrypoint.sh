#!/bin/sh -l

which git-auto-merger

git-auto-merger merge --base-branch=develop --include-pattern='develop$' --include-pattern='feature\/.*' --exclude-pattern='main'
