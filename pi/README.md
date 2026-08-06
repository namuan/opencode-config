# pi — migrated opencode agents

This directory holds the same agents and prompts as the opencode config at the
repo root, migrated to [pi](https://github.com/earendil-works/pi-coding-agent):

| opencode | pi |
|---|---|
| `agents/*.md` (subagents) | `agents/` — subagent definitions for the `subagent` tool |
| `agents/*.md` (primary) | `prompts/` — slash-command prompt templates (`/<name>`) |
| `agent-prompts/*.md` | `prompts/` |
| `opencode.json` permissions | `extensions/permission-gate.ts` |
| opencode `@agent` delegation | `extensions/subagent/` (isolated pi subprocesses) |

## Install

```sh
./pi/setup.sh
```

This symlinks `agents/`, `prompts/`, and `extensions/` into `~/.pi/agent`.
Restart pi, then:

- Type `/` to see the 26 prompt templates (`/orchestrator`, `/reviewer`,
  `/tdd-lead`, `/docs-*`, ...).
- Ask the model to use the `subagent` tool to delegate to an agent
  (single, parallel, or chained tasks), or delegate from the prompt templates.

## Agent frontmatter

`agents/*.md` support:

- `name` — used by the `subagent` tool
- `description` — shown to the model when choosing an agent
- `model` — model for the subagent process (optional; falls back to the session default)
- `tools` — comma-separated tool allowlist (optional; read-only agents get
  `read, grep, find, ls, bash`, orchestrators get everything including `subagent`)

## Notes

- Original opencode frontmatter (`mode`, `temperature`, `color`) is preserved
  as `x-opencode-*` keys in `prompts/` — pi ignores unknown keys, so they are
  inert metadata.
- Descriptions containing `: ` must be quoted — pi's YAML frontmatter parser
  rejects unquoted colons in plain scalars.
- `tools/migrate-opencode-agents.py` regenerates `agents/` and `prompts/` from
  the opencode config in this repo.
