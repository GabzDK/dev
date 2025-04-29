export ZDOTDIR="$HOME/.config/zsh"
export CM_LAUNCHER='dmenu'
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL='st'
export BROWSER='firefox'
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
XCURSOR_SIZE=40

# fnm
FNM_PATH="/home/kali/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/kali/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
. "$HOME/.cargo/env"
