#!/bin/bash
# configure bosh cli
eval "$(bbl print-env)"

# export cert to local file
bbl director-ca-cert > .bbl-info/bosh.crt
export BOSH_CA_CERT=.bbl-info/bosh.crt

# add bbl generated key to agent so ssh to vms possible
# bosh -e aws -d concourse ssh web/0

bbl ssh-key > .bbl-info/bblbosh.key
chmod 0700 .bbl-info/bblbosh.key
ssh-add .bbl-info/bblbosh.key

# login to bosh dir
export BOSH_ENVIRONMENT=$(bbl director-address)
bosh alias-env aws
bosh log-in
# Username: user-d3783rk
# Password: p-23dah71sk1
