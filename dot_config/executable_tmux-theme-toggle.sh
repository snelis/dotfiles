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
        tmux list-windows -a -F "#{window_id}" | while read -r window_id; do
          tmux setw -t "$window_id" window-style $light_window_style
          tmux setw -t "$window_id" pane-active-border-style 'fg=#1C71D8,bg=#EFF1F5'
          tmux setw -t "$window_id" pane-border-style 'fg=#999999,bg=#EFF1F5' 
        done
        tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=light" ENTER
        ;;
    *)
        # Change back to the default window style.
        tmux list-windows -a -F "#{window_id}" | while read -r window_id; do
          tmux setw -t "$window_id" window-style $default_window_style
          tmux setw -t "$window_id" pane-active-border-style 'fg=#1C71D8,bg=#1E1E2E'
          tmux setw -t "$window_id" pane-border-style 'fg=#ffffff,bg=#1E1E2E' 
        done
        tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=dark" ENTER
        ;;
esac
