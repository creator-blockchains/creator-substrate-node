#!/bin/bash

# pull
docker pull creatorchainnetwork/node:latest
# run
docker-compose up -d testnet_node substrate --dev --ws-port 9944 --rpc-methods=Unsafe --ws-external --unsafe-ws-external --rpc-cors all --rpc-external
