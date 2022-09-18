#!/bin/bash

set -e
set -o pipefail

if [ -z "$1" ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

tag="$1"
filename=WalletCore.doccarchive.zip

mkdir -p build && pushd build

rm -rf ${filename}

curl -fSsOL https://github.com/trustwallet/wallet-core/releases/download/${tag}/${filename}

unzip -q ${filename}

popd
