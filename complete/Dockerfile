FROM eclipse-temurin:17-jdk-alpine
# This image contains the Ash shell rather than Bash
VOLUME /tmp
ARG JAR_FILE
# TODO: Consider hard-coding for the Gradle build
COPY ${JAR_FILE} /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

