#!/usr/bin/env bash

if [ "$HOSTNAME" = node01 ]; then
  sudo -H -u john bash -c 'cd ~';
  sudo -H -u john bash -c 'mkdir -p depot-local';
  #chown -R john:root /home/john/mon-projet;
  sudo -H -u john bash -c 'git config --add core.editor vim';
  sudo -H -u john bash -c 'git config --add user.name john';
  sudo -H -u john bash -c 'git config --add user.email john.doe@mail.com';
  sudo -H -u john bash -c 'clear';
else
  #hostname git_server
  sudo -H -u git bash -c 'sudo mkdir -p /opt/git/depot-distant.git'
  sudo -H -u git bash -c 'sudo touch /opt/git/depot-distant.git/README.md'
  sudo -H -u git bash -c 'sudo git --bare init /opt/git/depot-distant.git'

  sudo -H -u git bash -c 'clear';
fi

#launch_container "git_host";
