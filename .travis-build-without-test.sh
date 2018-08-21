#!/bin/bash

echo "Entering annotation-tools/.travis-build-without-test.sh" in `pwd`

# Fail the whole script if any command fails
set -e

export SHELLOPTS

export JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(dirname $(readlink -f $(/usr/bin/which java)))))}

export AFU=`readlink -f ${AFU:-../annotation-tools/annotation-file-utilities}`
export CHECKERFRAMEWORK=`readlink -f ${CHECKERFRAMEWORK:-../checker-framework}`

export PATH=$AFU/scripts:$JAVA_HOME/bin:$PATH


SLUGOWNER=${TRAVIS_REPO_SLUG%/*}
if [[ "$SLUGOWNER" == "" ]]; then
  SLUGOWNER=typetools
fi

set -e

## Compile
echo "About to run \"ant compile\" for annotation-tools" in `pwd`
which ant
ant compile
echo "Finished running \"ant compile\" for annotation-tools"

echo "Exiting annotation-tools/.travis-build-without-test.sh" in `pwd`
