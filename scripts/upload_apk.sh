#!/bin/bash

printf "Uploading to HockeyApp...\n"

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
printf -v RELEASE_NOTES "Branch:$TRAVIS_BRANCH\nBuild: $TRAVIS_BUILD_NUMBER\nUploaded: $RELEASE_DATE\nCommit Range:$TRAVIS_COMMIT_RANGE\nPull Request:$TRAVIS_PULL_REQUEST"

# Upload to HockeyApp
curl https://rink.hockeyapp.net/api/2/apps/$HOCKEY_APP_ID/app_versions \
  -F status="2" \
  -F notify="1" \
  -F notes="$RELEASE_NOTES" \
  -F notes_type="0" \
  -F ipa="@app/build/outputs/apk/app-release-unsigned.apk" \
  -H "X-HockeyAppToken: $HOCKEY_APP_TOKEN"
