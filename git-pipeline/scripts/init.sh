#!/usr/bin/env bash

set -e

echo "*** Initializing WASM build environment"

rustup install nightly-2020-10-06

rustup target add wasm32-unknown-unknown --toolchain nightly-2020-10-06
