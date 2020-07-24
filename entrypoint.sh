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

if [ -f "comby-files-64a2a202-cd8b-11ea-87d0-0242ac130003.txt" ]; then
  echo "see files.txt!"
  COMBY_PR_FILES=$(cat comby-files-64a2a202-cd8b-11ea-87d0-0242ac130003.txt)
fi

# replace in place
/usr/local/bin/comby -config .comby -i "$COMBY_PR_FILES"
# get the patch
git diff > p.patch
# debug
cat p.patch
