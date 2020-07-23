#!/bin/bash

set -x

cd $GITHUB_WORKSPACE

if [ -z "$COMBY_CONFIG" ]; then
    if [ ! -f .comby ]; then
        echo "No configuration file. Expected .comby in current directory, or config option set in action."
        exit 1
    fi
    COMBY_CONFIG=".comby"
else
    curl $COMBY_CONFIG > .comby
fi

/usr/local/bin/comby -config .comby &> out.diff
cat out.diff
