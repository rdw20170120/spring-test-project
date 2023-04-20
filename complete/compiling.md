# Compile the example Spring Boot application
I followed these steps:
1. I forked the [source repository](https://github.com/mikee/spring-test-project).
1. I opened a terminal shell (Bash).
1. I cloned that fork to my laptop.
1. I navigated to the root of the forked repository clone.
1. I created a new branch:  `git checkout -b Rob`
1. I navigated to this `complete` subdirectory.
1. Based on instructions [here](https://spring.io/guides/gs/spring-boot/),
   I invoked the build:  `./gradlew bootRun`
1. That failed with this error:

    > The operation couldn’t be completed. Unable to locate a Java Runtime.
    > Please visit http://www.java.com for information on installing Java.

1. I installed a Java JDK using Homebrew:  `brew install oracle-jdk`
1. I reran the build:  `./gradlew bootRun`
1. That failed with this error:

    > FAILURE: Build failed with an exception.
    >
    > * Where:
    > Settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'
    >
    > * What went wrong:
    > Could not compile settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'.
    >
    > \> startup failed:
    >   General error during conversion: Unsupported class file major version 64
    >
    >   java.lang.IllegalArgumentException: Unsupported class file major version 64

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
   I resorted to installing
   a compatible version of OpenJDK instead.
1. I uninstalled the Oracle JDK:  `brew uninstall oracle-jdk`
1. I installed an OpenJDK using Homebrew:  `brew install openjdk@17`

   The installation script
   warned that this JDK
   was not automatically linked into the execution PATH
   since it is an alternate version of another formula.
   To use this JDK, it recommends adding
   `/usr/local/opt/openjdk@17/bin`
   to the execution PATH.
   It also warned that compilers and the system will not automatically find this version.
1. I reran the build:  `./gradlew bootRun`
1. That failed again with this error message:

    > The operation couldn’t be completed. Unable to locate a Java Runtime.
    > Please visit http://www.java.com for information on installing Java.

   which demonstrates that the OpenJDK could not be found.
1. I executed this to add OpenJDK to the PATH:
    `export PATH=/usr/local/opt/openjdk@17/bin:$PATH`
1. I reran the build:  `./gradlew bootRun`
1. This time Gradle was able to build,
   then start up Tomcat
   which took over that shell (as a running process).
1. So I opened another terminal shell (Bash) and executed: `curl localhost:8080/greeting`
1. This command executes the RESTful service:

    > {"id":1,"content":"Hello, World!"}

1. I killed (Ctrl-C) the process to stop Tomcat.
1. As I continued to research,
   I discovered that
   Gradle 7.4.2 is NOT the latest version,
   but 8.1 is instead.
   The Gradle wrapper
   remembers the configured version of Gradle
   but it can be updated.
1. So I updated to the latest Gradle with
   `./gradlew wrapper --gradle-version=8.1 --distribution-type=bin`
1. I reran the build:  `./gradlew bootRun`
1. This triggered the installation of the latest Gradle
   which included a release note
   that it now works with Oracle JDK 20!
   This encouraged me to reinstall the Oracle JDK.
1. I killed (Ctrl-C) the process to stop Tomcat.
1. I uninstalled OpenJDK:  `brew uninstall openjdk@17`
1. I reinstalled the Oracle JDK:  `brew install oracle-jdk`
1. I closed the terminal in order to toss that shell environment.
1. I opened a terminal shell (Bash) for a fresh shell environment.
1. I navigated back to this `complete` subdirectory.
1. I reran the build:  `./gradlew bootRun`
1. The Gradle build was successful still, starting up Tomcat again.
1. In another terminal shell (Bash) I executed: `curl localhost:8080/greeting`
   which again successfully returned the proper response of

    > {"id":1,"content":"Hello, World!"}

1. Note that I did NOT need to add the JDK to the PATH this time.

