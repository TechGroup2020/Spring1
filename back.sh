#!/bin/bash
docker stop backcont17 
docker rm backcont17
docker run -i --name backcont17 --network=gomatha --ip 192.168.1.5  -p 6060:6060  backimg17 /bin/bash
docker run -it --name backcont17 backimg17 /bin/bash
docker start backcont17 
docker exec backcont17  ./startup.sh 
