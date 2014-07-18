#!/bin/bash

rhc add-cartridge -a jbossticketmonster \
-e APPDYNAMICS_CONTROLLER_HOST_NAME=stevetest.saas.appdynamics.com \
-e APPDYNAMICS_CONTROLLER_PORT=443 \
-e APPDYNAMICS_AGENT_TIER_NAME=Tickets \
-e APPDYNAMICS_CONTROLLER_SSL_ENABLED=true \
-e APPDYNAMICS_AGENT_ACCOUNT_NAME=stevetest \
-e APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=413540496769 \
-c https://raw.githubusercontent.com/Appdynamics/openshift-appdynamics-jboss-cartridge/master/metadata/manifest.yml

