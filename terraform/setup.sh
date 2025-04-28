#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS='/Users/mafalda.rodrigues/.gc/keys/de-zoomcamp-creds.json'

echo $GOOGLE_APPLICATION_CREDENTIALS

terraform init

terraform plan

terraform apply