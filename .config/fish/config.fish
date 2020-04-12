# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` and the rust binaries to $PATH
# export PATH="$PATH:$HOME/.cargo/bin:"(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*\$//')
export PATH="$PATH:$HOME/.local/bin/statusbar:$HOME/.local/bin/cron:$HOME/.local/bin/"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="slstatus"

# ~/ Clean-up:
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export GNUPGHOME="$HOME/.config/gnupg"
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export XAUTHORITY="$HOME/.cache/Xauthority"
export MU_HOME="$HOME/.cache/mu"
export ALSA_CONFIG_PATH="$HOME/.config/alsa/asoundrc"

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Bootstrap the shortcuts file
[ ! -f ~/.config/fish/shortcuts.fish ] && shortcuts >/dev/null 2>&1

# Start graphical server on tty1 if not already running.
if test (tty) = "/dev/tty1";
	! pgrep -x Xorg >/dev/null && exec startx
end

# Switch escape and caps if tty and no passwd required:
# sudo -n loadkeys ~/.local/share/larbs/ttymaps.kmap 2>/dev/null

# Source my alias, input, and shortcut files
source $HOME/.config/fish/shortcuts.fish
source $HOME/.config/fish/aliases.fish

# Make fish yank and paste from primary clipboard
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

# # Set the cursor shapes for the different vi modes.
# set fish_cursor_default     block      blink
# set fish_cursor_insert      line       blink
# set fish_cursor_replace_one underscore blink
# set fish_cursor_visual      block

thefuck --alias | source

# # Make the backspace key work in st
tput smkx
