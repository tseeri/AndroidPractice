#!/bin/bash

printf "Uploading to HockeyApp...\n"

# Upload to HockeyApp
uploadResponse=$(curl https://rink.hockeyapp.net/api/2/apps/$HOCKEY_APP_ID/app_versions \
  -F status="2" \
  -F notify="1" \
  -F notes="Build note" \
  -F notes_type="0" \
  -F ipa="@app/build/outputs/apk/app-release-unsigned.apk" \
  -H "X-HockeyAppToken: $HOCKEY_APP_TOKEN")

printf $uploadResponse
