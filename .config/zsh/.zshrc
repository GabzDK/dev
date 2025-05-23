export ZSH="$HOME/.config/zsh/oh-my-zsh"
zstyle ':omz:update' mode reminder

# Theme
# ZSH_THEME="gentoo"

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Plugins 
plugins=(git fzf zsh-syntax-highlighting fast-syntax-highlighting zsh-autosuggestions) 

# Source Oh My Zsh (minimal)
source $ZSH/oh-my-zsh.sh

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt inc_append_history

#xorg 
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# Path
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# Aliases (consolidated)
# Sudo commands
alias mount='sudo mount' umount='sudo umount' sv='sudo sv' pacman='sudo pacman' updatedb='sudo updatedb' su='sudo su' shutdown='sudo shutdown' poweroff='sudo poweroff' reboot='sudo reboot'

# Verbosity
alias cp='cp -iv' mv='mv -iv' rm='rm -vI' bc='bc -ql' rsync='rsync -vrPlu' mkd='mkdir -pv'

# Colorized commands
alias grep='grep --color=auto' diff='diff --color=auto' ccat='highlight --out-format=ansi' ip='ip -color=auto'

# Shortcuts
alias ka='killall' g='git' sdn='shutdown -h now' e="$EDITOR" v="$EDITOR" p='pacman' vim='nvim'

# Mirrors
alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

# Process management
alias psa='ps auxf' psgrep='ps aux | grep -v grep | grep -i -e VSZ -e' psmem='ps auxf | sort -nr -k 4' pscpu='ps auxf | sort -nr -k 3'

# Journalctl
alias jctl='journalctl -p 3 -xb'

# Eza aliases (simplified with function)
ls_parent() {
  local levels=${1:-1}
  local path="../"
  for ((i=1; i<levels; i++)); do path+="../"; done
  eza -al --icons --color=always --group-directories-first "$path"
}
alias ls='eza -al --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias ll='eza -l --icons --color=always --group-directories-first'
alias lt='eza -aT --icons --color=always --group-directories-first'
alias l.='ls_parent 1'
alias l..='ls_parent 2'
alias l...='ls_parent 3'

# Shell integrations
export MANPAGER='nvim +Man!'
source <(zoxide init --cmd cd zsh)
bindkey '^F' fzf-cd-widget
source <(fzf --zsh)

# fnm (optimized)
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

#the doom slayer.
export PATH="$HOME/.config/emacs/bin:$PATH" 

# chadrust
. "$HOME/.cargo/env"            # For sh/bash/zsh/ash/dash/pdksh
