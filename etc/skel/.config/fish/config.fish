set fish_greeting

# Search the repos if a command could not be found.
source /usr/share/doc/pkgfile/command-not-found.fish

# Show a nice prompt.
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g color_user_bg white
set -g color_user_str black
set CONFIG_DIR (dirname (status -f))
source $CONFIG_DIR/prompt.fish
