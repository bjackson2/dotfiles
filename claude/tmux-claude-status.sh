#!/bin/bash
# Claude Code state -> tmux tab icon.
#
# Called by Claude Code hooks (see ~/.claude/settings.json). Sets a per-window
# tmux user option (@claude_state) on whichever window the Claude session lives
# in; the catppuccin window text in .tmux.conf renders it at the end of the tab
# label. Works for unfocused tabs because hooks run inside Claude's own pane.
#
# Usage: tmux-claude-status.sh <working|input|done|clear>

cat > /dev/null  # hooks receive JSON on stdin; consume it so the pipe never blocks
[ -n "$TMUX_PANE" ] || exit 0  # Claude running outside tmux: nothing to do

case "$1" in
  working) icon=" 🚀" ;;                            # Claude is working
  input)   icon=" #[fg=#f38ba8]●#[fg=#cdd6f4]" ;;  # red: needs your input
  done)    icon=" #[fg=#a6e3a1]✔#[fg=#cdd6f4]" ;;  # green: finished
  *)       icon="" ;;                              # clear: no Claude session
esac

# -w + a pane target resolves to the window containing that pane
tmux set-option -w -t "$TMUX_PANE" @claude_state "$icon" 2>/dev/null || true
