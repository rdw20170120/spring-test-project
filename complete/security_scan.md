# Produce results of a security scan of the Docker image
Follow these steps:

1. Add [Codacy security scan configuration](../.github/workflows/codacy.yml)
1. Add [CodeQL security scan configuration](../.github/workflows/codeql.yml)
1. Wait for GitHub Actions to execute the security scans
1. Download security scan logs from GitHub to local workstation
1. Commit security scan logs to repository in `./security_scan`

TODO: Scan Docker image

