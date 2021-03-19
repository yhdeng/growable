#!/bin/bash

isResetID=false
cmpFlag=1
packageJsonChange=false

npm config set registry https://registry.npm.taobao.org

npm install

node app.js
