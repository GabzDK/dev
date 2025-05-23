# Path to Oh My Zsh installation
export ZSH="$HOME/.config/zsh/oh-my-zsh"
zstyle ':omz:update' mode reminder

# Theme
ZSH_THEME="gentoo"

# Plugins (optimized)
plugins=(git fzf) # Core plugins only; others loaded asynchronously

# Source Oh My Zsh (minimal)
source $ZSH/oh-my-zsh.sh

# History (optimized for performance)
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#xorg 
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi


# Path
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# Asynchronous plugin loading
async_load() {
  # Load fast-syntax-highlighting
  [ -f "$ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source "$ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
  # Load zsh-autosuggestions
  [ -f "$ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
}
async_load &!

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

# fnm
FNM_PATH="/home/zeroday/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/zeroday/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Compile .zshrc for faster loading
[ -f ~/.zshrc.zwc ] || zcompile ~/.config/zsh/.zshrc
