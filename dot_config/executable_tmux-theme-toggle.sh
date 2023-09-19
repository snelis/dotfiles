#!/usr/bin/env sh
#
# Toggle the current window (all panes) between light and dark themes.
set -e

LIGHTTHEME=Alabaster
DARKTHEME=Tender
DARKTHEME=github_dark_default
DARKTHEME=iTerm-Default
ALACRITTYCONF=~/.config/alacritty/alacritty.yml

# Check if the current theme is dark
if grep -q "theme: $DARKTHEME" "$ALACRITTYCONF"; then
    # Replace the dark theme with the light one
    # sed -i 's/'"$DARKTHEME"'/'"$LIGHTTHEME"'/' "$ALACRITTYCONF"
    alacritty-themes $LIGHTTHEME 1>/dev/null
    # Debug: Print a message to confirm the theme change
    # Find and switch Vim panes to the corresponding background setting
    tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=light" ENTER
else
    # Replace the light theme with the dark one
    # sed -i "s/$LIGHTTHEME/$DARKTHEME/" ~/.config/alacritty/alacritty.yml
    alacritty-themes $DARKTHEME 1>/dev/null
    # Debug: Print a message to confirm the theme change
    # Find and switch Vim panes to the corresponding background setting
    tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE ":set background=dark" ENTER
fi
