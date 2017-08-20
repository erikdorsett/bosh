# bootstrap bosh bootloader
# Ref: https://github.com/cloudfoundry/bosh-bootloader
# will generate confidential files you'll need to exclude by adding to a .gitignore file
# - director creds posted to stdout. (put in .json, save)
# - bbl-state.json
# prereq: must have saved aws policy for director as .json locally
#

Main()
./cr_aws-bbl-usr.sh
./bbl-up.sh <aws-access-key-id> <aws-secret-access-key>
bosh -e aws cloud-config > .bbl-info/cloud-config.yml
./bosh-client-config.sh
./cr_aws-lb.sh example.com

[add a cname pointing to elb DNSName for domain in Route53]

[Edit manifest before deploying]
# Ref: https://concourse.ci/clusters-with-bosh.html
# Ref: https://github.com/cloudfoundry/bosh-bootloader/blob/master/docs/getting-started-aws.md
# bosh -e aws -d concourse deploy concourse-manifest.yml
