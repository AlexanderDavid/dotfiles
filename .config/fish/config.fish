# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:"(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')
export LANG="en_US.UTF-8"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="launch_polybar"

# ~/ Clean-up:
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export ALSA_CONFIG_PATH="$HOME/.config/alsa/asoundrc"
export ANDROID_SDK_HOME="$HOME/.config/android"
export ANSIBLE_CONFIG="$HOME/.config/ansible/ansible.cfg"
export CARGO_HOME="$HOME/.local/share/cargo"
export GOPATH="$HOME/.local/share/go"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export HISTFILE="$HOME/.local/share/history"
export INPUTRC="$HOME/.config/inputrc"
export KODI_DATA="$HOME/.local/share/kodi"
export LESSHISTFILE="-"
export LESSHISTFILE="-"
export MU_HOME="$HOME/.cache/mu"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export UNISON="$HOME/.local/share/unison"
export WGETRC="$HOME/.config/wget/wgetrc"
export WINEPREFIX="$HOME/.local/share/wineprefixes/default"
export XAUTHORITY="$HOME/.cache/Xauthority"
export ZDOTDIR="$HOME/.config/zsh"

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MAILDIR="$HOME/.local/share/mail/"

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

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

zoxide init fish | source

# Make the backspace key work in st
tput smkx

# Always do fancy shell for pipenv
set pipenv_fish_fancy yes

# Load the keymap if tty
sudo -n loadkeys $HOME/.local/share/larbs/ttymaps.kmap 2>/dev/null
