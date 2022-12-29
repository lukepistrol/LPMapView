#!/bin/bash

export LC_ALL=en_US.UTF-8

set -o pipefail && xcodebuild clean docbuild -scheme LPMapView \
    -destination generic/platform=iOS \
    -skipPackagePluginValidation \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path LPMapView --output-path ./docs" | xcpretty
