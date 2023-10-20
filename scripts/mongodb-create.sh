#!/bin/bash

MONGO_PWD=$1

mongo --port 27017 -u admin -p $MONGO_PWD --authenticationDatabase admin <<EOF
use onprembot;
db.author.insert({ authorname: "RAVATAR" })
EOF
