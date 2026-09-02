# Node.js Unit Tests

Installs dependencies with `npm ci` and runs an npm script (`test` by default). Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml) for `language: nodejs`.

## Usage

```yaml
- uses: Jasviers/actions/make-test/nodejs-unit-test@v1
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `node-version` | <p>Node.js version to use</p> | `false` | `lts/*` |
| `test-script` | <p>npm script to run for tests</p> | `false` | `test` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `test-results` | <p>Test step outcome (success/failure); readable by callers that set continue-on-error on this action</p> |
<!-- action-docs-outputs source="action.yml" -->
