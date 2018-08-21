#!/bin/bash

STACK=${1:-stack}

pushd lib1
echo "changing working directory to: "
pwd
${STACK} clean
${STACK} --resolver lts-12.7 build
popd

pushd lib2
echo "changing working directory to: "
pwd
${STACK} clean
${STACK} --resolver lts-12.7 solver
${STACK} --resolver lts-12.7 build
popd

pushd app
echo "changing working directory to: "
pwd
${STACK} clean
${STACK} --resolver lts-12.7 solver
${STACK} --resolver lts-12.7 build
${STACK} --resolver lts-12.7 exec app
popd
