# Actions

## Overview

This repository contains a collection of GitHub Actions designed to streamline and enhance my development workflow. The actions are organized into categories to address various aspects of software development, including source code quality, security, compliance, and release management.

## Actions Catalog

### Make-release

This action ensures the quality of the source code before generating a changelog and creating a release. It leverages quality checks to maintain high standards and uses `release-please-action` to automate the release process.

### Source-Analysis

A folder containing actions to analyze and improve the source code. It includes the following sub-actions:

- **Quality-checks**: Performs code quality checks for multiple programming languages, including Python, Go, Node.js, and Terraform. It also includes universal checks like spellchecking and Markdown linting.
- **Compliance-checks**: (Details not provided in the repository, but intended for ensuring compliance with coding standards or organizational policies.)
- **Security-checks**: Scans the source code for vulnerabilities using tools like Snyk and Trivy to ensure the security of the application.

### Build

A folder containing actions to build and secure containerized applications. It includes the following sub-actions:

- **Docker-build**: (Details not provided in the repository, but intended for building Docker images efficiently and consistently.)
- **Container-security**: Ensures that container images are secure and compliant with best practices by performing security checks during the build process.

## Reutilizable workflows

  WIP
