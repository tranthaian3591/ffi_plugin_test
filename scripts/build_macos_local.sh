#!/bin/bash

CURR_VERSION=vysma_design-v`awk '/^version: /{print $2}' packages/vysma_design/pubspec.yaml`
just current_vesion=$CURR_VERSION build_macos_local
