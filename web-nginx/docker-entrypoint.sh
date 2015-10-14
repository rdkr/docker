#!/bin/sh

set -e

# wait 60s for config files to import 
sleep 60s;

nginx -g "daemon off;"