#!/bin/bash
#
#Author: atrandys
#
#
WORKDIR=/opt/take_notes/
build() {
  cd $WORKDIR
  gitbook install
  gitbook build
}

start() {
  pid=`ps aux | grep gitbook | grep -v grep | awk '{print $2}'`
  if [ -n "$pid" ]; then
    "gitbook is running"
    exit 1
  fi
  cd $WORKDIR
  `gitbook serve >/dev/null 2>&1 &`
}
stop() {
  `ps aux | grep gitbook | grep -v grep | awk '{print $2}' | xargs kill`
}

restart() {
  stop
  start
}

build
start