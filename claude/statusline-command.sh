#!/bin/bash
# Claude Code statusline: shows active model, cwd, git branch, context window usage, and session cost.
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')

dir_display="${dir/#$HOME/~}"

branch=""
if [ -n "$dir" ] && git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$dir" symbolic-ref --short HEAD 2>/dev/null || git -C "$dir" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ] && [ -n "$(git -C "$dir" status --porcelain 2>/dev/null)" ]; then
    branch="${branch}*"
  fi
fi

line="\033[2m${model}"
[ -n "$dir_display" ] && line="${line} | ${dir_display}"
[ -n "$branch" ] && line="${line} | ${branch}"
[ -n "$used" ] && line=$(printf "%s | Context: %.0f%% used" "$line" "$used")
[ -n "$cost" ] && line=$(printf "%s | \$%.2f session" "$line" "$cost")
line="${line}\033[0m"

printf '%b' "$line"
