# docker-js-ipfs

**js-ipfs running as a daemon on nodejs in a container.**

[js-ipfs](https://github.com/ipfs/js-ipfs) is the current implementation of IPFS in javascript.

### Ports

* `4002` - TCP listening port.
* `4003` - Websocket listening port.
* `5002` - HTTP API port.
* `9090` - IPFS Gateway port.
### Volumes

* Mount your .jsipfs data directory to /data/ipfs

## Getting started

####  Running with docker-compose

```bash
version: "3"
services:
  ipfs:
    image: js-ipfs:latest
    container_name: ipfs
    security_opt:
      - no-new-privileges:true
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - ./config/ipfs:/data/ipfs
    ports:
      - 5002:5002 # HTTP API
      - 9090:9090 # Gateway
    restart: unless-stopped
```


#### Commands
```bash
docker exec ipfs ipfs id
{
  "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "publicKey": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "addresses": [
    "/ip4/127.0.0.1/tcp/4002/p2p/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "/ip4/127.0.0.1/tcp/4003/ws/p2p/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "/ip4/172.23.0.2/tcp/4002/p2p/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  ],
  "agentVersion": "js-ipfs/0.17.1-a77e40cc.0",
  "protocolVersion": "ipfs/0.1.0",
  "protocols": [
    "/floodsub/1.0.0",
    "/ipfs/bitswap/1.0.0",
    "/ipfs/bitswap/1.1.0",
    "/ipfs/bitswap/1.2.0",
    "/ipfs/id/1.0.0",
    "/ipfs/id/push/1.0.0",
    "/ipfs/lan/kad/1.0.0",
    "/ipfs/ping/1.0.0",
    "/libp2p/circuit/relay/0.1.0",
    "/libp2p/fetch/0.0.1",
    "/meshsub/1.0.0",
    "/meshsub/1.1.0"
  ]
}
```

## WebUI

* The Web interface should be available at http://localhost:5002

## License

See [LICENSE]()

