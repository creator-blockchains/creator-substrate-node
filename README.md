# Substrate Creatorchain Node Template

A [FRAME](https://substrate.dev/docs/en/next/conceptual/runtime/frame)-based
[Substrate](https://substrate.dev/en/) node with the Ethereum RPC support, ready for hacking
:rocket:

## Generation & Upstream

This template is maintained in the
[Frontier](https://github.com/paritytech/frontier/tree/master/template) project repository, and can
be used to generate a stand-alone template for use in an independent project via the included
[template generation script](https://github.com/paritytech/frontier/blob/master/docs/node-template-release.md).

A ready-to-use template generated this way is hosted for each Frontier release on the
[creator-blockchains/creator-substrate-node](https://github.com/creator-blockchains/creator-substrate-node)
repository.

This template was originally forked from the
[Substrate Node Template](https://github.com/substrate-developer-hub/substrate-node-template). You
can find more information on features on this template there, and more detailed usage on the
[Substrate Developer Hub Tutorials](https://substrate.dev/tutorials/) that use this heavily.

## Build & Run

To build the chain, execute the following commands from the project root:

```
$ cargo build --release
```

To execute the chain, run:

```
$ ./target/debug/creatorchain-node --dev
```

The node also supports to use manual seal (to produce block manually through RPC).  
This is also used by the ts-tests:

```
$ ./target/debug/creatorchain-node --dev --manual-seal
```