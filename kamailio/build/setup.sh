#!/bin/sh
COMMIT=$(cat /root/commit)

git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-configs.git kazoo-configs
git clone --depth 1 --no-single-branch https://github.com/kamailio/kamailio.git kamailio

cd kamailio
git checkout $COMMIT
