#!/bin/bash
#
#Author: atrandys
#
#
WORKDIR=/opt/take_notes/
function build() {
  cd $WORKDIR
  gitbook install
  gitbook build
}

function red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}

function start() {
  pid=`ps aux | grep gitbook | grep -v grep | awk '{print $2}'`
  if [ -n "$pid" ]; then
    red "gitbook is running"
    exit 1
  fi
  cd $WORKDIR
  `gitbook serve >/dev/null 2>&1 &`
}
function stop() {
  `ps aux | grep gitbook | grep -v grep | awk '{print $2}' | xargs kill`
}

function restart() {
  stop
  start
}

build
restart