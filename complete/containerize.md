# Create a Docker image hosting the application
Follow these steps:

1. Create an executable JAR: `./gradlew build`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. This creates `./build/libs/rest-service-0.0.1-SNAPSHOT.jar`
1. Write [Dockerfile](./Dockerfile)
1. Build the image with: `docker build -t robatdocker/myapp .`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. That fails, so install Docker Desktop.
1. Try to build the image again with: `docker build -t robatdocker/myapp .`
1. That still fails, so find Docker. 
1. Assume Docker is accessible within the user account: `find ~ -name docker`
    ```
    /Users/rob/.docker/bin/docker
    ```
1. Add Docker to the execution PATH: `export PATH=~/.docker/bin:$PATH`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Try to build the image again with: `docker build -t robatdocker/myapp .`
1. Success!  Check Docker Desktop for the image.
1. Start a container with: `docker run -p 8080:8080 robatdocker/myapp`

   which took over that shell (as a running process).

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Open another terminal shell (Bash) and execute: `curl localhost:8080/greeting`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. This command executes the RESTful service running inside the container:
    ```
    {"id":1,"content":"Hello, World!"}
    ```
1. Peek into the running container: `docker exec -ti NAME /bin/sh`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Stop peeking into the running container: `exit`
1. Kill (Ctrl-C) the process to stop the Docker container.
1. Open a shell on a new container with: `docker run -ti --entrypoint /bin/sh robatdocker/myapp`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Stop the container: `exit`

