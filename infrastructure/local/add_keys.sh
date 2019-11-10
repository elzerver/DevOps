#!/bin/bash

echo "Start adding the private keys to ssh-add..."
echo "..."

ssh-add .vagrant/machines/app2/virtualbox/private_key
ssh-add .vagrant/machines/app1/virtualbox/private_key
ssh-add .vagrant/machines/db/virtualbox/private_key

echo "Success ;)"
