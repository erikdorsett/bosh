#!/bin/bash
# Create bbl service account and dir to store generated creds
# Run from your <bosh>/<aws> working directory
# NOTE:The create-access-key command will write an "access key id" and "secret access key" to the terminal. These values are important and should be kept secret. In the next section bbl will use these commands to create infrastructure on AWS.


if [ -d ".bbl-info/" ]
then
    echo "Directory .bbl-info/ exists."
else
    echo "Warning: Directory /path/to/dir does not exist. Creating..."
		mkdir .bbl-info/
fi

aws iam create-user --user-name "bbl-user"
aws iam put-user-policy --user-name "bbl-user" \
	--policy-name "bbl-policy" \
	--policy-document file://aws-bbl-policy.json
aws iam create-access-key --user-name "bbl-user" > .bbl-info/bbl-user.aws.creds
