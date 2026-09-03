# Contributing

Thanks for helping improve this actions library.

## Commit messages

This repo uses [Conventional Commits](https://www.conventionalcommits.org/). release-please
reads them to build `CHANGELOG.md` and pick the next version:

- `feat: …` → minor bump, shown in the changelog
- `fix: …` → patch bump, shown in the changelog
- `docs: …`, `refactor: …` → shown in the changelog, no version bump
- `chore: …`, `ci: …`, `test: …` → not shown, no version bump
- a `!` or `BREAKING CHANGE:` footer → major bump

## Releasing

`self-release.yml` runs on every push to `main`. release-please opens/updates a
"chore(main): release …" PR; merging it tags the release and `self-release.yml`'s
`float-tag` job force-moves the major tag (`v2`). No manual tagging.

## Testing a change

| You changed… | Run (via **Actions → workflow_dispatch**) |
| --- | --- |
| a composite action, `ci.yml`, or a fixture | `test-check-ci.yml` |
| `make-release/**` | `test-check-make-release.yml` |
| a script under `make-docs/` | `test-check-docs.yml` |

`test-check-ci.yml` covers the six languages against `test/fixtures/<lang>/`, asserts the
Docker outputs of `ci.yml`, and runs `test/fixtures/_negative/` through
`source-analysis/quality-checks` to prove the language gates actually fail on bad input.

**Known limitation:** `ci.yml` references the sub-actions as `Jasviers/actions/...@v2`, so a
PR that changes a composite action is smoke-tested against the *published* `@v2`, not the PR's
code — except the `reject-bad-fixtures` job, which calls `quality-checks` by local path, and
`test-check-make-release.yml`, which calls `./make-release`.

## Composite action READMEs

The input/output tables in each action's `README.md` are generated. After changing an
action's `inputs:`/`outputs:`, regenerate from that action's directory:

```bash
npx action-docs@2.5.1 --update-readme
```

`lint-workflows.yml` fails the PR if a table is stale.

## Labels

Issues use `bug` (bug report template) and `enhancement` (feature request template); Renovate
tags its PRs `dependencies`. Create these labels in **Settings → Labels** if they are missing.

## Backwards compatibility

`v2` has external consumers. Removing or renaming an input/output, or changing a default, is a
breaking change — call it out in the PR and use a `feat!:` / `BREAKING CHANGE:` commit so the
major tag bumps.
