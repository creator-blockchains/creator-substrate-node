#!/bin/bash

# add -d to detach
docker-compose --env-file ../configs/.env.config up testnet_node
