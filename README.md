# ari-zshlib

Ari's zsh and bash script library: logging, dry runs, waits with a status line, timeouts.

```zsh
source /path/to/ari-zshlib/lib/logging.zsh   # log::info, log::warn, log::err, run_cmd
source /path/to/ari-zshlib/lib/dry_run.zsh   # run_mut, is_dry_run: mutations are a dry run unless --execute
log::info "copied | files='3' dest='/tmp/x'"
```

With Nix: `nix build github:AriSweedler/ari-zshlib`, then source `result/lib/logging.zsh`.

| File | What it gives |
|---|---|
| `lib/log.zsh` | the logging library: tiers, colours, `run_cmd`, notifications |
| `lib/logging.zsh` | `log.zsh` for scripts an LLM reads back: no timestamp preamble |
| `lib/dry_run.zsh` | `--dry-run` / `--execute` handling and `run_mut` |
| `lib/await.zsh` | waits with one status line: `await::run`, `await::until` |
| `lib/run_with_timeout.zsh` | run a command with a deadline |
| `lib/investigation_folder.zsh` | a timestamped scratch folder per run |
| `lib/strip_ansi.zsh`, `lib/log_rotate.zsh` | strip escape codes; rotate a log file |
| `lib/log.bash`, `lib/arg.bash` | the bash pair: logging and argument parsing |
| `lib/tmux-pane.sh` | POSIX sh helpers for acting on a tmux pane safely |

This repo is a mirror. The files are written in [Ari's dotfiles](https://github.com/AriSweedler/dotfiles) and exported here.
