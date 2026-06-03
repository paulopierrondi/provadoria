---
type: agent-os
status: active
generated_at: "2026-05-24 15:17:01"
repo: "provadoria"
tags:
  - agent-os
  - codegraph
  - agentmemory
---
# Agent OS

Repo: `/Users/paulopierrondi/Projects/provadoria`
Obsidian note: `[[02_Projects/provadoria]]`
Linear hint: `Provadoria (AGE) — id 93dfe567-9c37-4993-8401-188b5fa6b477`
Memory namespace: `paulo:provadoria`

## Purpose

This repo participates in Paulo's local Agent OS:

- `CodeGraph` maps code structure, symbols, routes, callers, callees, impact, and affected tests.
- `agentmemory` stores operational recall across agents.
- `Obsidian` remains the durable record for decisions, risks, commands and next steps.
- `Linear` remains the live execution tracker for project/issue reality.

## Canonical Commands

```bash
agent-os session-start "/Users/paulopierrondi/Projects/provadoria"
agent-os index-code "/Users/paulopierrondi/Projects/provadoria"
agent-os sync-vault
agent-os validate
```

## Rules

- Prefer CodeGraph before grep/read loops for architecture and impact questions when the index exists.
- Do not write secrets to memory, Markdown, logs, screenshots, commits, Linear or email.
- Keep `.codegraph/` local and uncommitted; it is excluded via `.git/info/exclude`.
- Treat agentmemory as recall, not source of truth.
- CloakBrowser is optional and controlled; use only for legitimate browser QA/automation that Playwright cannot handle.
