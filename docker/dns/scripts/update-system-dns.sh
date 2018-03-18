#!/bin/bash

sudo sed -i "s/#DNS=/DNS=127.0.0.1/g" /etc/systemd/resolved.conf
sudo service systemd-resolved restart
