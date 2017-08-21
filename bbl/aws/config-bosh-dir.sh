#!/bin/bash
# upload stemcells and concourse releases

# upload latest stemcell
bosh -e aws upload-stemcell https://bosh.io/d/stemcells/bosh-aws-xen-ubuntu-trusty-go_agent
bosh -e aws upload-stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent

# Upload latest version, currently 3.4.0
# https://bosh.io/releases/github.com/concourse/concourse?all=1
bosh -e aws upload-release https://bosh.io/d/github.com/concourse/concourse

#upload garden-runc
bosh -e aws upload-release bosh -e aws upload-release https://github.com/concourse/concourse/releases/download/v3.4.0/garden-runc-1.6.0.tgz
