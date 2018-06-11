FROM    alpine:3.7

ENV     RUNDECK_VERSION=2.11.3
ENV     RDECK_BASE=/etc/rundeck
ENV     RDECK_JAR=$RDECK_BASE/app.jar
ENV     PATH=$PATH:$RDECK_BASE/tools/bin

ADD     http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-${RUNDECK_VERSION}.jar $RDECK_JAR
RUN     apk add --update openjdk8-jre bash curl ca-certificates && \
        rm -Rf /var/cache/apk/*

# Active Directory integration
COPY    jaas-activedirectory.conf $RDECK_BASE/server/config/jaas-activedirectory.conf

#rundeck launcher
COPY    run.sh /bin/rundeck

# logs
VOLUME  [ "$RDECK_BASE", "/var/lib/rundeck/.ssh", "$RDECK_BASE/server/logs" ]

CMD     rundeck
