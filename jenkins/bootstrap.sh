#!/bin/bash

vagrant up
ssh-keygen -f ~/.ssh/known_hosts -R example-dotcom
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ./hosts playbook.yml
