#!/usr/bin/env sh
#
# Toggle the current window (all panes) between light and dark themes.
set -e

default_window_style='fg=#d0cfcc,bg=#1E1E2E'
light_window_style='fg=#171421,bg=#EFF1F5'
current_window_style=$(tmux show -Av window-style)

case $current_window_style in
    $default_window_style|'default')
        # Change to the alternate window style.
        tmux set window-style $light_window_style
        tmux set pane-active-border-style 'fg=#1C71D8,bg=#EFF1F5'
        tmux set pane-border-style 'fg=#999999,bg=#EFF1F5' 
        echo "let &background='light'" > ~/.vimrc_background
        tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=light" ENTER
        ;;
    *)
        # Change back to the default window style.
        tmux set window-style $default_window_style
        tmux set pane-active-border-style 'fg=#1C71D8,bg=#1E1E2E'
        tmux set pane-border-style 'fg=#ffffff,bg=#1E1E2E' 
        echo "let &background='dark'" > ~/.vimrc_background
        tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=dark" ENTER
        ;;
esac
