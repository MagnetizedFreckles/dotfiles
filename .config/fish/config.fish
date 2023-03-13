# Sourcing other config files
source ~/.config/fish/aliases.fish

# Disabling welcome message in fish
set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    fish_vi_cursor
end

# In case cursors don't work in terminal
set fish_vi_force_cursor

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

# These are my attempts to somehow use system clipboard with fish
function fish_user_key_bindings
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
end

# Starship as a prompt engine
starship init fish | source
