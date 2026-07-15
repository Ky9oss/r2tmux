#!/bin/bash
#
# Tmuxify radare2
# By Ky9oss

output=$(tmux capture-pane -p -S 0 -E 1 | grep -E "xAdvc|xaDvc")

if [[ -z "${output// /}" ]]; then
    tmux send-keys -l e!asm.sub.var\; send-keys Enter
    tmux send-keys -l e!asm.sub.rel\; send-keys Enter
else # if Visual panel
    tmux send-keys :
    tmux send-keys -l e!asm.sub.var\; send-keys Enter
    tmux send-keys -l e!asm.sub.rel\; send-keys Enter
    # tmux send-keys C-c
    tmux send-keys Enter
fi
