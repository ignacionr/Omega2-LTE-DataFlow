#!/bin/bash

mkdir -p /tmp/build
cd /tmp/build
cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=/workspaces/Omega2-LTE-DataFlow/toolchain.cmake /workspaces/Omega2-LTE-DataFlow
ninja
file ./main
