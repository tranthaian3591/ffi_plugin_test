#!/bin/bash

CURR_VERSION=vysma_design-v`awk '/^version: /{print $2}' packages/vysma_design/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_vysma_design/ios/flutter_vysma_design.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_vysma_design/macos/flutter_vysma_design.podspec
rm packages/flutter_vysma_design/macos/*.bak packages/flutter_vysma_design/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_vysma_design/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_vysma_design/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_vysma_design/
