#!/usr/bin/env bash

local_ip=$(ifconfig en0 | grep 'inet ' | cut -d ' ' -f 2)

echo "local ip: $local_ip"




