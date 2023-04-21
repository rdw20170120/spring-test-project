# Compile the example Spring Boot application
Follow these steps:

1. Fork [source repository](https://github.com/mikee/spring-test-project).
1. Open a terminal shell (Bash).
1. Clone that fork to the local workstation.
1. Navigate to the root of the forked repository clone.
1. Create a new branch: `git checkout -b Rob`
1. Navigate to this `complete` subdirectory.
1. Based on instructions [here](https://spring.io/guides/gs/spring-boot/),
   invoke Gradle to run the application: `./gradlew bootRun`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. That failed with this error:

    ```
    The operation couldn’t be completed. Unable to locate a Java Runtime.
    Please visit http://www.java.com for information on installing Java.
    ```

1. Install a Java JDK using Homebrew: `brew install oracle-jdk`
1. Rerun the application: `./gradlew bootRun`
1. That failed with this error:

    ```
    FAILURE: Build failed with an exception.

    * Where:
    Settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'
 
    * What went wrong:
    Could not compile settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'.

    > startup failed:
      General error during conversion: Unsupported class file major version 64
      java.lang.IllegalArgumentException: Unsupported class file major version 64
    ```

1. Research revealed that
   Gradle 7.4.2 used by the Gradle wrapper
   is not compatible with
   the latest Oracle JDK 20 installed by Homebrew.
   Instead, 
   Gradle 7.4.2 runs with
   JDK versions 8 through 19.
   However,
   Homebrew does not provide
   any earlier version of Oracle JDK.
   Therefore,
   resort to installing
   a compatible version of OpenJDK instead.
1. Uninstall the Oracle JDK: `brew uninstall oracle-jdk`
1. Install an OpenJDK using Homebrew: `brew install openjdk@17`

   The installation script
   warned that this JDK
   was not automatically linked into the execution PATH
   since it is an alternate version of another formula.
   To use this JDK, it recommends adding
   `/usr/local/opt/openjdk@17/bin`
   to the execution PATH.
   It also warned that compilers and the system will not automatically find this version.
1. Rerun the application: `./gradlew bootRun`
1. That failed again with this error message:

    ```
    The operation couldn’t be completed. Unable to locate a Java Runtime.
    Please visit http://www.java.com for information on installing Java.
    ```

   which demonstrates that the OpenJDK could not be found.
1. Execute this to add OpenJDK to the PATH:
   `export PATH=/usr/local/opt/openjdk@17/bin:$PATH`
1. Rerun the application: `./gradlew bootRun`
1. This time Gradle was able to build,
   then start up Tomcat
   which took over that shell (as a running process).
1. Open another terminal shell (Bash) and execute: `curl localhost:8080/greeting`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. This command executes the RESTful service:

    ```
    {"id":1,"content":"Hello, World!"}
    ```

1. Kill (Ctrl-C) the process to stop Tomcat.
1. As I continued to research,
   I discovered that
   Gradle 7.4.2 is NOT the latest version,
   but 8.1 is instead.
   The Gradle wrapper
   remembers the configured version of Gradle
   but it can be updated.
1. So update to the latest Gradle with
   `./gradlew wrapper --gradle-version=8.1 --distribution-type=bin`
1. Rerun the application: `./gradlew bootRun`
1. This triggered the installation of the latest Gradle
   which included a release note
   that it now works with Oracle JDK 20!
   This encouraged me to reinstall the Oracle JDK.
1. Kill (Ctrl-C) the process to stop Tomcat.
1. Uninstall OpenJDK: `brew uninstall openjdk@17`
1. Reinstall the Oracle JDK: `brew install oracle-jdk`
1. Close the terminal in order to toss that shell environment.
1. Open a terminal shell (Bash) for a fresh shell environment.
1. Navigate back to this `complete` subdirectory.
1. Rerun the application: `./gradlew bootRun`
1. The Gradle build was successful still, starting up Tomcat again.
1. In another terminal shell (Bash) execute: `curl localhost:8080/greeting`

   which again successfully returned the proper response of

    ```
    {"id":1,"content":"Hello, World!"}
    ```

1. Note that we did NOT need to add the JDK to the PATH this time.

