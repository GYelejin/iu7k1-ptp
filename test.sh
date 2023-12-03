#!/bin/bash

# Count of tests
count=5

i=1
while [ $i -le $count ]; do 
	echo "Test ${i}"

	f1name="t${i}f1.txt"
	f2name="t${i}f2.txt"

	./comparator1.sh "tests/${f1name}" "tests/${f2name}" -v
	
	i=$(($i+1))

	echo 
done

