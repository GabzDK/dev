# ZSH STUFF
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/zsh/oh-my-zsh"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
plugins=(git fast-syntax-highlighting  zsh-autosuggestions zsh-syntax-highlighting fzf )

# ZSH_THEME="gentoo"

setopt prompt_subst

FG_USER="%F{#86c1b9}"    # Teal
FG_HOST="%F{#86c1b9}"    # Teal
FG_DIR="%F{#ffdd33}"     # Yellow
FG_GIT="%F{#f6aa11}"     # Orange
FG_PROMPT="%F{#f4f4ff}"  # Beige
RESET="%f"

# Git branch function
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo " ${FG_GIT}(${branch})${RESET}"
}

# Prompt setup
PROMPT='${FG_USER}%n${RESET}@${FG_HOST}%m${RESET} ${FG_DIR}%~${RESET}$(git_branch)
λ '


source $ZSH/oh-my-zsh.sh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# Path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Aliases
alias cal="khal --color calendar"
    alias fetch="$HOME/.local/bin/fetch"

# Verbosity
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \

    
# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" \
    vim="nvim" \

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Changing "ls" to "eza"
alias ls='eza -al --icons --color=always --group-directories-first' # my preferred listing
alias la='eza -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --icons --color=always --group-directories-first'  # long format
alias lt='eza -aT --icons --color=always --group-directories-first' # tree listing
alias l.='eza -al --icons --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al -- icons--color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --icons --color=always --group-directories-first ../../../' # ls on directory 3 levels up


# Shell integrations
export MANPAGER='nvim +Man!'
source <(zoxide init --cmd cd zsh)
# Bind Ctrl+F to the fzf directory search
bindkey '^F' fzf-cd-widget
source <(fzf --zsh)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export HELIX_RUNTIME=$HOME/chad/helix/runtime


# fnm
FNM_PATH="/home/kali/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/kali/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH=$PATH:~/.config/emacs/bin

