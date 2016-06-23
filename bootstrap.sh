#!/bin/bash

# this will run each vagrant up
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
sudo wp cli update --allow-root --yes
