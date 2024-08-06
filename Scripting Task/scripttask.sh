#!/bin/bash

URL=$1

# Fetch the HTTP status code
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

# Check the status code
if [ $STATUS_CODE -eq 200 ]; then
  echo "Success: $URL returned $STATUS_CODE"
else
  echo "Failure: $URL returned $STATUS_CODE"
fi
