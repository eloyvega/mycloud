#!/bin/bash

set -e

read -p "Name of the Role: " ROLE_NAME
read -p "Name of the SAML Provider integration: " SAML_NAME
read -p "Name of the IAM policy to attach: " POLICY_NAME

[[ -z ${ROLE_NAME} ]] && echo "Missing Role name" && exit 1
[[ -z ${SAML_NAME} ]] && echo "Missing the SAML Provider integration name" && exit 1
[[ -z ${POLICY_NAME} ]] && echo "Missing IAM Policy name" && exit 1

sed -e "s/ROLE_NAME/${ROLE_NAME}/g" -e "s/SAML_NAME/${SAML_NAME}/g" -e "s/POLICY_NAME/${POLICY_NAME}/g" resources/templates/saml_role.tf >> saml_roles.tf
terraform fmt

echo "Role added to saml_roles.tf"
