#!/usr/bin/env bash

docker build -t allu-cloud-hub .

time docker run \
           --net=host \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           allu-cloud-hub
