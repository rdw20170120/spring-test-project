#!/usr/bin/false
# Configure the current Bash shell for this application
# Invoke in a Bash shell as `source source_me.bash`

if [[ -z "${PathOriginal}" ]] ; then
    export PathOriginal=${PATH}
    export PATH=~/.docker/bin:${PathOriginal}
fi

alias app-call-direct='curl localhost:8080/greeting'
alias app-call-k8s='curl localhost:30080/greeting'
alias container-run='docker run -p 8080:8080 myorg/myapp'
alias container-shell='docker run -ti --entrypoint /bin/sh myorg/myapp'
alias gradle-app='./gradlew bootRun'
alias gradle-bom='./gradlew cyclonedxBom'
alias gradle-jar='./gradlew build'
alias image-build='docker build -t myorg/myapp .'
alias k8s-deploy='kubectl apply -f deployment.yaml'
alias k8s-get-all='kubectl get all'
alias k8s-undeploy='kubectl delete -f deployment.yaml'

