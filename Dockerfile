FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 && \
    apt-get install -y libssl-dev libevent-dev libboost-all-dev && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN apt-get install -y git && \
    git clone https://github.com/luckycoin-community/luckycoin.git /usr/src/luckycoin

WORKDIR /usr/src/luckycoin

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install

COPY luckycoin.conf /root/.luckycoin/luckycoin.conf

EXPOSE 22555

CMD ["luckycoind", "-daemon", "-conf=/root/.luckycoin/luckycoin.conf", "-datadir=/root/.luckycoin"]
