# Actions

## Overview

This repository contains a collection of GitHub Actions designed to streamline and enhance my development workflow. The actions are organized into categories to address various aspects of software development, including source code quality, security, compliance, and release management.

## Actions Catalog

### [Make-release](make-release/README.md)

This action ensures the quality of the source code before generating a changelog and creating a release. It leverages quality checks to maintain high standards and uses `release-please-action` to automate the release process.

### Source-Analysis

A folder containing actions to analyze and improve the source code. It includes the following sub-actions:

- **[Quality-checks](source-analysis/quality-checks/README.md)**: Performs code quality checks for multiple programming languages, including Python, Go, Node.js, Terraform, and Ansible (`ansible-lint` + `yamllint`). It also includes universal checks like Markdown linting, Dockerfile linting (hadolint), and shellcheck.
- **[Compliance-checks](source-analysis/compliance-checks/README.md)**: Runs CodeQL analysis for Python, Go, or Node.js (`language` input). CodeQL has no Terraform/HCL or Ansible/YAML support, so Terraform and Ansible pipelines skip this step.
- **[Security-checks](source-analysis/security-checks/README.md)**: Scans the source code and container images for vulnerabilities using Trivy (filesystem and image scans).

### Build

A folder containing actions to build and secure containerized applications. It includes the following sub-actions:

- **[Docker-build](build/docker-build/README.md)**: Builds and optionally pushes a Docker image with Buildx and GitHub Actions layer caching.

### Make-test

Test runners, one per language: **[python-unit-test](make-test/python-unit-test/README.md)** (pytest + coverage), **[go-unit-test](make-test/go-unit-test/README.md)** (`go test` + coverage, optional minimum-coverage gate), **[nodejs-unit-test](make-test/nodejs-unit-test/README.md)** (runs an npm script, `test` by default), **[ansible-unit-test](make-test/ansible-unit-test/README.md)** (`ansible-playbook --syntax-check`, plus `ansible-galaxy install` when a `requirements.yml` is present). No Terraform equivalent yet.

### [Make-docs/python-docs](make-docs/python-docs/README.md)

Generates Sphinx API documentation for a Python project and, by default, deploys it to GitHub Pages.

## Reusable workflows

Two `workflow_call` reusable workflows let any consumer repo wire up CI and releases with a single `uses:` line instead of hand-copying steps. Both live under `.github/workflows/` in this repo and are consumed as `Jasviers/actions/.github/workflows/<file>@v1`.

### `ci.yml`

Runs quality checks, an optional Docker build, compliance checks, security checks, and tests.

```yaml
name: CI
on:
  push:
    branches: ["feature/*", "bugfix/*", "hotfix/*"]
  workflow_dispatch:
  workflow_call:
permissions:
  contents: read
  packages: write
  security-events: write
jobs:
  ci:
    uses: Jasviers/actions/.github/workflows/ci.yml@v1
    with:
      language: python   # python | go | nodejs | terraform | ansible | none
    secrets: inherit
```

Key inputs: `language` (required), `working-directory` (default `.`, for monorepos), `run-docker-build`/`run-compliance-checks`/`run-security-checks`/`run-tests` (all default `true`). Compliance-checks (CodeQL) runs for `python`, `go`, and `nodejs`; `terraform` and `ansible` skip it (no CodeQL support). Tests run for `python`, `go`, `nodejs` (unit tests) and `ansible` (`ansible-playbook --syntax-check`); `terraform` has no test-runner action yet. Outputs `image-tag`/`image-digest` when a Docker build ran.

### `release.yml`

Wraps `make-release` (release-please), then — **only on runs that actually cut a release**, not every push to `main` — builds a Docker image and generates docs.

```yaml
name: Release
on:
  workflow_dispatch:
  push:
    branches: [main]
permissions:
  contents: write
  pull-requests: write
  pages: write
  id-token: write
  security-events: write
  packages: write
jobs:
  release:
    uses: Jasviers/actions/.github/workflows/release.yml@v1
    with:
      language: python
    secrets: inherit
```

**Prerequisite for every consumer**: commit your own `release-please-config.json` and `.release-please-manifest.json` at your repo root (or point `config-file`/`manifest-file` at a custom path) — `release-please-action` resolves these relative to *your* checkout, not this library's. `make-release` fails fast with a clear error if either file is missing.

### Migrating an existing consumer

If your repo already hand-wrote its own `CI.yml`/`Release.yml` calling individual `Jasviers/actions/...` sub-actions directly (the pattern used before this repo had `ci.yml`/`release.yml`), replace them with the ~12-line calls above. This also fixes two issues that pattern had: stale inputs on sub-actions that changed shape upstream (e.g. a removed `snyk-token`) simply disappear, since you stop referencing individual sub-actions directly; and Docker builds/docs no longer run on every push to `main`, only on runs where release-please actually created a release.
