# Background Coder Context — provadoria

Registry generated at: `2026-05-21T12:27:30Z`

## Project

- Registry id: `provadoria`
- Name: `provadoria`
- Path: `/Users/paulopierrondi/Downloads/provadoria`
- Obsidian note: `02_Projects/provadoria`
- Linear hint: `Provadoria (criar Linear project)`
- Branch at registry snapshot: `main`
- Dirty at registry snapshot: `9`
- Ahead/behind at registry snapshot: `+0/-0`
- Last commit: `009c593 2026-05-18 feat: screenshots, vercel legal pages deploy, session notes update`

## Current Operating Model

Cursor Background Agent is dormant. Do not route work to Cursor unless Paulo explicitly asks.

Use current coders:

| Need | Coder | Rule |
| --- | --- | --- |
| Broad scan, triage, report, backlog | Kimi CLI | cheap/read-only/report-first |
| Patch, test, integration, local verification | Codex | default executor |
| Architecture, hard bug, compliance, App Store/release risk | Claude Code | senior specialist |
| Independent Google-model CLI validation, MCP checks, terminal utility work | Gemini CLI | read `GEMINI.md`; keep `AGENTS.md` and vault rules in sync |
| Agent-first orchestration, Chrome/browser checks, multi-folder/worktree tasks, artifacts | Google Antigravity | read `AGENTS.md` and `GEMINI.md`; use explicit project folder access for vault or rely on `.brain` snapshots |

## Cost Control

- Do not start extra agents without clear owner, task, artifact and stop condition.
- Do not duplicate the same scope across Codex, Claude, Kimi, Gemini and Antigravity.
- Use Kimi for volume, Codex for normal implementation, Claude for complex/high-risk work, Gemini for independent CLI validation, and Antigravity for orchestrated/browser-heavy tasks.
- Stop before secrets, deploy, App Store/TestFlight, paid ads, production migrations, social publishing, force push or multi-repo mutation.

## Handoff Contract

Every background coder must report:

- What changed or found.
- Files touched or reviewed.
- Commands/tests run.
- Confidence and residual risk.
- Exact next action.
- Whether Obsidian/Linear needs updating.
