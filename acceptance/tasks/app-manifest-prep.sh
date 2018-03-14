#!/bin/bash

set -xe

cat ./service-info/instance-name.txt

cd git-repo

sed "s/service-instance/$(cat ../service-info/instance-name.txt)/" ./manifest.yml > ../app-manifest-output/manifest.yml

cat ../app-manifest-output/manifest.yml 