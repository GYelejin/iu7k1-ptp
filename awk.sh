#!/bin/bash
awk '
{
    for (i = 1; i <= NF; i++)
		if ($i ~ /^[+-]?[0-9]+$/) {
        	print $i
		}
}' tests/t6f1.txt
