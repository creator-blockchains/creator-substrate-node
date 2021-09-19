# Launch 1 bootnode - 2 validator

- 1.Generate accounts (you can configure accounts amount in [.env](./generate-accounts/.env) file):
  ```sh
  docker-compose --env-file ./git-pipeline/configs/.env.config up -d generate_accounts
  ```
  - This will create two folder `accounts` and `keys`.

- 2.Use **./accounts/public** to update the chainSpec file.
  - Copy `Validator 0-1 controller sr` for *palletAura*
  - Copy `Validator 0-1 controller ed` for *palletGrandpa*
  - Paste them into `palletAura > authorities` and `palletGrandpa > authorities`

- 3.Generate `custom-spec-raw.json` file from above `custom-spec.json` file:
  ```sh
  docker-compose --env-file ./git-pipeline/configs/.env.config up create_raw_chain_spec
  ```

- 4.Start `1 bootnode - 2 validator` and confirm Nodes are up and running.
  ```sh
  # bootnode
  docker-compose --env-file ./git-pipeline/configs/.env.config up boot_node
  # validator
  docker-compose --env-file ./git-pipeline/configs/.env.config up peer_node
  ```
  - Once your node is running, you will again notice that no blocks are being produced. At this point, you need to add your keys into the keystore. Remember you will need to complete these steps for each node in your network

- 5.Update Nodes IPs in [insert-keys.sh](./scripts/insert-keys.sh).

- 6.Insert keys by running the following command:
  ```sh
  ./scripts/insert-keys.sh
  ```

- 7.Done. Go to `block-explorer` check for block is being produced.

# Reference
- https://substrate.dev/docs/en/tutorials/start-a-private-network/customchain#add-keys-to-keystore
- https://github.com/paritytech/substrate/issues/5078
