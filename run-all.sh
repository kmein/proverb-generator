#!/usr/bin/env bash
for subdir in $(ls -d */); do
    for file in $(ls -d ${subdir}*); do
        echo -n "[ ${file} ] "
        ./${file}
    done
done
