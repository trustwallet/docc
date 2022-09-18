#!/bin/bash

url_base_path=docc
doccarchive_file=build/WalletCore.doccarchive
publish_branch=gh-pages

git worktree add ../${publish_branch} ${publish_branch}

$(xcrun --find docc) process-archive \
transform-for-static-hosting ${doccarchive_file} \
--output-path ../${publish_branch} \
--hosting-base-path ${url_base_path}

pushd ../${publish_branch}
git add . && git commit -m "Update docs"
git push
popd

git worktree remove ../${publish_branch}
