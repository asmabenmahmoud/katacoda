#!/usr/bin/env bash

if [ "$HOSTNAME" = node01 ]; then
  adduser --disabled-password --home /home/john --gecos "" john;
  usermod -aG sudo john
  ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub

  touch ~/.ssh/config
  echo "Host *" >> ~/.ssh/config
  echo "  StrictHostKeyChecking no" >> ~/.ssh/config
  sudo cp -R /root/.ssh /home/john/.ssh
  sudo chown -R john:john /home/john/.ssh
  # usermod -d -m /home/john john
  #su john && cd ~

  clear;
  su - john -c "cd /home/john; clear; /bin/bash";
  clear;
else
  #hostname git_server

  adduser --disabled-password --home /home/git --gecos "" git;
  usermod -aG sudo git
  ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
  touch ~/.ssh/config
  echo "Host *" >> ~/.ssh/config
  echo "  StrictHostKeyChecking no" >> ~/.ssh/config
  sudo scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r -p root@node01:/root/.ssh/id_rsa.pub /tmp/id_rsa.john;
  sudo cat /tmp/id_rsa.john >> ~/.ssh/authorized_keys
  sudo cp -R /root/.ssh /home/git/.ssh
  sudo chown -R git:git /home/git/.ssh
  ip="$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
  echo "${ip} master" | ssh  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null node01 "cat >> /etc/hosts"
  clear;
  su - git -c "cd /home/git; clear; /bin/bash";

  clear;
fi
