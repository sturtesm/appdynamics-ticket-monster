#!/bin/sh

BASEDIR=`dirname $0`

source ${BASEDIR}/env.sh

rhc app restart $OPENSHIFT_APP_NAME
