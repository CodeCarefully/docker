#!/bin/sh -e
COMMIT=$(cat commit)
cd freeswitch && git reset --hard a5cecbfc2a5e0ea2d3f45489f2681a67e32ce955
