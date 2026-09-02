# Ansible Syntax Check

Installs `ansible-core` (plus Galaxy requirements from `requirements.yml` if present) and runs `ansible-playbook --syntax-check` against a playbook. Normally invoked from [`ci.yml`](../../.github/workflows/ci.yml) for `language: ansible`.

## Usage

```yaml
- uses: Jasviers/actions/make-test/ansible-unit-test@v1
  with:
    playbook: site.yml
```

<!-- action-docs-inputs source="action.yml" -->
## Inputs

| name | description | required | default |
| --- | --- | --- | --- |
| `working-directory` | <p>Directory containing the Ansible project (relative to the checkout root)</p> | `false` | `.` |
| `python-version` | <p>Python version used to run Ansible</p> | `false` | `3.x` |
| `ansible-version` | <p>ansible-core version to install (latest installs the newest release)</p> | `false` | `latest` |
| `playbook` | <p>Playbook file to syntax-check, relative to working-directory</p> | `false` | `playbook.yml` |
<!-- action-docs-inputs source="action.yml" -->

<!-- action-docs-outputs source="action.yml" -->
## Outputs

| name | description |
| --- | --- |
| `test-results` | <p>Syntax-check step outcome (success/failure); readable by callers that set continue-on-error on this action</p> |
<!-- action-docs-outputs source="action.yml" -->
