# Sourcing other config files
source $HOME/.config/fish/aliases.fish

# Adding rust-related stuff to PATH
set PATH $HOME/.cargo/bin $PATH

# And also python's files
set PATH $HOME/.local/bin $PATH

# Add nix binaries to PATH if on other distro
if not test -e /etc/NIXOS
    set PATH $HOME/.nix-profile/bin/ $PATH
end

# Disabling welcome message in fish
set -U fish_greeting

# Neovim as a default editor
set -Ux EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    fish_vi_cursor
end

function fish_add_path

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

# Enable mouse support in less (and also man)
# Without --RAW-CONTROL-CHARS stuff breaks like pkgbuilds in yay and paru
export LESS='--mouse --wheel-lines=3 --RAW-CONTROL-CHARS'

# For correct cursors in wezterm
export XCURSOR_THEME=Breeze_Light wezterm
export XCURSOR_SIZE=30 wezterm

# Just a glorified alias
function rsynclocal
    rsync -avhcWP --no-compress --delete-after $argv[1] $argv[2]
end

# Shell wrapper for launching yazi file manager with the ability to change cwd
# Copied from here: https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function ya
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Starship as a prompt engine
starship init fish | source
