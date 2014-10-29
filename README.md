# What is this?

This is a fork of the Git repository for all things TicketMonster, a showcase application for [JBoss Developer Framework](http://jboss.org/jdf).

This project includes helper scripts that demonstrate enabling the AppDynamics Cartridge on an  JBoss project deployed in OpenShift.

## What do I need?
The <a href="http://community.appdynamics.com/t5/AppDynamics-eXchange/Openshift-JBoss-Cartridge/idi-p/8982">AppDynamics OpenShift Cartridge</a> seamlessly enables AppDynamics monitoring on an JBoss EAP, WS or AS7 Gear in OpenShift.  This repository provides a pre-built application - **Ticket Monster** - that can be easily deployed in OpenShift, and monitored with the AppDynamics Agent.

To run these this example, you need:

   * An account in OpenShift
   * An application leveraging JBoss EAP, AS7 or WS
      * The application can optionally be scalable, or not
   * An AppDynamics Controller accessible by the Agent; e.g. the Agent needs to be able to open an HTTP Connection from the OpenShift Cartridge to the Controller to pass performance data.
      * We recommended leveraging a  <a href="www.appdynamics.com/freetrial">free SAAS trial of AppDynamics<a>.

## What can you find here?

The content of the underlying directories is as follows:

* `demo` - the sources of TicketMonster application - you can build and run it! Follow the [instructions](https://github.com/jboss-jdf/ticket-monster/blob/master/demo/README.md). Or you can see it at work [here](http://ticketmonster-jdf.rhcloud.com). 
* `dist` - utility scripts for versioning and release
* `tutorial` - the sources of the TicketMonster tutorial, which describe how it works, how it's designed, and outlines a series of steps for *you* to build it. The tutorial is available in built form [here](http://www.jboss.org/jdf/examples/get-started/).
* `AppDynamicsAddOns` - Helper scripts for adding the AppDynamics cartridge and simple wrappers for common RHC commands.

## Updating the HA Proxy Configuration
The ticket-monster application **${REPO_HOME}/deployments/ticket-monster.war** does not redirect home page traffic to the correct context root, and therefore on startup the HA Proxy Determines the underling application is not available.  You can add an index page to redirect JBoss to the context root, but I've gotten in the habit of updating the HA Proxy Configuration to status the application on its expected page.

Here's what you need to do....

   * SSH Into Your OpenShift Gear; e.g. `ssh 53d15588e0b8cd0d480005ae@jbosstickets-appdynamicsjbug.rhcloud.com`
   * Find, and Edit the HA Proxy Configuration; e.g. `vim ${OPENSHIFT_HAPROXY_DIR}/haproxy/conf/haproxy.cfg`
   * Add a new configuration that updates the http check to the correct context root.  Note the configuration you need to add is `option httpchk /ticket-monster`.  This will look something like:
   
		listen express 127.7.29.2:8080
			...
			option httpchk GET /ticket-monster/
    		...
    		
	* Restart the Gear; e.g. from outside the Gear run `rhc app restart ${OPENSHIFT_APP_NAME}`
   
   
## Helper Scripts
Helper scripts live in **${REPO_HOME}/AppDynamicsAddOns/**.  Make sure to update env.sh and set the correct Application Name.  This should map to your application name in OpenShift, and will be fed to all wrapped rhc commands including the command to enable the AppDynamics Cartridge.

## Enabling the AppDynamics Cartridge
Update **${REPO_HOME}/AppDynamicsAddOns/enable-appdynamics-cartridge.sh** with the correct parameters, see <a href="http://community.appdynamics.com/t5/AppDynamics-eXchange/Openshift-JBoss-Cartridge/idi-p/8982">AppDynamics OpenShift Cartridge</a> for details.

## Running the JMeter Script 
A JMeter script is available - **${REPO_HOME}/AppDynamicsAddOns/TicketMonsterPerfTest.jmx - to generate load against your environment.  You will need to update the request defaults to set the proper Server Name; e.g. change `jbosstickets-appdynamicsjbug.rhcloud.com/ticket-monster`.

The script generates a mixture of good and bad transaction requests.

### JMeter Plugins Needed
The JMeter script leverages plugins provided in the **Standard Set** of the <a href="http://jmeter-plugins.org/?utm_source=jpgc&utm_medium=link&utm_campaign=main">JMeter Customer Plugins</a> project.

# Contact
Contact <a href="mailto:steve.sturtevant@appdynamics">steve.sturtevant@appdynamics.com</a> with any questions.




