#!/bin/bash
# 
# This script sets up an ansible-examples repository on your personal SecretHub account.
# The repository is populated with a few directories and secrets for the example playbooks.

set -e

if [ -z "$SECRETHUB_USERNAME" ]; then 
    echo "SECRETHUB_USERNAME environment variable not set, please set it to your SecretHub username";
    exit 1;
fi

echo "Setting up an ansible-examples repository, this can take a few seconds..."

# This ensures we don't get prompted for the passphrase each time. 
export SECRETHUB_CREDENTIAL_PASSPHRASE_CACHE_TTL="30s"

secrethub repo init ${SECRETHUB_USERNAME}/ansible-examples > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-examples/1-read > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-examples/2-write > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-examples/3-service > /dev/null
echo "user1" | secrethub write ${SECRETHUB_USERNAME}/ansible-examples/1-read/db_user > /dev/null
secrethub generate rand ${SECRETHUB_USERNAME}/ansible-examples/1-read/db_password > /dev/null
secrethub generate rand ${SECRETHUB_USERNAME}/ansible-examples/3-service/password > /dev/null

echo "Done! You're ready to use the example playbooks."