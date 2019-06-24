#!/usr/bin/env bash

docker build -t allu-cloud-hub --build-arg CACHEBUST=$(date +%s) .

time docker run \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           -p 3000:3000 \
           allu-cloud-hub
