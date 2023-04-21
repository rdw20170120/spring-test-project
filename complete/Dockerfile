FROM eclipse-temurin:20-jre-alpine
# This image contains the Ash shell rather than Bash

RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

VOLUME /tmp

COPY ./build/libs/rest-service-0.0.1-SNAPSHOT.jar /app.jar
RUN chmod a+rx /app.jar

USER nonroot
ENTRYPOINT ["java", "-jar", "/app.jar"]

# TODO: Consider a multi-stage Docker build
# TODO: Consider activating Docker experimental features
# TODO: Consider building an image from scratch
# TODO: Consider unpacking the fat JAR
# TODO: Consider using Earthly to create the multi-stage Docker build
# TODO: Consider using JLink to build a custom JRE distribution
# TODO: Consider using Jib Gradle plugin
# TODO: Consider using Knative Build
# TODO: Consider using Palantir Gradle plugin
# TODO: Consider using Spring Boot JarLauncher
# TODO: Consider using Spring Boot Layer Index
# TODO: Consider using Spring Boot plugin for Gradle
# TODO: Consider using a buildpack

