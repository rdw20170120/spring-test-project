# Produce results of a security scan of the Docker image
Follow these steps:

1. Login to Docker: `docker login`
1. Scan the Docker image with:
    ```
    docker scan \
        --dependency-tree \
        --file Dockerfile \
        --group-issues \
        --json \
        --token TOKEN \
        robatdocker/myapp
    ```
   But this fails because it requires a third-party license with Snyk.
1. Push the Docker image to Docker Hub: `docker push robatdocker/myapp`
    ```
    Using default tag: latest
    The push refers to repository [docker.io/robatdocker/myapp]
    1585c4d619b9: Layer already exists
    220b3ac55bbb: Layer already exists
    2c2c728ae757: Layer already exists
    d06cffc969da: Layer already exists
    e3f8a773cc44: Layer already exists
    e685d148e38b: Layer already exists
    f1417ff83b31: Layer already exists
    latest: digest: sha256:9d76418aead7dcef91e22388c10063f577903802063ee7ac358b7ed63737bd9e size: 1791
    ```
1. Create account with Snyk
1. Integrate Snyk with Docker Hub
1. Import Docker image from Docker Hub into Snyk
1. Wait for Snyk to scan image
1. Commit [security scan logs](./security_scan)

# Scan project in GitHub using available integrations
Follow these steps:

1. Add [Codacy security scan configuration](../.github/workflows/codacy.yml)
1. Add [CodeQL security scan configuration](../.github/workflows/codeql.yml)
1. Wait for GitHub Actions to execute the security scans
1. Download security scan logs from GitHub to local workstation
1. Commit [security scan logs](./security_scan)

