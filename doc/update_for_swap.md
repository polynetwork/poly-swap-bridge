# 升级支持Swap

## 升级测试网

### build

#### 更新poly_bridge

[代码目录](https://github.com/polynetwork/poly-bridge)

进入到poly_bridge项目目录。

编译测试网版本：
```
./build.sh testnet
```

生成build_testnet为测试网执行文件以及配置。

#### 更新poly_swap

[代码目录](https://github.com/polynetwork/poly-swap-bridge)

进入到poly_swap项目目录。

编译测试网版本：
```
./build.sh testnet
```

生成build_testnet为测试网执行文件以及配置。

#### 升级数据库

进入到poly_swap程序目录。

配置升级文件 [config_deploy_testenet.json](https://github.com/polynetwork/poly-swap-bridge/blob/main/bridge_tools/conf/config_deploy_testnet.json)

```
cd build_swap_testnet
cd swap_tools
./swap_tools --cliconfig config_deploy_testenet.json --cmd 1
```

#### 升级poly_bridge

更新配置文件 [config_testnet.json](https://github.com/polynetwork/poly-bridge/blob/master/conf/config_testnet.json)

进入到poly_bridge程序目录。
```
cd build_bridge_testnet
cd bridge_server
vi ./config_testnet.json
```
重启bridge_server。

#### 部署poly_swap

poly_swap配置文件[config_testnet.json](https://github.com/polynetwork/poly-swap-bridge/blob/main/conf/config_testnet.json)

进入到poly_swap程序目录。
```
cd build_swap_testnet
cd swap_server
./swap_server --cliconfig config_testnet.json
```
