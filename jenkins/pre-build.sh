#!/bin/bash

isResetID=false
cmpFlag=1
packageJsonChange=false

npm config set registry https://registry.npm.taobao.org

cd /opt/nodeapp/growable

npm install

#node app.js
pm2 start app.js --name test-app -i 1
