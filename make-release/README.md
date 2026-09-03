# Changelog Generator (`make-release`)

Generates a changelog and release using [release-please](https://github.com/googleapis/release-please), based on Conventional Commits. Normally you don't call this directly — the [`release.yml`](../.github/workflows/release.yml) reusable workflow wraps it and adds the Docker build/docs steps and release gating on top.

**Prerequisite**: every consumer needs its own `release-please-config.json` and `.release-please-manifest.json` at its repo root (or point `config-file`/`manifest-file` at a custom path) — this action checks they exist and fails fast with a clear error if not.

## Usage

```yaml
- uses: Jasviers/actions/make-release@v1
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `token` | <p>GitHub token</p> | `false` | `${{ github.token }}` |
| `config-file` | <p>Path to the release-please config file, relative to the checkout root</p> | `false` | `release-please-config.json` |
| `manifest-file` | <p>Path to the release-please manifest file, relative to the checkout root</p> | `false` | `.release-please-manifest.json` |
| `dry-run` | <p>Verify the release-please config/manifest exist and skip the release-please step (no releases, no PRs)</p> | `false` | `false` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `release-created` | <p>Whether a release was created on this run</p> |
| `tag-name` | <p>Tag name of the release created on this run, if any</p> |
<!-- action-docs-outputs source="action.yml" -->
