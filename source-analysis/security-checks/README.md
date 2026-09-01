# Security Checks

Scans the source tree with [Trivy](https://trivy.dev/) in filesystem mode (always) and, if a `docker-image` is passed, scans that image too — both upload SARIF to the GitHub Security tab (under distinct categories, `trivy-fs`/`trivy-image`, so neither overwrites the other) and as artifacts. Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml).

## Usage

```yaml
- uses: Jasviers/actions/source-analysis/security-checks@v1
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
    docker-image: ${{ steps.docker_build.outputs.image-tag }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `github-token` | <p>GitHub token for uploading SARIF results</p> | `false` | `""` |
| `docker-image` | <p>Docker image reference for Trivy scan</p> | `false` | `""` |
<!-- action-docs-inputs source="action.yml" -->
