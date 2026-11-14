---
name: plan-feature
description: How the architect breaks a feature or user story into small tasks assigned to the brigade. Use when planning work before coding.
---

# Plan a feature

1. Goal in one sentence. Acceptance criteria covered (with IDs).
2. Read the code that will change. Note what exists and can be reused.
3. Tasks, in order. Typical order: banco → algoritmo → dev → ui-ux → testes → requisitos →
   revisor → docs → git. Skip what does not apply.
4. Each task: agent, files, definition of done, dependencies.
5. Risks: what can break, what contradicts a rule or requirement, what is unknown.
6. Questions for Leonardo: every choice of taste, product, priority or scope, with options.

Keep each task small enough to finish in one agent run. If a task needs more than one
agent's expertise, split it.
