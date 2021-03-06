#!/usr/bin/env bash

docker build -t allu-cloud-hub --build-arg CACHEBUST=$(date +%s) .

docker run \
    -d \
    -it \
    --security-opt seccomp:unconfined \
    --shm-size "256M" \
    -p 80:80 \
    -p 25565:25565 \
    allu-cloud-hub \
    /bin/bash -c "chmod 777 scripts/change_package_json_IP_to_local_IPV4.sh && scripts/change_package_json_IP_to_local_IPV4.sh && PORT=80 npm start"