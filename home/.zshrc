if [ $SHLVL = 1 ]; then
  tmux attach || tmux
fi

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit

export HISTSIZE=100000
export SAVEHIST=100000
# FYI:
#   https://geoff.greer.fm/lscolors/
#   https://blog.ashija.net/2018/09/04/post-3883/
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

alias vi="nvim"
alias python="python3"
alias pip="pip3"
alias ggr='git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --all --date=short'

setopt noflowcontrol
bindkey "^s" history-incremental-search-forward

setopt interactivecomments

alias awsume=". awsume"

prompt_info() {
  PROMPT="%~ > "
  if [ -n "${AWSUME_PROFILE}" ]; then
    if [ -n "`echo ${AWSUME_PROFILE} | grep -i prd`" ]; then
      PROMPT=$'(%{\033[31m'"${AWSUME_PROFILE}"$'\33[m%})'" ${PROMPT}"
    else
      PROMPT="(${AWSUME_PROFILE}) ${PROMPT}"
    fi
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_info

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

# Golang
export GOBIN=$HOME/go/bin
export PATH=$GOBIN:$PATH

# Java
export PATH=$(brew --prefix)/opt/openjdk/bin:$PATH

# Kubernetes
source <(kubectl completion zsh)
export PATH=$HOME/.krew/bin:$PATH

# asdf
source $(brew --prefix asdf)/libexec/asdf.sh

# kube-ps1
source "/opt/homebrew/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

# Python
export PATH=$PATH:$HOME/.local/bin
