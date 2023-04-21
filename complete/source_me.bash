#!/usr/bin/false
# Configure the current Bash shell for this application
# Invoke in a Bash shell as `source source_me.bash`

if [[ -z "${PathOriginal}" ]] ; then
    export PathOriginal=${PATH}
    export PATH=~/.docker/bin:${PathOriginal}
fi

alias app-call='curl localhost:8080/greeting'
alias container-run='docker run -p 8080:8080 myorg/myapp'
alias container-shell='docker run -ti --entrypoint /bin/sh myorg/myapp'
alias gradle-app='./gradlew bootRun'
alias gradle-jar='./gradlew build'
alias image-build='docker build -t myorg/myapp .'

