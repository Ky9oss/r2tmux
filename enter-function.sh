#!/bin/bash
#
# Tmuxify radare2
# By Ky9oss

KEYWORD="call\\s\\S+"

if [ "$1" = "find" ]; then
    tmux copy-mode
    tmux send-keys -X top-line
    tmux send-keys -X search-forward $KEYWORD
elif [ "$1" = "seek" ]; then
    output=$(tmux capture-pane -p -S 0 -E 1 | grep -E "xAdvc|xaDvc")

    # tmux copy-mode
    tmux send-keys w\; send-keys -X begin-selection\; send-keys E\; send-keys -X copy-selection-and-cancel

    function_name="$(tmux show-buffer)"
    if [[ -z "${output// /}" ]]; then
        tmux send-keys -l "pdf@"\; send-keys "$function_name"\; send-keys Enter
    else # if Visual panel
        tmux send-keys :
        tmux send-keys "s "\; send-keys "$function_name"\; send-keys Enter
        # tmux send-keys C-c
        tmux send-keys Enter
    fi

else
    echo "Wrong position parameter in $0: $1"
fi
