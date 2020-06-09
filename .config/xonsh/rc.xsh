# Adds ~/.local/bin to path
$PATH = $PATH + $(du "$HOME/.local/bin" | cut -f2).split("\n")[:-1]

# Default programs
$EDITOR = "nvim"
$TERMINAL = "st"
$BROWSER = "brave"
$READER = "zathura"

# Some aliases
aliases["e"] = "$EDITOR"
aliases["gcm"] = "git commit -m"
aliases["gp"] = "git push"
aliases["ga"] = "git add"
aliases["dots"] = "/usr/bin/git --git-dir=$HOME/.config/.dotfiles/ --work-tree=$HOME"

# ~ cleanup
$XDG_CONFIG_HOME="$HOME/.config"
$XDG_DATA_HOME="$HOME/.local/share"
$XDG_CACHE_HOME="$HOME/.cache"
#$XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
$NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
$GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
$LESSHISTFILE="-"
$WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
$INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
$ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
#$GNUPGHOME="$XDG_DATA_HOME/gnupg"
$WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
$KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
$PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
$TMUX_TMPDIR="$XDG_RUNTIME_DIR"
$ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
$CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
$GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
$ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
$UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
$HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# Other program settings:
$DICS="/usr/share/stardict/dic/"
$SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
$FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
$LESS="-R"
$LESS_TERMCAP_mb = "\033[01;31m"     # begin blinking
$LESS_TERMCAP_md = "\033[01;31m"     # begin bold
$LESS_TERMCAP_me = "\033[0m"         # end mode
$LESS_TERMCAP_so = "\033[01;44;36m"  # begin standout-mode (bottom of screen)
$LESS_TERMCAP_se = "\033[0m"         # end standout-mode
$LESS_TERMCAP_us = "\033[00;36m"     # begin underline
$LESS_TERMCAP_ue = "\033[0m"         # end underline
$LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
$QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
$MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
$AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
$_JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# Check to launch startx
if $(tty) == "/dev/tty1\n" and $(pidof Xorg) == "":
	exec startx

# Load shortcuts
source $HOME/.config/xonsh/shortcuts.xsh

# --- PROMPT --- #
$VI_MODE = True
$UPDATE_PROMPT_ON_KEYPRESS = True

# Vi indicator
from prompt_toolkit.key_binding import vi_state
def vi_mode():
    state = __xonsh__.shell.shell.prompter.app.vi_state
    mode = state.input_mode
    if mode == vi_state.InputMode.INSERT:
        return '{BOLD_GREEN}[I]{NO_COLOR}'
    elif mode == vi_state.InputMode.REPLACE:
        return '{BOLD_PURPLE}[R]{NO_COLOR}'
    else:
        return '{BOLD_YELLOW}[N]{NO_COLOR}'

$PROMPT_FIELDS['vi_mode'] = vi_mode

$PROMPT = '{vi_mode} {BOLD_GREEN}{cwd_base}{NO_COLOR} ) '
$XONSH_COLOR_STYLE = 'fruity'
xontrib load z
