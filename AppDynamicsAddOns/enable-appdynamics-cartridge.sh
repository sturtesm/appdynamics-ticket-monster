#!/bin/bash

rhc add-cartridge -a jbossticketmonster \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_HOST=jbugdemo.saas.appdynamics.com \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_PORT=443 \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_TIER_NAME=Tickets \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_SSL_ENABLED=true \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_APP_NAME=OpenShiftTicketMonster \
-c https://raw.githubusercontent.com/Appdynamics/openshift-appdynamics-jboss-cartridge/master/metadata/manifest.yml

