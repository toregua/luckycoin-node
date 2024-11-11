FROM debian:latest

RUN apt-get update && \
    apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 && \
    apt-get install -y libssl-dev libevent-dev libboost-all-dev git

RUN git clone https://github.com/luckycoin-community/luckycoin.git /usr/src/luckycoin

RUN chmod -R +x /usr/src/luckycoin

WORKDIR /usr/src/luckycoin

RUN ./autogen.sh && \
    ./configure --disable-wallet && \
    make || { cat config.log; exit 1; } && \
    make install

RUN mkdir -p /root/.luckycoin
COPY luckycoin.conf /root/.luckycoin/luckycoin.conf

EXPOSE 22555

CMD ["luckycoind", "-conf=/root/.luckycoin/luckycoin.conf", "-datadir=/root/.luckycoin"]