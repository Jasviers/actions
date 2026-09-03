# Actions

A small library of reusable GitHub composite actions and `workflow_call` workflows used
across my projects for source-code quality, security, compliance, testing, docs and
releases. It is public and versioned so any repo can consume it — see
[Versioning](#versioning) and [CONTRIBUTING.md](CONTRIBUTING.md).

## Contents

- [Reusable workflows](#reusable-workflows) — `ci.yml`, `release.yml`
- [Actions catalog](#actions-catalog)
- [Versioning](#versioning)
- [Migrating an existing consumer](#migrating-an-existing-consumer)
- [Changelog](CHANGELOG.md)

## Reusable workflows

Two `workflow_call` workflows let a consumer repo wire up CI and releases with a single
`uses:` line instead of hand-copying steps. Both live under `.github/workflows/` here and
are consumed as `Jasviers/actions/.github/workflows/<file>@v2`.

### `ci.yml`

Runs quality checks, an optional Docker build, CodeQL compliance checks, Trivy security
checks and the language test runner.

```yaml
name: CI
on:
  push:
    branches: ["feature/*", "bugfix/*", "hotfix/*"]
  workflow_dispatch:
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
permissions:
  contents: read
  packages: write
  security-events: write
jobs:
  ci:
    uses: Jasviers/actions/.github/workflows/ci.yml@v2
    with:
      language: python   # python | go | nodejs | terraform | ansible | kubernetes | none
    secrets: inherit
```

Key inputs: `language` (required), `working-directory` (default `.`, for monorepos),
`run-docker-build` / `run-compliance-checks` / `run-security-checks` / `run-tests` (all
default `true`). CodeQL runs for `python`, `go`, `nodejs`; `terraform`, `ansible`,
`kubernetes` skip it. Tests run for `python`, `go`, `nodejs` and `ansible`
(`ansible-playbook --syntax-check`); `terraform`/`kubernetes` have no separate test runner —
their validation happens in `quality-checks`. Outputs `image-tag` / `image-digest` when a
Docker build ran.

Add a `concurrency` block to your calling workflow (as above) — `ci.yml` deliberately does
not set one, because a reusable workflow's concurrency group can cancel sibling matrix calls.

### `release.yml`

Wraps `make-release` (release-please), then — **only on runs that actually cut a release** —
builds a Docker image and generates docs.

```yaml
name: Release
on:
  workflow_dispatch:
  push:
    branches: [main]
concurrency:
  group: release-${{ github.ref }}
  cancel-in-progress: false
permissions:
  contents: write
  pull-requests: write
  packages: write
  pages: write
  id-token: write
jobs:
  release:
    uses: Jasviers/actions/.github/workflows/release.yml@v2
    with:
      language: python
    secrets: inherit
```

**Prerequisite for every consumer**: commit your own `release-please-config.json` and
`.release-please-manifest.json` at your repo root (or point `config-file` / `manifest-file`
at a custom path). `make-release` fails fast with a clear error if either is missing.

Outputs `release-created`, `tag-name`, `image-tag` and `page-url`. The docs job runs in the
`github-pages` environment — enable **Settings → Pages → Source: GitHub Actions** in the
consumer repo, or pass `run-docs: false`.

## Actions catalog

Each action has its own README with the full input/output table.

| Action | What it does |
| --- | --- |
| [`make-release`](make-release/README.md) | Changelog + GitHub release from Conventional Commits (release-please). `dry-run` input validates config without side effects. |
| [`source-analysis/quality-checks`](source-analysis/quality-checks/README.md) | Multi-language lint hub (Python/Go/Node.js/Terraform/Ansible/Kubernetes) plus universal Markdown / YAML / shell / Dockerfile linting. |
| [`source-analysis/compliance-checks`](source-analysis/compliance-checks/README.md) | CodeQL analysis for Python, Go or Node.js. |
| [`source-analysis/security-checks`](source-analysis/security-checks/README.md) | Trivy filesystem + container-image vulnerability scans. |
| [`build/docker-build`](build/docker-build/README.md) | Buildx image build/push with GHA layer cache, optional SBOM. |
| [`make-test/python-unit-test`](make-test/python-unit-test/README.md) | `pytest` + coverage. |
| [`make-test/go-unit-test`](make-test/go-unit-test/README.md) | `go test` + coverage, optional minimum-coverage gate. |
| [`make-test/nodejs-unit-test`](make-test/nodejs-unit-test/README.md) | Runs an npm script (`test` by default). |
| [`make-test/ansible-unit-test`](make-test/ansible-unit-test/README.md) | `ansible-playbook --syntax-check` (+ `ansible-galaxy install`). |
| [`make-docs/python-docs`](make-docs/python-docs/README.md) | Sphinx API docs, deployed to GitHub Pages by default. |

## Versioning

- **`@v2`** — floating major tag. Moves forward on every `v2.x` release
  (`self-release.yml` force-pushes it). Recommended for most consumers.
- **`@v2.1.0`** — an exact release tag. Pin this if you want to opt into upgrades yourself.
- **`@<sha>`** — a commit. Most reproducible; update via Renovate/Dependabot.

`v1` is frozen at its pre-modernization state (`81ec127`) and receives no updates.
Breaking changes bump the major tag.

## Migrating an existing consumer

If your repo hand-wrote its own `CI.yml` / `Release.yml` calling individual
`Jasviers/actions/...` sub-actions directly (the pattern before `ci.yml` / `release.yml`
existed), replace them with the ~12-line calls above. This also drops stale inputs on
sub-actions that changed shape upstream, and makes Docker builds / docs run only on runs
where release-please actually cut a release.
