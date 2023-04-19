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

> * Where:
> Settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'

> * What went wrong:
> Could not compile settings file '/Users/rob/repo/GitHub/wip/spring-test-project/complete/settings.gradle'.
> > startup failed:
>   General error during conversion: Unsupported class file major version 64

>   java.lang.IllegalArgumentException: Unsupported class file major version 64

