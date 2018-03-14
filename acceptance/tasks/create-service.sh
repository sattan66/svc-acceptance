#!/bin/bash

set -xe

cf api $API --skip-ssl-validation

cf login -u $USER -p $PASSWORD -o "$ORG" -s "$SPACE"

SERVICE_INSTANCE=smk-test-$SERVICE
cf create-service $SERVICE $PLAN $SERVICE_INSTANCE > changes-status.txt

if [[ $? -ne 0 ]]; then
  echo "Service creation failed"
  cat changes-status.txt
  exit 1
fi

echo Service instance $SERVICE_INSTANCE created successfully
echo $SERVICE_INSTANCE > ./service-info/instance-name.txt
