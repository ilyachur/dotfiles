#!/bin/bash

verify_tmux_version () {
    tmux_home=~/.tmux
    tmux_version="$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")"

    if [[ $(echo "$tmux_version >= 2.1" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/tmux_2.1_up.conf"
    else
        tmux source-file "$tmux_home/tmux_2.1_down.conf"
    fi
    # Select theme
    if [[ $(echo "$tmux_version > 2.8" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/colors/tmux-theme_2.9_up.conf"
    else
        tmux source-file "$tmux_home/colors/tmux-theme.conf"
    fi
}

verify_tmux_version
