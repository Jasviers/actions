# Docker build action

Builds (and optionally pushes) a Docker image with Buildx, using GitHub Actions cache. Normally invoked as a step inside [`ci.yml`](../../.github/workflows/ci.yml)/[`release.yml`](../../.github/workflows/release.yml) rather than directly.

## Usage

```yaml
- id: docker_build
  uses: Jasviers/actions/build/docker-build@v2
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
| `generate-sbom` | <p>Generate a Software Bill of Materials (SPDX JSON) for the built image and upload it as an artifact</p> | `false` | `false` |
| `dockerfile` | <p>Path to the Dockerfile, relative to the checkout root (defaults to Dockerfile inside working-directory)</p> | `false` | `""` |
| `tags` | <p>docker/metadata-action tag rules, one per line (e.g. type=semver,pattern={{version}},value=v1.2.3). Empty uses the metadata-action defaults (branch / PR / git tag name)</p> | `false` | `""` |
| `artifact-suffix` | <p>Suffix appended to every uploaded artifact name, e.g. '-python'. Set it when the action runs more than once per workflow run (matrix or monorepo), since artifact names must be unique per run.</p> | `false` | `""` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `image-tag` | <p>Primary image tag with registry (the first one when several tags are generated)</p> |
| `image-tags` | <p>Every generated image tag with registry, newline-separated</p> |
| `image-digest` | <p>Image digest</p> |
| `image-ref` | <p>Immutable image reference, image@digest (empty unless the image was pushed)</p> |
<!-- action-docs-outputs source="action.yml" -->
