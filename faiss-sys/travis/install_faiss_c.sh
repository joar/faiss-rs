#!/bin/sh
repo_url=https://github.com/Enet4/faiss.git
repo_rev=9ff624fe4718061cc8eab0b5800d7844b349afef

git clone $repo_url faiss
cd faiss
git checkout -q $repo_rev

# Build
./configure

make libfaiss.a
cd c_api
make libfaiss_c.so
mkdir -p $HOME/.faiss_c
cp libfaiss_c.so $HOME/.faiss_c/

echo libfaiss_c.so installed in $HOME/.faiss_c/

cd ..

# clean up
rm -rf faiss
