#!/bin/bash
cd ~/workspace/hedgedoc-labwork/src
export PATH=~/workspace/hedgedoc-labwork/node/bin:$PATH
export NODE_ENV=production
export CMD_DOMAIN=localhost
export CMD_HOST=127.0.0.1
export CMD_PORT=18081
export CMD_URL_ADDPORT=true
export CMD_PROTOCOL_USESSL=false
export CMD_DB_URL="sqlite:///home/hatch/workspace/hedgedoc-labwork/db/hedgedoc.sqlite"
export CMD_SESSION_SECRET="lab-only-secret-not-a-real-one"
exec node app.js
