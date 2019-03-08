> We’ve released an Ansible module to make it even easier to use passwords and other secrets in playbooks without seeing them.
>
> Refer to https://github.com/secrethub/ansible-secrethub as the standard way to use SecretHub with Ansible and consider these examples reference material.

# How to inject secrets into Ansible playbooks with SecretHub

Ansible playbooks often deploy secrets to machines or need secrets to access other resources: database passwords, API tokens, encryption keys. 
[SecretHub](https://secrethub.io) allows you to remove all that secret data from playbooks and inject them at runtime.

You can read a detailed integration guide that uses the example code in this repository [here](https://secrethub.io/blog/how-to-inject-secrets-into-ansible-playbooks/).
