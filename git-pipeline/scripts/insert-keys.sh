#!/usr/bin/env bash

# bootnode "http://13.229.99.249:9933"
# only insert keys to validator nodes
NODE_URL=("http://18.141.222.214:9933" "http://13.213.58.52:9933")

for i in {0..1}
do
  echo ""
  echo ">> Index: ${i}"
  echo ">> Appling to URL: ${NODE_URL[$i]}"
  curl ${NODE_URL[$i]} -H "Content-Type:application/json;charset=utf-8" -d "@keys/node_${i}_stash_gran.json"
  curl ${NODE_URL[$i]} -H "Content-Type:application/json;charset=utf-8" -d "@keys/node_${i}_gran.json"
  curl ${NODE_URL[$i]} -H "Content-Type:application/json;charset=utf-8" -d "@keys/node_${i}_aura.json"
  curl ${NODE_URL[$i]} -H "Content-Type:application/json;charset=utf-8" -d "@keys/node_${i}_imol.json"
  curl ${NODE_URL[$i]} -H "Content-Type:application/json;charset=utf-8" -d "@keys/node_${i}_audi.json"
done
