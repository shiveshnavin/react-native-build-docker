APK_FILE=$(find . -name "*.apk" -type f | head -n 1)

if [ -z "$APK_FILE" ]; then
  echo "No APK file found to upload."
  exit 1
fi

cp $APK_FILE /app/builds/$APK_FILE
echo Copied $APK_FILE locally to /app/builds/$APK_FILE

if [ -n "$1" ]; then
    echo "Uploading APK to $1"
    curl --location --request PUT "$1" \
    --header "Content-Type: application/vnd.android.package-archive" \
    --data-binary "@$APK_FILE"

    if [ $? -eq 0 ]; then
        echo "Upload successful."
        echo "$1"
    else
        echo "Upload failed."
        exit 1
    fi
else
    echo "Skipping APK upload as no URL was provided."
fi
