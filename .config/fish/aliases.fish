#!/bin/sh

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Verbosity and settings that you pretty much just always are going to want.
alias bat="cat /sys/class/power_supply/BAT?/capacity"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias mkd="mkdir -pv"
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias ffmpeg="ffmpeg -hide_banner"
alias ll="lsd --group-dirs first -alh"
alias lh="ls --group-dirs first -lh"
alias dots='/usr/bin/git --git-dir=$HOME/.config/.dotfiles/ --work-tree=$HOME'
alias server='python -m http.server'

# Colorize commands when possible.
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"

# These common commands are just too long! Abbreviate them.
alias ka="killall"
alias g="git"
alias sdn="sudo shutdown -h now"
alias f="$FILE"
alias e="$EDITOR"
alias v="$EDITOR"
alias p="sudo pacman"
alias sv="sudo $EDITOR"
alias mbsync="mbsync -c $HOME/.config/isync/mbsyncrc"

# This alias is important. It enables the `pauseallmpv` command.
# alias mpv="mpv --input-ipc-server=/tmp/mpvsoc(date +%s)"

# Some other stuff
alias magit="nvim -c MagitOnly"
alias ref="shortcuts >/dev/null; source ~/.config/shortcutrc"
alias weath="less -S ~/.local/share/weatherreport"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"
