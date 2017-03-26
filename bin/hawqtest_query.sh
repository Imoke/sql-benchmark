#!/bin/bash

set -x 
ROUND_FILE=$1
if [ "x$ROUND_FILE" == "x" ]
then
    echo "Usage: $0 <ROUND_FILE in conf>"
    exit 1
fi

for round in `cat $ROUND_FILE | awk '{print $1}'`
do
	`/root/lw/hawq-test-tool/bin/start.sh $round`
done

