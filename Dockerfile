FROM debian:latest

RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get install -y libssl-dev libevent-dev libboost-all-dev

RUN wget https://github.com/LuckyCoinProj/luckycoinV3/releases/download/v3.0.0/Node-v3.0.0-linux.zip -O /tmp/luckycoin.zip && \
    unzip /tmp/luckycoin.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/luckycoind /usr/local/bin/luckycoin-cli /usr/local/bin/luckycoin-tx && \
    rm /tmp/luckycoin.zip

RUN mkdir -p /root/.luckycoin
COPY luckycoin.conf /root/.luckycoin/luckycoin.conf

EXPOSE 22555

CMD ["luckycoind", "-conf=/root/.luckycoin/luckycoin.conf", "-datadir=/root/.luckycoin"]
