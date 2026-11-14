---
name: commit-and-pr
description: Conventional Commits, branch naming and PR description rules, with Leonardo as sole author. Use when committing, branching or opening a PR.
---

# Commits and PRs

## Commit message
- Format: `type(scope): summary` in the imperative, lowercase, no period, up to ~72 chars.
- Types: feat, fix, refactor, test, docs, style, chore, ci, perf, build.
- Scope: the area touched (e.g. `home`, `auth`, `db`).
- If the project has requirement IDs, cite them: `feat(home): rotate daily picks (US001 C2)`.
- Body (optional): why the change was made, wrapped at 72 chars.

## Authorship (hard rule)
- Leonardo is the only author. NEVER add `Co-Authored-By`, `Generated with Claude Code`,
  emojis tied to Claude, or any AI attribution, in commits or PRs.

## Branches
- One short-lived branch per task: `feat/…`, `fix/…`, `docs/…`, kebab-case.
- Branch off and target the base branch the project's workflow defines.

## Hooks
- Never use `--no-verify` or any other way to skip git hooks.

## Pull request
- Title: same format as a commit.
- Body: what changed, why, how to test locally, requirement IDs covered, and the project's
  PR template filled in (security checklist included, when present).
