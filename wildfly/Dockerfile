FROM jboss/wildfly:18.0.1.Final
#RUN yum install -y xorg-x11-fonts-75dpi xorg-x11-fonts-Type1 openssl git-core fontconfig
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#70365 --silent
EXPOSE 8080
EXPOSE 9990
EXPOSE 8787
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/com/mysql/main
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/com/oracle/main
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/org/jboss/as/console/main
RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/org/eclipse/persistence/main
COPY mysql/module.xml mysql/mysql-connector-java-8.0.19.jar /opt/jboss/wildfly/modules/system/layers/base/com/mysql/main/
COPY oracle/module.xml oracle/ojdbc11.jar /opt/jboss/wildfly/modules/system/layers/base/com/oracle/main/
COPY console/module.xml console/hal-console-3.2.4.Final-resources.jar /opt/jboss/wildfly/modules/system/layers/base/org/jboss/as/console/main/
COPY eclipselink/module.xml eclipselink/eclipselink.jar /opt/jboss/wildfly/modules/system/layers/base/org/eclipse/persistence/main/
COPY *.ear /opt/jboss/wildfly/standalone/deployments/
RUN rm /opt/jboss/wildfly/modules/system/layers/base/org/jboss/as/console/main/hal-console-3.2.1.Final-resources.jar
COPY standalone.xml standalone-full.xml /opt/jboss/wildfly/standalone/configuration/
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-full.xml", "--debug", "*:8787"]
