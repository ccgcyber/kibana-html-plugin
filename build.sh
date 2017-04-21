#!/usr/bin/env bash

rm -rf ./build

mkdir -p ./build/kibana/kibana-html-plugin

rsync -av --progress . ./build/kibana/kibana-html-plugin \
    --exclude build \
    --exclude build.sh \
    --exclude deploy.sh \
    --exclude .git \
    --exclude .idea

# Retrieve plugin version from the package.json file directly
version=`cat package.json | python -c "import sys, json; print json.load(sys.stdin)['version']"`

cd ./build/
zip -r ./kibana-html-plugin-$version.zip ./kibana/
cd ..
