#!/bin/bash

# Getting numbers from files
n1=$( grep -P -o "(?<= |^)([+-]?[0-9]+)(?= |$)" "$1" )
n2=$( grep -P -o "(?<= |^)([+-]?[0-9]+)(?= |$)" "$2" )

# Check if verbose flag was passed
VERBOSE=0
while [ $# -ne 0 ]; do
	if [ "$1" = "-v" ]; then
		# We have the verbose flag, print numbers
		# extracted from files
		c1=$(echo $n1 | wc -w)
		c2=$(echo $n2 | wc -w)
		echo "File 1 numbers count: ${c1}"
		echo "File 2 numbers count: ${c2}"
		VERBOSE=1
	fi
	shift
done

# Compare the number strings
if [ "$n1" = "$n2" ]; then
	if [ $VERBOSE -eq 1 ]; then
		echo "Numbers match (code 0)"
	fi
	exit 0
else
	if [ $VERBOSE -eq 1 ]; then
		echo "Numbers do not match (code 1)"
	fi
	exit 1
fi
