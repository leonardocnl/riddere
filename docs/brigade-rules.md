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

## 7. Testing

- Automated tests only. Do not ask for screenshots, videos or automatic visual tests;
  Leonardo checks screens manually by running the app locally.

## 8. Language

- Agent and skill files: English.
- Messages to Leonardo: Brazilian Portuguese, with terms explained and assumptions explicit.
- Code, commits and user-facing text: follow the project's rules.

## 9. Recommended plugins

### modern-web-guidance (web projects only)

[GoogleChrome/modern-web-guidance](https://github.com/GoogleChrome/modern-web-guidance)
(Apache-2.0, preview). Curated, up-to-date guides on modern browser APIs, CSS, forms,
performance and accessibility, so agents stop defaulting to legacy patterns.

- **Enable** when the project has a browser UI (web app, website, PWA).
- **Do not enable** when there is no web UI (CLI, API-only, library, mobile-only).
- Only the `modern-web-guidance` pack. Never `chrome-extensions`, unless the project itself
  is a browser extension.
- Agents using it: `dev` (browser-side code), `ui-ux` (which technique), `revisor` (legacy
  patterns). The project's design system still decides look and feel.

Project setup the architect applies, after approval, to `.claude/settings.json`. Merge with
the existing keys; never overwrite them:

```json
{
    "extraKnownMarketplaces": {
        "googlechrome": {
            "source": { "source": "github", "repo": "GoogleChrome/modern-web-guidance" }
        }
    },
    "enabledPlugins": {
        "modern-web-guidance@googlechrome": true
    },
    "env": {
        "DISABLE_TELEMETRY": "1"
    }
}
```

Names come from the repo's `.claude-plugin/marketplace.json` (marketplace `googlechrome`,
plugin `modern-web-guidance`).
