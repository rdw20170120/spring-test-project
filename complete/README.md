# Rob Williams' notes
To complete this interview exercise,
I followed these steps:
1. I forked the [source repository](https://github.com/mikee/spring-test-project).
1. I opened a terminal shell (Bash).
1. I cloned that fork to my laptop.
1. I navigated to the root of the forked repository clone.
1. I created a new branch:  `git checkout -b Rob`
1. I navigated to this `complete` subdirectory.
1. I invoked the build:  `./gradlew bootRun`
   based on instructions [here](https://spring.io/guides/gs/spring-boot/).
1. That failed with this error:

> The operation couldn’t be completed. Unable to locate a Java Runtime.
> Please visit http://www.java.com for information on installing Java.

1. I installed a Java JDK using Homebrew:  `brew install oracle-jdk`
1. Rerunning the build:  `./gradlew bootRun`
   then failed with this error message:

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
   the latest Gradle 7.4.2 installed by the Gradle wrapper
   is not compatible with
   the latest Oracle JDK 20 installed by Homebrew.
   Instead, Gradle 7.4.2 runs with JDK versions 8 through 19.
   However,
   Homebrew does not provide
   any earlier version of Oracle JDK.
   Therefore,
   I resorted to installing
   a compatible version of OpenJDK instead.
1. I installed an OpenJDK using Homebrew:  `brew install openjdk@17`
   The installation script
   warned that this JDK
   was not automatically linked into the execution PATH
   since it is an alternate version of another formula.
   To use this JDK, it recommends adding
   `/usr/local/opt/openjdk@17/bin`
   to the execution PATH.
   It also warned that compilers and the system will not automatically find this version.
1. Rerunning the build:  `./gradlew bootRun`
   then failed again with this error message:

> The operation couldn’t be completed. Unable to locate a Java Runtime.
> Please visit http://www.java.com for information on installing Java.

   which demonstrates that the OpenJDK could not be found.
1. I executed this to add OpenJDK to the PATH:
    `export PATH=/usr/local/opt/openjdk@17/bin:$PATH`
1. Then I reran the build:  `./gradlew bootRun`
   This time Gradle was able to build,
   then startup Tomcat
   which took over that shell (as a running process).
1. So I opened another terminal shell (Bash) and executed: `curl localhost:8080`
   This command is supposed to execute the RESTful service,
   but instead it returns an error:

> {"timestamp":"TIMESTAMP","status":404,"error":"Not Found","path":"/"}

   which confirms that the RESTful service does not exist yet.

