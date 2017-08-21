#!/bin/bash
# $1 <bbl user aws ACCESS KEY ID>
# 2 <bbl user aws SECRET ACCESS KEY>
bbl up \
	--aws-access-key-id $1 \
	--aws-secret-access-key $2 \
	--aws-region us-west-1 \
	--iaas aws
