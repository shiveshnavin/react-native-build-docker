FROM reactnativecommunity/react-native-android

WORKDIR /app
COPY . .

RUN npm install --global eas-cli

EXPOSE 8080

RUN chmod +x /app/build.sh
RUN chmod +x /app/upload.sh

ENTRYPOINT ["/app/build.sh"]