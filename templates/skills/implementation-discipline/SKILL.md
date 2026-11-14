---
name: implementation-discipline
description: How to implement a task with minimal, verifiable changes that respect the project's architecture. Use when writing or changing application code.
---

# Implementation discipline

## Before writing
- Find where similar code already lives and copy its patterns (naming, error handling, layering).
- Confirm every function, type, route and env var you plan to use exists. Grep for it.
- If the project has layers, check which layer the change belongs to and that imports only
  point inward.

## While writing
- Smallest change that completes the task. No drive-by refactors; list them as suggestions.
- Validate all external input at the boundary (forms, server actions, API routes, env).
- Handle errors explicitly. User-facing errors are generic; details go to server logs.
- No secrets in client code. No commented-out code. No TODO without an explanation.

## Before finishing
- Run the project's checks (format, lint, typecheck, tests, build).
- Re-read your diff as if reviewing someone else's code.
- Report decisions you took and why, and anything you deliberately left out.
