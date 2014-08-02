#!/bin/sh

BASEDIR=`dirname $0`

source ${BASEDIR}/env.sh

rhc app stop $OPENSHIFT_APP_NAME
