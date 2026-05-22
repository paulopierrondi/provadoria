

<!-- BACKGROUND_CODERS_START -->
## Background Coders Protocol

Este projeto usa o modelo Background Coders embutido nos coders atuais: Codex, Claude Code, Kimi CLI, Gemini CLI e Google Antigravity.

Cursor Background Agent esta dormente e nao deve ser roteado por padrao.

### Required context

Leia antes de planejar/editar:

- `.brain/BACKGROUND_CODER_CONTEXT.md`
- `.brain/HUB_COUNCIL_CONTEXT.md`
- `.brain/PROJECT_CONTEXT.md`
- `AGENTS.md`
- `GEMINI.md`
- `CODEX_RULES.md`

### Routing

| Trabalho | Coder padrao | Regra |
| --- | --- | --- |
| Varredura ampla, triagem barata, relatorio, backlog, docs | Kimi CLI | read-only/report-first |
| Patch seguro, testes, integracao, validacao local | Codex | executor principal |
| Bug dificil, arquitetura, compliance, App Store/release risk | Claude Code | especialista senior |
| Checagem independente, tarefas Google/MCP, utilitario CLI, validacao terminal | Gemini CLI | usar `GEMINI.md` como memoria hierarquica; manter paridade com `AGENTS.md` |
| Orquestracao agent-first, navegador/Chrome, multi-folder/worktree, subagentes, artefatos | Google Antigravity | ler `AGENTS.md` + `GEMINI.md`; vault fora do workspace exige acesso explicito ou snapshot `.brain` |
| PR remoto via Cursor | Cursor Background Agent | dormant; somente se Paulo ativar explicitamente |

### Budget gate

Antes de iniciar background work, declarar:

- owner: `codex`, `claude`, `kimi`, `gemini` ou `antigravity`;
- registry id: `provadoria`;
- repo/projeto;
- uma tarefa ou uma issue Linear;
- artefato esperado;
- stop condition;
- human gate quando envolver secrets, deploy, App Store/TestFlight, paid ads, producao, migrations, social publishing, force push ou multi-repo.

### Branch policy

- Codex: `codex/<linear-id>-<short-task>`
- Claude: `claude/<linear-id>-<short-task>`
- Kimi: preferir relatorio sem branch; se editar, usar escopo explicito
- Gemini: `gemini/<linear-id>-<short-task>` quando editar codigo
- Antigravity: `antigravity/<linear-id>-<short-task>` ou worktree isolada do Project
- Cursor: nao usar sem pedido explicito do Paulo

### Handoff

Todo output deve trazer: o que mudou/encontrou, arquivos tocados/revisados, comandos/testes, risco residual, proxima acao exata e se Obsidian/Linear precisa atualizar.
<!-- BACKGROUND_CODERS_END -->

<!-- CURSOR_BACKGROUND_AGENT_START -->
## Cursor Background Agent Protocol

Cursor Background Agent is currently dormant. Paulo is not opening Cursor for now.

Do not route background work to Cursor by default. Use the active Background Coders model:

- Kimi CLI: broad scan, cheap triage, reports, backlog, docs.
- Codex: safe patch, tests, integration, local verification.
- Claude Code: hard bug, architecture, compliance, App Store/release risk.
- Gemini CLI: independent Google-model CLI validation, MCP checks, terminal utility tasks.
- Google Antigravity: agent-first orchestration, Chrome/browser verification, multi-folder/worktree tasks, artifacts.

Cursor may only be used if Paulo explicitly activates it.

### Required context

Read before editing:

- `AGENTS.md`
- `CODEX_RULES.md`
- `.brain/PROJECT_CONTEXT.md`
- `.brain/HUB_COUNCIL_CONTEXT.md`
- `.brain/CURSOR_BACKGROUND_AGENT_CONTEXT.md`
- `.cursor/rules/010-paulo-agent-hub.mdc`
- `.cursor/rules/020-cursor-background-agent.mdc`

### Scope and branch

- Registry id: `provadoria`
- Branch pattern if explicitly activated: `cursor/<linear-id>-<short-task>` or `cursor/<short-task>`.
- One issue/task per branch.
- Keep diffs small and reversible.

### Handoff

Final summary must include:

- what changed;
- files touched;
- commands/tests run;
- risks or blockers;
- exact Obsidian/Linear update for the local operator.

### Hard stops

Stop and ask for local Codex/Claude/Gemini/Antigravity/Paulo handoff before secrets, `.env`, production deploys, App Store/TestFlight submission, paid ads, social publishing, production migrations, force push, multi-repo changes or macOS signing assumptions.
<!-- CURSOR_BACKGROUND_AGENT_END -->

<!-- HUB_COUNCIL_TRIGGER_START -->
# Hub de Agentes / Product Council - Required Coder Gate

Este projeto e gerenciado pelo Hub de Agentes de Paulo. Antes de planejar, editar, revisar, debugar, criar release, mexer em UI/UX, marketing, SEO, seguranca ou automacao, acione o Product Council.

## Start gate obrigatorio

```bash
/Users/paulopierrondi/agents-hub/scripts/project-council-touchpoint.py --project-id "provadoria" --phase start
```

Leia tambem:

- `.brain/HUB_COUNCIL_CONTEXT.md`
- `.brain/PROJECT_CONTEXT.md`
- `/Users/paulopierrondi/Documents/Obsidian Vault/Hub_Agentes/05_Configuracao/config_product_council.md`
- `/Users/paulopierrondi/Documents/Obsidian Vault/Hub_Agentes/03_Outputs/council_reviews/`

## Finish gate obrigatorio

```bash
/Users/paulopierrondi/agents-hub/scripts/project-council-touchpoint.py --project-id "provadoria" --phase finish --summary "<o que mudou; testes; riscos; proximos passos>"
```

## Regras

- Registry-first: estado vem de `/Users/paulopierrondi/agents-hub/registry/projects_registry.json`.
- Evidence-based: cite arquivo, linha, commit, log, URL ou report.
- No secrets: nunca grave tokens, API keys, cookies, chaves privadas, AuthKeys ou valores `.env` em Markdown.
- Human-gated: deploy, push, App Store submit, ads spend, publicacao social, migrations, producao, secrets, cron e LaunchAgents exigem aprovacao explicita do Paulo.
<!-- HUB_COUNCIL_TRIGGER_END -->
