#!/bin/bash -e

REMOTE=$1 
  : ${REMOTE:=origin}
FIRST_STEP=game_store_codelab
STEPS=(game_store_codelab user-story-1 user-story-2 user-story-3 user-story-4 user-story-5 user-story-6 user-story-7 user-story-8)

# $1 branch name
function create_branch() {
	git branch -f $1
}

# $1 destination directory
# $2 steps to copy
function step_branch() {
	cp -a -f "$PWD/$2/." "$PWD/$1"
	git add $PWD/$1
	git commit -m "'Step $2'"
	create_branch $2
}

# $1 remote
# $2 steps to push
function push_branch() {
	git push -f $1 $2
}

function log() { echo -e "\n##########################################\n# $*\n##########################################\n"; }
# $1 steps to output
function foreach() { printf "%s\n" $*; }
# $1 command to run
function execute() { xargs -l1 -i bash -c "log $* {}; $* {}"; }

# Needed for create
export -f log create_branch step_branch push_branch

create_branch $FIRST_STEP

foreach ${STEPS[@]:1} | execute step_branch $FIRST_STEP

foreach ${STEPS[@]} | execute push_branch $REMOTE
