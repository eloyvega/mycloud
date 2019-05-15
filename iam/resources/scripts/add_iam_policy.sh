#!/bin/bash

set -e

read -p "Name of the IAM Policy: " POLICY_NAME
FILENAME="${POLICY_NAME}.json"

[[ -z ${POLICY_NAME} ]] && echo "Missing IAM Policy name" && exit 1

sed -e "s/POLICY_NAME/${POLICY_NAME}/g" resources/templates/iam_policy.tf >> iam_policies.tf
touch resources/policies/${FILENAME}
terraform fmt

echo "You can now write the IAM Policy document in the file: resources/policies/${FILENAME}"
