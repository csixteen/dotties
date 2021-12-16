#!/usr/bin/env bash
export PATH="/home/me/.cargo/bin:$PATH"

STABLE=/home/me/.rustup/toolchains/stable-x86_64-unknown-linux-gnu
rustup toolchain link build-stable $STABLE
rustup default build-stable > /dev/null 2>&1
