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

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

# Golang
export PATH=$HOME/go/bin:$PATH

# Java
export PATH=$(brew --prefix)/opt/openjdk/bin:$PATH

# Kubernetes
source <(kubectl completion zsh)
