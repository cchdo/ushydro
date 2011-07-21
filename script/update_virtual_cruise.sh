#!/bin/bash

# Clear out the old
rm -rf public/virtual_cruise

# Update submodule
git submodule update --init virtual_cruise

# Build and copy
pushd virtual_cruise
./build.sh
mv virtual_cruise ../public/virtual_cruise
popd
