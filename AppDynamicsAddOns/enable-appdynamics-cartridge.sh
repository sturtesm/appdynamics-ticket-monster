#!/bin/bash

rhc add-cartridge -a jbossticketmonster \
-e APPDYNAMICS_CONTROLLER_HOST_NAME=jbugdemo.saas.appdynamics.com \
-e APPDYNAMICS_AGENT_ACCOUNT_NAME=jbugdemo \
-e APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=6cc1cd9d4d66 \
-e APPDYNAMICS_CONTROLLER_PORT=443 \
-e APPDYNAMICS_AGENT_TIER_NAME=Tickets \
-e APPDYNAMICS_CONTROLLER_SSL_ENABLED=true \
-e OPENSHIFT_APPD_JAVA_CONTROLLER_APP_NAME=OpenShiftTicketMonster \
-c https://raw.githubusercontent.com/Appdynamics/openshift-appdynamics-jboss-cartridge/master/metadata/manifest.yml

