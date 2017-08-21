# Bootstrap bosh bootloader (B-bbl)

Reference: [bbl](https://github.com/cloudfoundry/bosh-bootloader)

Warning: These scripts will generate confidential files you'll need to exclude by adding to a .gitignore file
- director creds posted to stdout. (put in .json, save)
- bbl-state.json

Prereq: must have saved aws policy for director as .json locally

## Main.sh calls:
- ./cr_aws-bbl-usr.sh
- ./bbl-up.sh <aws-access-key-id> <aws-secret-access-key>
- ./bosh-client-config.sh
- bosh -e aws cloud-config > .bbl-info/cloud-config.yml
- ./config-bosh-dir.sh
- ./cr_aws-lb.sh example.com

[add a cname pointing to elb DNSName for domain in Route53]

[Edit manifest before deploying] See: concourse-manifest.yml.temp

Reference: [Bosh Concourse](https://concourse.ci/clusters-with-bosh.html)

Reference: [bbl-aws](https://github.com/cloudfoundry/bosh-bootloader/blob/master/docs/getting-started-aws.md)

Then run:
- bosh -e aws -d concourse deploy concourse-manifest.yml
