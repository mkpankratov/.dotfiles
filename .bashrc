if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#source <(svc-pkg-completion completion bash)
source <(kubectl completion bash)

set_title() {
    echo -ne "\033]\007"
}

# Update title before each command
PROMPT_COMMAND=set_title

export PS1='\w \$ '
export EDITOR='nvim'
export VISUAL='nvim'
export NPM_REPO='idbo-npm-pub'

# Created by `pipx` on 2025-12-22 18:30:15
export PATH="$PATH:/home/Mpankratov/.local/bin"

. "$HOME/.local/share/../bin/env"

# opencode
export PATH=/home/Mpankratov/.opencode/bin:$PATH
