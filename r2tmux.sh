#!/bin/bash
#
# Tmuxify radare2
# By Ky9oss

KEYWORD="call\\s\\S+"

tmux copy-mode
tmux send-keys -X top-line
tmux send-keys -X search-forward $KEYWORD
tmux send-keys -N 7 -X search-again
tmux send-keys -X begin-selection
tmux send-keys -N 2 e
tmux send-keys y
