# Quality Checks

The multi-language linting hub: dispatches on `language` to run `ruff` (python), `golangci-lint`/`gofmt`/`go vet` (go), `eslint`/`prettier` (nodejs, only if a config file is present), `terraform fmt`/`validate`/`tflint` (terraform), or `ansible-lint`/`yamllint` (ansible) — plus universal checks that always run regardless of language: Markdown linting, `yamllint`, `shellcheck`, and `hadolint` (Dockerfile linting, skippable). Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml).

## Usage

```yaml
- uses: Jasviers/actions/source-analysis/quality-checks@v2
  with:
    language: python
    github-token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `language` | <p>Programming language (python, go, nodejs, terraform, ansible, kubernetes, none)</p> | `true` | `""` |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `python-version` | <p>Python version to use</p> | `false` | `3.x` |
| `go-version` | <p>Go version to use</p> | `false` | `stable` |
| `node-version` | <p>Node.js version to use</p> | `false` | `lts/*` |
| `terraform-version` | <p>Terraform version to use</p> | `false` | `latest` |
| `skip-hadolint` | <p>Skip Dockerfile linting</p> | `false` | `false` |
| `skip-markdown-checks` | <p>Skip Markdown linting and formatting checks</p> | `false` | `false` |
| `skip-shellcheck` | <p>Skip shellcheck on shell scripts</p> | `false` | `false` |
| `skip-yamllint` | <p>Skip yamllint on YAML files (style/syntax only — no Kubernetes schema/best-practice checks)</p> | `false` | `false` |
| `dockerfile-path` | <p>Path to Dockerfile</p> | `false` | `./Dockerfile` |
| `github-token` | <p>GitHub token for uploading SARIF results</p> | `false` | `""` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `hadolint-sarif` | <p>Path to hadolint SARIF results (empty when skipped or no Dockerfile found)</p> |
<!-- action-docs-outputs source="action.yml" -->
