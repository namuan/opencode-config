# opencode-config

My [opencode](https://opencode.ai) agent configuration, with the agents also
migrated to [pi](https://github.com/earendil-works/pi-coding-agent).

## Contents

- `agents/` — custom agents: orchestrator, planner, reviewer, sidekick,
  design, research, TDD red-green-refactor cycle, codebase docs analysis,
  axiom scout/sage router
- `agent-prompts/` — shared prompts referenced by the agents
- `opencode.json` — agent, model, and permission configuration
- `tui-plugins/cache-stats.tsx` — session cache statistics TUI panel
- `pi/` — the same agents migrated to pi: prompt templates, subagent
  definitions, and a permission gate ([details](pi/README.md))

## pi install

```sh
./pi/setup.sh   # symlinks pi/{agents,prompts,extensions} into ~/.pi/agent
```

Restart pi. Type `/` for the prompt templates; ask the model to use the
`subagent` tool to delegate work to the agents.
