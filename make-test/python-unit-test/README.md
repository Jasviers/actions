# Python Unit Tests

Runs `pytest` with coverage (installing dependencies from `requirements.txt`/`setup.py`/`pyproject.toml` if present) and uploads the coverage report as an artifact. Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml) for `language: python`.

## Usage

```yaml
- uses: Jasviers/actions/make-test/python-unit-test@v1
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the project source (relative to the checkout root)</p> | `false` | `.` |
| `python-version` | <p>Python version to use</p> | `false` | `3.x` |
| `test-directory` | <p>Directory containing tests</p> | `false` | `test` |
| `pytest-args` | <p>Additional pytest arguments</p> | `false` | `-v --cov --cov-report=xml --cov-report=term` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `coverage-file` | <p>Path to the coverage report (relative to the checkout root)</p> |
| `test-results` | <p>Test step outcome (success/failure); readable by callers that set continue-on-error on this action</p> |
<!-- action-docs-outputs source="action.yml" -->
