# Docker build action

Builds (and optionally pushes) a Docker image with Buildx, using GitHub Actions cache. Normally invoked as a step inside [`ci.yml`](../../.github/workflows/ci.yml)/[`release.yml`](../../.github/workflows/release.yml) rather than directly.

## Usage

```yaml
- id: docker_build
  uses: Jasviers/actions/build/docker-build@v1
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Build context directory (relative to the checkout root)</p> | `false` | `.` |
| `registry` | <p>Container registry URL</p> | `false` | `ghcr.io` |
| `image-name` | <p>Image name (defaults to repository name)</p> | `false` | `${{ github.repository }}` |
| `github-token` | <p>GitHub token for registry authentication</p> | `true` | `""` |
| `push` | <p>Push image to registry</p> | `false` | `true` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `image-tag` | <p>Full image tag with registry</p> |
| `image-digest` | <p>Image digest</p> |
<!-- action-docs-outputs source="action.yml" -->
