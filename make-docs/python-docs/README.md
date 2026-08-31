# Python Documentation Generator

Generates API documentation for a Python project with Sphinx (auto-detects the source directory among `src`, `.`, `lib`, `app`) and, by default, deploys it to GitHub Pages. Normally invoked from [`release.yml`](../../.github/workflows/release.yml), only on runs that actually cut a release.

## Usage

```yaml
- uses: Jasviers/actions/make-docs/python-docs@v1
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `python-version` | <p>Python version to use</p> | `false` | `3.x` |
| `github-token` | <p>GitHub token for uploading results and deploying to Pages</p> | `false` | `${{ github.token }}` |
| `project-name` | <p>Project name for documentation</p> | `false` | `${{ github.event.repository.name }}` |
| `author` | <p>Author name for documentation</p> | `false` | `${{ github.repository_owner }}` |
| `version` | <p>Project version</p> | `false` | `1.0.0` |
| `deploy-to-pages` | <p>Deploy documentation to GitHub Pages</p> | `false` | `true` |
<!-- action-docs-inputs source="action.yml" -->
