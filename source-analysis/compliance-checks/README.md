# Compliance Checks

Runs [CodeQL](https://codeql.github.com/) analysis for `python`, `go`, or `nodejs` (mapped to CodeQL's own language identifiers; Go uses `build-mode: autobuild`), uploading results to the GitHub Security tab and as a SARIF artifact. CodeQL has no Terraform/HCL or Ansible/YAML support, so those pipelines skip this step entirely. Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml).

**Note**: CodeQL analysis is free for public repositories under GitHub's CodeQL Terms. On a private repository it requires a GitHub Advanced Security license.

## Usage

```yaml
- uses: Jasviers/actions/source-analysis/compliance-checks@v1
  with:
    language: python
    github-token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `language` | <p>Application language to analyze (python, go, nodejs) — CodeQL has no Terraform/HCL or Ansible/YAML support</p> | `false` | `python` |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `python-version` | <p>Python version to use</p> | `false` | `3.x` |
| `go-version` | <p>Go version to use</p> | `false` | `stable` |
| `codeql-queries` | <p>CodeQL query suite to use (security-and-quality, security-extended, or security-only)</p> | `false` | `security-and-quality` |
| `upload-sarif` | <p>Upload SARIF results to GitHub Security</p> | `false` | `true` |
| `github-token` | <p>GitHub token for uploading SARIF results</p> | `false` | `""` |
<!-- action-docs-inputs source="action.yml" -->
