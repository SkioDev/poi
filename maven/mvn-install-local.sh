#! /bin/bash

# For use within the skio repository
# Automatically populated by ant
#  Usage:
#   1. ant dist
#   2. cd build/dist
#   3. ./mvn-install-local.sh 

VERSION=@VERSION@
DSTAMP=@DSTAMP@
LOCAL_REPO_PATH=../../../maven

for artifactId in poi poi-scratchpad poi-ooxml poi-examples poi-ooxml-schemas poi-excelant
do
  SENDS="-Dfile=$artifactId-$VERSION-$DSTAMP.jar"
  SENDS="$SENDS -DpomFile=$artifactId-$VERSION.pom"
  if [ -r $artifactId-$VERSION-sources-$DSTAMP.jar ]; then
     SENDS="$SENDS -Dsources=$artifactId-$VERSION-sources-$DSTAMP.jar"
  fi
  if [ -r $artifactId-$VERSION-javadocs-$DSTAMP.jar ]; then
     SENDS="$SENDS -Djavadoc=$artifactId-$VERSION-javadocs-$DSTAMP.jar"
  fi

  mvn install:install-file \
    -DlocalRepositoryPath=$LOCAL_REPO_PATH \
    $SENDS
done

