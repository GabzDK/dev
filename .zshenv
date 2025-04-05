export ZDOTDIR="$HOME/.config/zsh"
export CM_LAUNCHER='dmenu'
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL='com.mitchellh.ghostty'
export BROWSER='firefox'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# fnm
FNM_PATH="/home/kali/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/kali/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
