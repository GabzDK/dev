export ZDOTDIR="$HOME/.config/zsh"
export CM_LAUNCHER='dmenu'
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL='kitty'
export BROWSER='firefox'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
