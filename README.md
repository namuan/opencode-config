# opencode-config

My [opencode](https://opencode.ai) agent configuration.

The agents are also migrated to pi — see
[namuan/pi-config](https://github.com/namuan/pi-config) for the pi prompt
templates, subagent definitions, and permission gate.

## Contents

- `agents/` — custom agents: orchestrator, planner, reviewer, sidekick,
  design, research, TDD red-green-refactor cycle, codebase docs analysis,
  axiom scout/sage router
- `agent-prompts/` — shared prompts referenced by the agents
- `opencode.json` — agent, model, and permission configuration
- `tui-plugins/cache-stats.tsx` — session cache statistics TUI panel
