FROM eclipse-temurin:20-jre-alpine
# This image contains the Ash shell rather than Bash

RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

VOLUME /tmp
ARG JAR_FILE
# TODO: Consider hard-coding for the Gradle build
COPY ${JAR_FILE} /app.jar
RUN chmod a+rx /app.jar

USER nonroot
ENTRYPOINT ["java", "-jar", "/app.jar"]

# TODO: Consider building an image from scratch
# TODO: Consider using JLink to build a custom JRE distribution
# TODO: Consider unpacking the fat JAR
# TODO: Consider using the Spring Boot Layer Index
# TODO: Consider using the Spring Boot JarLauncher
# TODO: Consider a multi-stage Docker build
# TODO: Consider using Earthly to create the multi-stage Docker build
# TODO: Consider activating Docker experimental features
# TODO: Consider using the Spring Boot plugin for Gradle
# TODO: Consider using the Palantir Gradle plugin
# TODO: Consider using the Jib Gradle plugin
# TODO: Consider using a buildpack
# TODO: Consider using Knative Build

