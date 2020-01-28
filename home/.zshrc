# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git docker autojump pip helm ansible pyenv minikube)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias cb="xclip -selection primary"
# alias kub="kubectl"
# alias vim="nvim"
# alias fix-i3-size="gsettings set org.mate.font-rendering dpi 180 ; i3-msg restart ; sleep 1 ; gsettings set org.mate.font-rendering dpi 0.0"

# export EDITOR=nvim
# export GOPATH=~/go
# export GOPROXY=https://proxy.golang.org/
# export GOROOT=/usr/lib/go
# export LOCALBIN="~/.local/bin"
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$HOME/.local/bin:$PATH
# export PATH=~/.npm-global/bin:$PATH
# export PATH=~/.yarn/bin:$PATH

# export VAULT_ADDR='https://vault.we-riot.local:8200'
# export VAULT_SKIP_VERIFY=1

# source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
# fpath+=~/.zfunc

# # source $ZSH/oh-my-zsh.sh
# export LD_LIBRARY_PATH=/opt/cuda/lib64/
# #source /opt/anaconda/bin/activate root


# eval "$(pyenv init - zsh)"
# eval "$(pyenv virtualenv-init -)"
# source <(kubectl completion zsh)
# source <(oc completion zsh)
# #source <(helm completion zsh)
# # export PIP_EXTRA_INDEX_URL=https://devpi.platform.we-riot.com/root/weriot 
# export PYTHON_CONFIGURE_OPTS="--enable-shared"

# TERM=screen-256color

(cat ~/.cache/wal/sequences &)
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle pyenv
antigen bundle autojump
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 50% --border --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'
export FZF_CTRL_R_OPTS="--no-height --no-preview"
export EDITOR='nvim'
export VISUAL='nvim'

# direnv
command -v direnv 1>/dev/null && eval "$(direnv hook zsh)"

[[ -z "$TMUX"  ]] && { exec tmux new-session && exit;}
