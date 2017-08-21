#!/bin/bash
# Use bbl and bosh to get concourse up and running in aws

./cr_aws-bbl-usr.sh
./bbl-up.sh <aws-access-key-id> <aws-secret-access-key>
./bosh-client-config.sh
bosh -e aws cloud-config > .bbl-info/cloud-config.yml
./config-bosh-dir.sh
./cr_aws-lb.sh example.com

[Edit manifest before deploying]
# Ref: https://concourse.ci/clusters-with-bosh.html
# Ref: https://github.com/cloudfoundry/bosh-bootloader/blob/master/docs/getting-started-aws.md
# bosh -e aws -d concourse deploy concourse-manifest.yml
