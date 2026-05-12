#!/bin/zsh

IMAGE=$1
OUT_PATH=$(gum file --directory)
if [[ "$OUT_PATH" == *"/"* ]]; then
    cp $IMAGE $OUT_PATH
else
    exit
fi
