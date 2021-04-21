#!/bin/bash

set -e 

python /src/app.py &

filebeat -e -c /src/filebeat/filebeat.yml