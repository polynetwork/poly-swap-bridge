#!/bin/bash

tag=$1
base=build_swap_${tag}

if [ ! -d "./$base" ]; then
  mkdir -p "./$base"
fi

if [ ! -d "./$base/swap_tools" ]; then
  mkdir -p "./$base/swap_tools"
fi

if [ ! -d "./$base/swap_server" ]; then
  mkdir -p "./$base/swap_server"
fi

cd ./bridge_tools
go build -tags $tag -o swap_tools .

mv swap_tools ./../$base/swap_tools
if [ "$tag"x = "mainnet"x ]
then
  cp ./conf/config_deploy_mainnet.json ./../$base/swap_tools
  cp ./conf/config_update_mainnet.json ./../$base/swap_tools
else
  cp ./conf/config_deploy_testnet.json ./../$base/swap_tools
  cp ./conf/config_update_testnet.json ./../$base/swap_tools
fi
cp ./conf/config_transactions.json ./../$base/swap_tools

cd ./../cmd
go build -tags $tag -o swap_server main.go

mv swap_server ./../$base/swap_server
if [ "$tag"x = "mainnet"x ]
then
  cp ./../conf/config_mainnet.json ./../$base/swap_server
else
  cp ./../conf/config_testnet.json ./../$base/swap_server
fi

cd ./../..


