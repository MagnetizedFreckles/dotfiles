#!/usr/bin/env bash

# Trash files using trash-cli
# Based on https://github.com/PowerMan2206/dots/blob/master/.config/lf/functions

# Put items into array that we can count them
files=()
while read -r line; do files+=("$line"); done <<<"$fx"

# Count how many items there are
len=${#files[@]}

# Confirm trashing
if [[ $len == 1 ]]; then
	echo -n "trash '$fx' ?"
else
	echo -n "trash $len items?"
fi
echo -n " [y/N] "

# Read answer
read -r -n 1 ans
# Make it lowercase
ans="${ans,,}"

# Clears
echo

if [[ $ans == y ]]; then
	trash-put "$fx"
	if [[ $len == 1 ]]; then
		echo "trashed '$files'"
	else
		echo "trashed $len items"
	fi
else
	# Clears the bottom row
	echo
fi
