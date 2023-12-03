#!/bin/bash

# Function to separate numbers from other words
function extract_numbers {
    local numbers
    for element in $1; do
        # Check if word is number using regexp
        if [[ $element =~ ^[+-]?[0-9]+$ ]] ; then
            numbers="${numbers}${element} "
        fi
    done
    echo "$numbers"
}

# Getting file contents
f1=$(cat "$1")
f2=$(cat "$2")

# Getting numbers from files
n1=$(extract_numbers "$f1")
n2=$(extract_numbers "$f2")

# Check if verbose flag was passed
VERBOSE=0
while [ $# -ne 0 ] ; do
    if [ "$1" = "-v" ] ; then
    	# We have the verbose flag, print numbers
    	# extracted from files
        echo "File 1 numbers: ${n1}"
        echo "File 2 numbers: ${n2}"
        VERBOSE=1
    fi
    shift
done

# Compare the number strings
if [ "$n1" = "$n2" ] ; then
	if [ $VERBOSE -eq 1 ] ; then
		echo "Numbers match (code 0)"
	fi
    exit 0;
else
	if [ $VERBOSE -eq 1 ] ; then
		echo "Numbers do not match (code 1)"
	fi
    exit 1;
fi
