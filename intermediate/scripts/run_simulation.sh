#!/bin/bash
echo $((1 + ($RANDOM % 6))) > result_$1.txt
