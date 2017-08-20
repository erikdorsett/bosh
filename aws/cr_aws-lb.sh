#!/bin/bash
# Create load balancer
# generate self-signed certificates for your domain <example.com>
# usage: ./cr_aws-lb.sh example.com

DOMAIN=$1

openssl req \
       -newkey rsa:2048 -nodes -keyout .bbl-info/concourse.$DOMAIN.key \
       -x509 -days 365 -out .bbl-info/concourse.$DOMAIN.crt

# convert RSA key to be usable by bbl (see https://github.com/cloudfoundry/bosh-bootloader/issues/130):
openssl rsa -in .bbl-info/concourse.$DOMAIN.key -out .bbl-info/rsakey.pem

# create load balancers and update cloud config
bbl create-lbs \
  --type concourse \
  --cert .bbl-info/concourse.$DOMAIN.crt \
  --key .bbl-info/rsakey.pem
