# Go Unit Tests

Runs `go test ./... -coverprofile=coverage.out`, with an optional minimum-coverage gate, and uploads the coverage report as an artifact. Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml) for `language: go`.

## Usage

```yaml
- uses: Jasviers/actions/make-test/go-unit-test@v1
  with:
    min-coverage: '80'
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `go-version` | <p>Go version to use</p> | `false` | `stable` |
| `min-coverage` | <p>Minimum total coverage percentage required (0 disables the gate)</p> | `false` | `0` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `coverage-file` | <p>Path to coverage report</p> |
| `test-results` | <p>Test execution results</p> |
<!-- action-docs-outputs source="action.yml" -->
