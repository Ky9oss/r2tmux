#!/bin/bash
#
# Copy by tmux-passthrough escape sequences instead of normal OSC52.
# Use it when tmux normal osc52 is unavailable due to unknown errors.
# 
# By Ky9oss

copied=$(tmux save-buffer -)
text=$(echo -n "$copied" | base64 -w0)

if [ -n "$TMUX" ]; then
    printf '\ePtmux;\e\e]52;c;%s\e\e\\\e\\' "$text"
else
    # This might be useless cause we have assumed this is in Tmux.
    # But the difference in OSC-52 between Tmux and non-Tmux is useful.
    printf '\e]52;c;%s\a' "$text"
fi
