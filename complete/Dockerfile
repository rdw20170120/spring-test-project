FROM eclipse-temurin:20-jre-alpine
# This image contains the Ash shell rather than Bash

# Add a non-root user so that we can run the container without superuser privileges
RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

VOLUME /tmp

# Grab the application from the Gradle build output
COPY ./build/libs/rest-service-0.0.1-SNAPSHOT.jar /app.jar
# Allow the non-root user to execute the application
RUN chmod a+rx /app.jar

# Run the application without superuser privileges
USER nonroot
ENTRYPOINT ["java", "-jar", "/app.jar"]

# TODO: Consider a multi-stage Docker build
# TODO: Consider activating Docker experimental features
# TODO: Consider building an image from scratch
# TODO: Consider passing `docker run` command-line parameters to the ENTRYPOINT
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
# TODO: Consider using a different base for the Docker image (not Alpine Linux)
# TODO: Consider using a shell script as the container ENTRYPOINT

