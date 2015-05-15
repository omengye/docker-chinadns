docker-chinadns
==================

This Dockerfile builds an image with https://github.com/clowwindy/ChinaDNS.

Quick Start
-----------
    docker build -t chinadns .

    docker run -p 53:53/udp -t -i chinadns
    
Ports to map

* **53/udp**: DNS
