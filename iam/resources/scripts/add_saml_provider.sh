#!/bin/bash

set -e

read -p "Name of the SAML integration: " SAML_NAME
FILENAME="${SAML_NAME}.xml"

[[ -z ${SAML_NAME} ]] && echo "Missing SAML integration name" && exit 1

sed -e "s/SAML_NAME/${SAML_NAME}/g" resources/templates/saml_provider.tf >> saml_providers.tf
touch resources/saml_metadata/${FILENAME}
terraform fmt

echo "Place the metadata of the Identity Provider in the file: resources/saml_metadata/${FILENAME}"
