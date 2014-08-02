#!/bin/sh

BASEDIR=`dirname $0`

source ${BASEDIR}/env.sh

rhc cartridge-remove appdynamics-jboss-cart -a $OPENSHIFT_APP_NAME
