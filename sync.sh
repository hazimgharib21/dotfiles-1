#!/bin/bash

CUR_DIR=$(pwd)
echo $CUR_DIR

rsync -rvh --stats --progress --include ".*" . ~/

echo "DONE"
echo "---------------------------"
echo ""

