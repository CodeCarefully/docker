FROM kazoo/erlang
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override on run with --env option
ENV NETWORK=kazoo
ENV NODE_NAME=kazoo
ENV KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
ENV COUCHDB=couchdb.$NETWORK
ENV RABBITMQ=rabbitmq.$NETWORK

# override on build with --build-arg option
ARG REPO=https://github.com/2600hz/kazoo.git
ARG SKIP_BUILD
ARG BRANCH
ARG KZUID
ARG GID

USER root
RUN apt-get -y install python python3
# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen && locale-gen 

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.en
ENV LC_ALL en_US.UTF-8

RUN locale

USER user
COPY etc/commit /home/user/commit
COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/config.ini config.ini
COPY build/run.sh run.sh
ENTRYPOINT ./run.sh

ENV PATH $PATH:/home/user/bin
COPY build/sup bin/sup 

COPY build/cmd.sh ./cmd.sh

COPY build/setup_uid.sh build/setup_uid.sh
USER root
RUN build/setup_uid.sh
USER user

COPY etc/sys.config sys.config
COPY build/build.sh build/build.sh
RUN build/build.sh
