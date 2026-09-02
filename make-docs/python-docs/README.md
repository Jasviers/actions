# Python Documentation Generator

Generates API documentation for a Python project with Sphinx (auto-detects the source directory among `src`, `.`, `lib`, `app`) and, by default, deploys it to GitHub Pages. Normally invoked from [`release.yml`](../../.github/workflows/release.yml), only on runs that actually cut a release.

When `deploy-to-pages` is `true` (the default) the calling job must set `environment: github-pages` and grant `pages: write` + `id-token: write` — `release.yml` already does this. Pass `deploy-to-pages: false` to only build the HTML into `docs/_build/html` without touching Pages.

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
| `version` | <p>Project version (a leading "v" is stripped)</p> | `false` | `1.0.0` |
| `strict-docs` | <p>Treat Sphinx build warnings as errors (-W). Set to 'false' for a lenient build.</p> | `false` | `true` |
| `deploy-to-pages` | <p>Deploy documentation to GitHub Pages</p> | `false` | `true` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `page-url` | <p>URL of the deployed documentation site (empty when deploy-to-pages is false)</p> |
<!-- action-docs-outputs source="action.yml" -->
