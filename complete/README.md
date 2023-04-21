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
1. [Create a Docker image hosting the application](./containerize.md)
1. [Deploy the application within Kubernetes](./deploy.md)

## Part 2
1. [Produce a software BoM](./software_BoM.md)
1. [Produce results of a security scan of the Docker image](./security_scan.md)

## Post results
1. Checkin these deliverables:
   * Dockerfile
   * Kubernetes deployment
   * software BoM (as text or CSV)
   * security scan results
1. Create a Pull Request (PR) back to the source repository

## What I would still do to improve the deployment
* Add liveness and readiness probes
* Improve the Docker image (see comments in [`Dockerfile`](./Dockerfile)
* Productionize everything
* Run dynamic security scans against the deployment
* Strictly build the components separately
* Strictly compose the components using versioned and hashed references

