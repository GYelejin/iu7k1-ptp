#!/bin/bash

# Count of tests
count=7

answers="0 0 0 1 1 0 0"

i=1

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

for ans in $answers ; do
	echo "Test ${i}"

	f1name="t${i}f1.txt"
	f2name="t${i}f2.txt"

	./comparator1.sh "tests/${f1name}" "tests/${f2name}" -v
	
	code=$?
	if [ $ans -eq $code ] ; then 
		echo -e "Result: ${GREEN}PASSED${NC}"
	else
		echo -e "Result: ${RED}FAILED${NC}"
	fi

	i=$((i + 1))

	echo

done
