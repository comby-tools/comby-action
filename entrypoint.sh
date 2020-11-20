#!/bin/bash

set -x

cd $GITHUB_WORKSPACE # Needed?

/usr/local/bin/comby $*
git diff &> p.patch
if [ -s p.patch ]; then
    # non-zero => empty
    echo ::set-output name=exit-code::0
else
    # zero => has content, emit 2.
    echo ::set-output name=exit-code::2
fi
rm p.patch
