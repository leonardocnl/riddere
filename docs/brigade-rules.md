# Brigade rules

Rules every agent in every project must keep. The architect copies them into each agent it
creates (the "Shared rules" section of each template) and never weakens them.

## 1. Decisions

- Taste, product, priority and scope decisions belong to Leonardo.
- An agent may decide alone only when the answer is very clear: the project already does it
  one way, a rule file settles it, or only one option works. It states the decision and why.
- When in doubt, it is not very clear. Stop and ask.
- Subagents cannot talk to Leonardo. To ask, an agent ends its output with
  `## Questions for Leonardo` (2 to 4 options each, with a recommendation) and stops.
- Assumptions are labeled "Assumption: ..." and never presented as facts.

## 2. Source of truth

- The project's CLAUDE.md and the files it points to win over anything in a template.
- Read the code before changing it. Never invent an API, file, command or env var: check
  that it exists.
- Do not add dependencies without asking.

## 3. Models (cost discipline)

The best model is reserved for work where reasoning matters. A chef does not peel carrots.

| Agent | Model | Reason |
|---|---|---|
| arquiteto | opus | planning and structure; mistakes here are expensive |
| dev, ui-ux, banco, algoritmo, devops, revisor | sonnet | real engineering, good cost/quality |
| testes | haiku, escalating to sonnet | repetitive work, sometimes tricky logic |
| requisitos, docs, git | haiku | guided by existing text and code |

## 4. Escalation of `testes`

`testes` runs on haiku. It returns `ESCALATE: <reason>` instead of guessing when:

- the same test still fails after two fix attempts, or
- the logic under test is complex (algorithms, concurrency, money, security rules).

When the main conversation sees `ESCALATE`, it calls `testes` again with the model override
`sonnet`, passing the reason and what was already tried.

## 5. Code style

- 4-space indentation. If the project has a formatter config, it is the source of truth.
- Follow the project's naming and folder conventions.

## 6. Git

- Commits and PRs are authored only by Leonardo. Never add Claude as author, and never add
  `Co-Authored-By` or `Generated with Claude Code` lines, in commits or PR descriptions.
- Follow the project's branch workflow. Never push to protected branches (`main`, `develop`
  when it exists) directly.
- Never skip git hooks: no `--no-verify`, no `core.hooksPath` overrides, no `HUSKY=0` or
  similar. If a hook fails, fix the cause.

## 7. Testing

- Automated tests only. Do not ask for screenshots or videos; Leonardo checks screens
  manually by running the app locally.
- Do not create a visual regression suite. If the project already has one, agents may run it
  to confirm nothing changed, but never update its baseline images: a changed baseline is a
  visual decision for Leonardo.

## 8. Language

- Agent and skill files: English.
- Messages to Leonardo: Brazilian Portuguese, with terms explained and assumptions explicit.
- Code, commits and user-facing text: follow the project's rules.
