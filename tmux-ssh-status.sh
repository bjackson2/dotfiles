#!/bin/bash
# SSH session -> tmux tab label.
#
# Called from @catppuccin_window_text / @catppuccin_window_current_text in
# .tmux.conf via #(...). tmux expands #{pane_pid} per-window before running this,
# so each tab is evaluated against its own pane.
#
# When the pane's foreground process is an ssh client, print a globe + the remote
# host (e.g. "🌐 benhp.gemcity.net"); otherwise print the fallback unchanged (the
# folder basename), so normal tabs look exactly as before. This matters because
# tmux runs on the LOCAL machine: #{pane_current_path} stays frozen at whatever
# directory ssh was launched from, which is why an SSH tab otherwise shows a
# stale, misleading local folder name.
#
# Usage: tmux-ssh-status.sh <pane_pid> <fallback_label>

pane_pid="$1"
fallback="$2"

# Breadth-first walk of the pane shell's descendants to find an ssh client.
# tmux reports pane_current_command as "ssh", but pane_pid is the shell; the ssh
# process is a child (or deeper, e.g. behind a wrapper), so we search the tree.
# comm is the bare name on Linux ("ssh") and a full path on macOS ("/usr/bin/ssh"),
# so match both forms — but never sshd, autossh, or any *zsh login shell.
find_ssh() {
  local queue=("$1") pid kids k
  while [ ${#queue[@]} -gt 0 ]; do
    pid="${queue[0]}"; queue=("${queue[@]:1}")
    case "$(ps -o comm= -p "$pid" 2>/dev/null)" in
      */ssh|ssh) echo "$pid"; return 0 ;;
    esac
    kids=$(pgrep -P "$pid" 2>/dev/null) || true
    for k in $kids; do queue+=("$k"); done
  done
  return 1
}

# Pull the destination ([user@]host) out of an ssh command line, skipping options
# and any values they consume. The first bare (non "-") token is the destination.
extract_dest() {
  shift  # drop argv[0] (the ssh program name / path)
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -[BbcDEeFIiJLlmOopQRSWw]) shift 2; continue ;;  # option that takes a separate value
      -*) shift; continue ;;                          # any other flag / bundled value (-p22)
      *) printf '%s' "$1"; return 0 ;;                # destination
    esac
  done
  return 1
}

ssh_pid="$(find_ssh "$pane_pid")" || { printf '%s' "$fallback"; exit 0; }

# Intentional word-splitting: ps gives the argv as a space-joined line.
dest="$(extract_dest $(ps -o args= -p "$ssh_pid" 2>/dev/null))" \
  || { printf '%s' "$fallback"; exit 0; }

dest="${dest#ssh://}"   # strip a scheme if invoked as ssh://user@host
host="${dest#*@}"       # strip user@, leaving just the host (no-op if no @)

printf '🌐 %s' "$host"
