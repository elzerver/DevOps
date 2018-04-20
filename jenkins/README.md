This is the old way to setup the jenkins master
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ./hosts playbook.yml
This is the new way to setup the jenkins master
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ./hosts jenkins-master.yml
This is the new way to setup the jenkins slave
ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ./hosts jenkins-slave.yml


ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ./hosts playbook.yml

** Jenkins Master
[ ] IP: 192.168.42.2

** Jenkins Slave
[ ] IP: 192.168.42.3
