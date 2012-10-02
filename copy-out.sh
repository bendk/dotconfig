#!/bin/sh
#
# copy files from the local home directory to this repository

for filename in `cat allfiles`; do
        cp ${filename} ~
done
