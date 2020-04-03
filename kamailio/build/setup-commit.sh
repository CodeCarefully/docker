#!/bin/sh -e
COMMIT=$(cat /root/commit)
cd kamailio && git reset --hard fb75e90549a2ed901d15842c6d621ad7d0850106
