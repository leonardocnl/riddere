---
name: ci-workflows
description: Rules for safe, reliable GitHub Actions workflows and deploy config. Use when creating or changing CI/CD.
---

# CI workflows

## Security
- Set `permissions:` explicitly, at the minimum needed (start from `contents: read`).
- Pin third-party actions to a full commit SHA, with the version in a comment.
- Never interpolate untrusted input (`github.event.*` titles, branch names) directly into
  `run:`; pass it through an env var.
- Secrets only via `secrets.*`; never echo them. Avoid `pull_request_target` unless needed.

## Reliability
- Cache dependencies. Set `timeout-minutes`. Use `concurrency` to cancel outdated runs.
- Scheduled jobs: make them idempotent (safe to run twice) and log what they did.
- Match the runtime version to the project's (e.g. `.nvmrc`).

## Handing off
- List the secrets and settings Leonardo must create (names only) and where.
- Explain how to check the workflow ran (Actions tab, which job, what to look for).
