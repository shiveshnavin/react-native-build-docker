#!/bin/sh
if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
    echo "Usage: build.sh <repo_url> <profile> <expo_token> <apk_upload_put_url>"
    exit 1
fi

REPO_URL=$1
PROFILE=$2
EXPO_TOKEN=$3
UPLOAD_PARAM=$4

export EXPO_TOKEN=$3

set -e

echo "Cloning repository from $REPO_URL..."
git clone "$REPO_URL" workspace

if [ -d "./workspace/client" ]; then
    echo "Client directory exists at ./workspace/client"
    cd ./workspace/client
else
    echo "Client directory does not exists (Is the react native app present at root?). Switching to ./workspace"
    cd ./workspace
fi

echo "Installing dependencies..."
yarn install

echo "Cleaning up old APK files..."
find . -name "*.apk" -type f -delete

echo "Building the APK with profile $PROFILE..."
eas build -p android --non-interactive --local --profile "$PROFILE"

echo "Uploading APK..."
sh /app/upload.sh "$UPLOAD_PARAM"

echo "Build process completed successfully!"
