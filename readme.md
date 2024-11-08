# Luckycoin node

## Prerequisites Docker
1. Use ubuntu linux or a similar distribution
2. Install luckycoin node and have it fully synced (recommanded way is [run a luckycoin node inside a docker container](https://github.com/toregua/luckycoin-node))
3. Install docker and docker-compose (Ubuntu)[https://docs.docker.com/engine/install/ubuntu/]
4. Clone this repository using git clone
5. Navigate inside the cloned repository folder (luckycoin-node)

## Config
fit luckycoin.conf for your need

Important parameters are the following : 

`txindex` must be set to 1 to have all transactions details with scripSign information

`rpcuser`, `rpcpassword` & `rpcport` are defining your rpc configuration (http://user:pass@127.0.0.1:22555 for example)

`rpcworkqueue` define the number of working queues (depending on your host machine performance)

`rpcbind` bind to given address to listen for JSON-RPC connections.

`rpcallowip` idealy set your server IP here (if you want to have a public node you have to set 0.0.0.0/0 but you will be expose to node attacks)

`printtoconsole` this parameter help you a lot with docker to redirect the output to console (i recommand to enable it)

To help node sync you can add specific nodes manually like these ones : 

```shell
addnode=luckysync.opnet.org:9917
addnode=193.22.147.155:9917
addnode=172.65.183.105:9917
addnode=5.199.168.186:9917
addnode=165.227.235.102:9917
addnode=51.161.118.103:9917
addnode=15.204.163.34:9917
addnode=37.27.187.91:9917
addnode=jxh55v6tmxb6zizn3asy7sh3q2yxuomvesrrq3xamce6vf3itsvb3zid.onion:9917
addnode=192.210.234.108:9917
addnode=167.99.2.144:9917
addnode=49.12.65.88:9917
addnode=185.106.96.215:9917
```

## Usage
Just run

```shell
    docker-compose up -d
```
## Logs
```shell
    docker-compose logs -f --tail 200
```

Wait until you see log like this : 
```shell
luckycoin-node_1  | 2024-11-08 15:02:57 UpdateTip: new best=4a77fa4e5a7b8e06847f1da47181685284642eac366c4730b808e686d669ce65 height=173484 version=0x20130004 log2_work=67.340335 tx=479399 date='2024-11-08 15:02:55' progress=1.000000 cache=0.0MiB(101tx)
```

A progress with 1.000000 mean 100% synced