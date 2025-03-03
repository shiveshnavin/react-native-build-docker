# Building react native app builds
A simple tool to build react native apks locally using docker

## Usage Local
Make sure you:
- Have added a dev client using `npx expo install expo-dev-client`
- Added package name to `app.json` > android > package
- Created a key store by running `eas build --android`

```sh
build.sh https://github.com/fork/repo development XXX_EXPO_TOKEN_XXX https://www.example.com/PUT/upload/url/app.apk
```

## Usage Docker
The upload url parameter is optional. The apk can be found in the ./local-builds folder anyway.

```sh
docker run --rm \
  -v $(pwd)/local-builds:/app/builds \
  semibit/react-native-build \
  https://github.com/fork/repo \
  development \
  XXX_EXPO_TOKEN_XXX \
  https://www.example.com/PUT/upload/url/app.apk
``` 
