#!/bin/bash

set -x

cd $GITHUB_WORKSPACE
/usr/local/bin/comby "$COMBY_M" "$COMBY_R" &> out.diff
cat out.diff
