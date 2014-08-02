#!/bin/sh

BASEDIR=`dirname $0`

source ${BASEDIR}/env.sh

rhc app show $OPENSHIFT_APP_NAME
