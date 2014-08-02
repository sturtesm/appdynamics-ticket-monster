#!/bin/sh

BASEDIR=`dirname $0`

source ${BASEDIR}/env.sh

rhc app start $OPENSHIFT_APP_NAME
