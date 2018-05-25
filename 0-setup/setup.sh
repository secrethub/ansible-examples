#!/bin/bash
# 
# This script sets up an ansible-example repository on your personal SecretHub account.
# The repository is populated with a few directories and secrts for the example playbooks.

set -e

if [ -z "$SECRETHUB_USERNAME" ]; then 
    echo "SECRETHUB_USERNAME environment variable not set, please set it to your SecretHub username";
    exit 1;
fi

echo "Setting up an ansible-example repository, this can take a few seconds..."

secrethub repo init ${SECRETHUB_USERNAME}/ansible-example > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-example/1-read > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-example/2-write > /dev/null
secrethub mkdir ${SECRETHUB_USERNAME}/ansible-example/3-service > /dev/null
echo "user1" | secrethub write ${SECRETHUB_USERNAME}/ansible-example/1-read/db_user > /dev/null
secrethub generate rand ${SECRETHUB_USERNAME}/ansible-example/1-read/db_password > /dev/null

echo "Done! You're ready to use the example playbooks."