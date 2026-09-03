## What changed

<!-- Summary of the change. -->

## Why

<!-- What problem this solves, or what it enables. -->

## Checklist

- [ ] `lint-workflows.yml` (actionlint/zizmor) passes
- [ ] If a composite action's inputs/outputs changed, its `README.md` was regenerated (`npx action-docs --update-readme` from the action's directory)
- [ ] If this touches `ci.yml`/`release.yml`/a composite action, `test-check-ci.yml` and/or `test-check-make-release.yml` were run (`workflow_dispatch`) to verify end to end
- [ ] If a shell script under `make-docs/` changed, `test-check-docs.yml` was run
- [ ] Breaking changes to an existing input/output are called out explicitly below

## Breaking changes

<!-- None, or describe what consumers need to change. -->
