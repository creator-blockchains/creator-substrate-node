./target/release/creatorchain --prometheus-external --prometheus-port 9615 --node-key $(cat ./git-pipeline/spec-data/node.key) --chain git-pipeline/spec-data/custom-spec-raw.json --ws-port 9944 --ws-external --unsafe-ws-external --rpc-port 9933 --rpc-methods=Unsafe --rpc-cors=all --rpc-external ---base-path db/bootNode

./target/release/creatorchain --prometheus-external --prometheus-port 9616 --chain git-pipeline/spec-data/custom-spec-raw.json --bootnodes /ip4/0.0.0.0/tcp/30333/p2p/12D3KooWCgLBvVdaJp9bDcVyTRJXRujoQdZtChjXJrRs2aP2zGKW --validator --ws-port 9945 --ws-external --unsafe-ws-external --rpc-port 9934 --rpc-methods=Unsafe --rpc-cors=all --rpc-external --pruning=archive ---base-path db/node-1