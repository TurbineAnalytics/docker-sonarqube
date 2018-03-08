FROM openjdk:8-alpine

ENV SONAR_VERSION=6.7.1 \
    SONAR_SCALA_VERSION=0.0.3 \
    SONAR_SCAPEGOAT_VERSION=1.3.0 \
    SONARQUBE_HOME=/opt/sonarqube \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL=

# Http port
EXPOSE 9000

RUN addgroup -S sonarqube && adduser -S -G sonarqube sonarqube

RUN set -x \
    && apk add --no-cache gnupg unzip \
    && apk add --no-cache libressl wget \
    && apk add --no-cache su-exec \
    && apk add --no-cache bash \

    # pub   2048R/D26468DE 2015-05-25
    #       Key fingerprint = F118 2E81 C792 9289 21DB  CAB4 CFCA 4A29 D264 68DE
    # uid                  sonarsource_deployer (Sonarsource Deployer) <infra@sonarsource.com>
    # sub   2048R/06855C1D 2015-05-25
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE \

    && mkdir /opt \
    && cd /opt \
    && wget -O sonarqube.zip --no-verbose https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip \
    && wget -O sonarqube.zip.asc --no-verbose https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc \
    && wget https://github.com/Sagacify/sonar-scala/releases/download/v$SONAR_SCALA_VERSION/sonar-scala-plugin-$SONAR_SCALA_VERSION.jar \
    && wget https://github.com/arthepsy/sonar-scala-extra/releases/download/v$SONAR_SCAPEGOAT_VERSION/sonar-scapegoat-plugin-$SONAR_SCAPEGOAT_VERSION.jar \
    && gpg --batch --verify sonarqube.zip.asc sonarqube.zip \
    && unzip sonarqube.zip \
    && mv sonarqube-$SONAR_VERSION sonarqube \
    && mv sonar-scala-plugin-$SONAR_SCALA_VERSION.jar /opt/sonarqube/extensions/plugins \
    && mv sonar-scapegoat-plugin-$SONAR_SCAPEGOAT_VERSION.jar /opt/sonarqube/extensions/plugins \
    && chown -R sonarqube:sonarqube sonarqube \
    && rm sonarqube.zip* \
    && rm -rf $SONARQUBE_HOME/bin/*

VOLUME "$SONARQUBE_HOME/data"

WORKDIR $SONARQUBE_HOME
COPY run.sh $SONARQUBE_HOME/bin/
ENTRYPOINT ["./bin/run.sh"]
