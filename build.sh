#!/bin/bash

pushd frontend
npm install
npm run-script build
if [ ! -d ./dist/ ]; then
    echo "Frontend build failed - no dist/ created"
    exit 1
fi
echo "Frontend build successful"
popd

pushd server
npm install
./scripts/update-operators.sh $COMMUNITY_REPO $COMMUNITY_BRANCH || exit 1
popd
