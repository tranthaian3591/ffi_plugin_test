#!/bin/bash

CURR_VERSION=vysma_design-v`awk '/^version: /{print $2}' packages/vysma_design/pubspec.yaml`
echo $CURR_VERSION > myfile.txt
