---
type: codegraph
status: "indexed"
generated_at: "2026-05-24 15:17:01"
repo: "provadoria"
tags:
  - codegraph
  - agent-os
---
# CodeGraph

Repo: `/Users/paulopierrondi/Projects/provadoria`
Index status: `indexed`

## Local Index

- Expected DB: `/Users/paulopierrondi/Projects/provadoria/.codegraph/codegraph.db`
- Stored in repo working tree but excluded locally via `.git/info/exclude`.
- Obsidian stores only this summary, not the SQLite database.

## Commands

```bash
agent-os index-code "/Users/paulopierrondi/Projects/provadoria"
codegraph status "/Users/paulopierrondi/Projects/provadoria"
codegraph context "explain the main architecture" "/Users/paulopierrondi/Projects/provadoria"
git diff --name-only | codegraph affected --stdin
```

## Current Detail

```text
CodeGraph Status

Project: /Users/paulopierrondi/Projects/provadoria

Index Statistics:
  Files:     57
  Nodes:     602
  Edges:     966
  DB Size:   1.89 MB
  Backend:   node:sqlite — built-in (full WAL)
  Journal:   wal

Nodes by Kind:
  import          148
  function        100
  method          75
  type_alias      60
  file            52
  struct          48
  class           34
  variable        32
  component       31
  enum_member     11
  constant        8
  enum            3

Files by Language:
  python          21
  swift           19
  jsx             7
  yaml            5
  c               4
  javascript      1

✓ Index is up to date
```
