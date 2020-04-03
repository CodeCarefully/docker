#!/bin/sh -e

apt-get install apt-transport-https
echo "deb https://apache.bintray.com/couchdb-deb stretch main" | tee -a /etc/apt/sources.list
curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc | apt-key add -

## Kazoo buildtime dependencies
apt-get update
apt-get -y  install \
    build-essential libxslt-dev \
    zip unzip expat zlib1g-dev libssl-dev curl \
    libncurses5-dev git-core libexpat1-dev \
    python3-yaml python3-markdown python3-jsonschema python3-pip \
    python3-jsbeautifier \
    cpio mkdocs \
    couchdb \
    silversearcher-ag jq

## doc build target
pip3 install pyembed mkdocs-bootstrap mkdocs-bootswatch pymdown-extensions

## Kazoo runtime dependencies
apt-get install -y \
    htmldoc sox libsox-fmt-all ghostscript \
    imagemagick libtiff-tools openjdk-8-jre libreoffice-writer

## Linking couchjs so validate-js script can find it
ln -s /opt/couchdb/bin/couchjs /usr/bin/couchjs

apt-get -y clean
