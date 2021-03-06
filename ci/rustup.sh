#!/bin/sh
# Use rustup to locally run the same suite of tests as .travis.yml.
# (You should first install/update 1.15.0, stable, beta, and nightly.)

set -ex

export TRAVIS_RUST_VERSION
for TRAVIS_RUST_VERSION in 1.15.0 1.20.0 1.25.0 stable beta nightly; do
    run="rustup run $TRAVIS_RUST_VERSION"
    $run cargo build --verbose
    $run $PWD/ci/test_full.sh
done
