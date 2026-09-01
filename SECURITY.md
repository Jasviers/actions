# Security Policy

## Reporting a Vulnerability

If you find a security vulnerability in one of the actions or workflows in this repository, please report it privately using GitHub's [private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability): open the **Security** tab on this repository and click **Report a vulnerability**.

Please do not open a public issue for security reports.

## Scope

This repository publishes reusable GitHub Actions and workflows (`uses: Jasviers/actions/...@v1`). A security report is in scope if it concerns:

- A composite action or reusable workflow behaving in an unsafe way for its consumers (e.g. leaking secrets, running untrusted input unsanitized, excessive permissions).
- A third-party action dependency pinned in this repository that is known to be compromised.

## Supported Versions

Only the latest `v1` release is supported. There is no long-term support for older commits.
