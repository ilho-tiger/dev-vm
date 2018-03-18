#!/bin/bash

sudo lsof -n -i :53
sudo lsof -i | grep -i listen
netstat -tulpn | grep :53\ 