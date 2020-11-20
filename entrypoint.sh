#!/bin/bash

set -x

cd $GITHUB_WORKSPACE # Needed?

/usr/local/bin/comby $*
git diff &> p.patch
[ -s p.patch ]# non-zero => empty, no diff, zero => there is a diff
echo ::set-output name=exit-code::$?
rm p.patch
