# Rob Williams' notes
For technical interview exercise from Foster Moore.

Consider these factors:
* Dockerfile best practices
  * run time use
  * image size
  * minimizing attack footprint (exclude unnecessary packages)
* Network Ingress limitation
* Pod Service Account

## Part 1
1. [Compile the example Spring Boot application](./compiling.md)
1. Create a Docker image hosting the application
1. Deploy the application within Kubernetes
1. Add a Kubernetes Service to route traffic
1. Add a Kubernetes NetworkPolicy to limit the inbound traffic

## Part 2
1. Produce a software BoM (as text or CSV)
1. Produce results of a security scan of the Docker image (using tool of choice)

## Post results
1. Checkin these deliverables:
   * Dockerfile
   * Kubernetes deployment
   * software BoM
   * security scan results
1. Create a Pull Request (PR) back to the source repository

