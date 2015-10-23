#!/bin/bash

# Upload to HockeyApp
curl https://rink.hockeyapp.net/api/2/apps/$HOCKEY_APP_ID/app_versions \
  -F status="2" \
  -F notify="0" \
  -F notes="Build!11" \
  -F notes_type="0" \
  -F ipa="../app/build/outputs/apk.ipa" \
#  -F dsym="@$OUTPUTDIR/$APP_NAME.app.dSYM.zip" \
  -H "X-HockeyAppToken: $HOCKEY_APP_TOKEN"
