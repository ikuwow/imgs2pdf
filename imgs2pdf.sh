#!/bin/bash

TARGETDIR=$(cd "$1";pwd)
OUTPUTDIR=$TARGETDIR

[[ ! -d "$OUTPUTDIR" ]] && mkdir "$OUTPUTDIR"

echo $TARGETDIR
for FOLDER in "$TARGETDIR"/*; do

    [[ ! -d "$FOLDER" ]] && continue

    NAME=`basename "$FOLDER"`
    echo $NAME

    convert -limit memory 2GiB "$FOLDER/*.{jpg,jpeg,png}" "$OUTPUTDIR/$NAME.pdf"

    [[ $? -eq 0 ]] && trash "$FOLDER"

done

