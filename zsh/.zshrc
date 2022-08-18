export WORKON_HOME=$HOME/.virtualenvs   # Optional
# export PROJECT_HOME=$HOME/projects      # Optional
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
# homebrew stores in /usr/local/cellar/<tool>
# 	links to above are stored in /usr/local/bin
# /Library/Python/3.6.{bin,lib} 
# 	because couldn't install PyQt in /usr/local with homebrew
# /usr/local/opt/coreutils/libexec/gnubin 
# 	home brew coreutils.  
# /usr/local/opt/python/libexec/bin
# 	pick up this version of python (python3)
# /usr/local/bin:
export PERL5LIB="$HOME/perl5/lib/perl5:$HOME/perl5/lib/AfLib:$HOME/perl5/lib/RkLib"

export PATH="$HOME/bin:$PATH"
# export PATH="/usr/local/lib/python3.6/site-packages:$HOME/Library/Python/3.6/{bin,lib}:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/Cellar/qt/5.11.0/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/Cellar/python@3.10/3.10.2/bin:$PATH"
# export PATH="/usr/local/Cellar/go/1.16.2/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"


export PYTHONPATH="$HOME/code/mylibraries/python/django-getrealty"
# export PATH="/usr/local/Cellar/qt/5.11.0/bin:$HOME/Library/Python/3.6/{bin,lib}:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/python/libexec/bin:/usr/local/bin:$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"     

# colorize man page with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enable go modules support
# https://developers.mattermost.com/contribute/server/dependencies/
export GO111MODULE=on   # this really screwed up my developement area!  use
# go dep for now

# get git of user@hostname in prompt 
DEFAULT_USER="jfrerich"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv dir vcs)
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107

# Set name of the theme to load. 
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_COLOR_SCHEME='light'
# ZSH_THEME="bullet-train"
# BULLETTRAIN_PROMPT_SEPARATE_LINE=false
# BULLETTRAIN_PROMPT_ADD_NEWLINE=false

# enable command auto-correction.
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
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  k
  git
  git-flow
  history-substring-search
  zsh-autosuggestions
  colored-man-pages
  colorize
  dircycle
  zsh-dircolors-solarized
  dirhistory
  virtualenv
  virtualenvwrapper
  you-should-use
)

case `uname` in 
  Darwin)
  ;;
  Linux)
    # needed for ssh-add when on ubuntu, using zsh
    # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent
    
    # add ssh-agent when on Ubuntu Linux 
    plugins+=(ssh-agent)
    
    # must be before source of oh-my-zsh
    zstyle :omz:plugins:ssh-agent identities id_rsa
esac

source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/.private.zsh
source $HOME/mattermost.zsh


setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

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


####################################
# My Personal Setup - from here to EOF
####################################
autoload -U zmv
bindkey -v

source $HOME/.zsh.aliases

case `uname` in 
  Darwin)
    alias top='htop'
    alias cat='bat'
    # alias cat='pygmentize -g -O style=monokai'
#  -f terminal256 -g -P style=monokai $* 
    # mvim - updated to use brew version of macvim.  includes python3 support for
    # pythonmod plugin
    #alias g="mvim"
    alias m="mvim"
    alias vi="mvim -v "
    alias vim="mvim -v "

    # installed with brew install
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  ;;
  Linux)
    # installed with apt install
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
esac

# remap cd to cd && ls 
function cd {
  builtin cd "$@" && ls -F
}

eval `dircolors $HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized/dircolors-solarized/dircolors.ansi-light`


# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
#bindkey -M viins ‘jk’ vi-cmd-mode

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

# FZF
export FZF_PREVIEW_PREVIEW_BAT_THEME='TwoDark'
export FZF_DEFAULT_COMMAND='rg --files' # this is also picked up by vim :Files.  don' use --hidden or .git dir will be included
export FZF_CTRL_T_COMMAND='rg --files --hidden' # don't show hidden files.  don't use --no-ignore so .gitignore works
# export FZF_CTRL_T_COMMAND='rg'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.zsh.functions

export PATH="/usr/local/sbin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

export CONFLUENCE_HOME=$HOME/confluence

# mattermost make test uses the $GO var to run go. Use richgo for better output
export GO=/usr/local/bin/richgo
# export PATH="/usr/local/opt/go@1.12/bin:$PATH"

export FZF_CTRL_T_OPTS='--preview "bat {} --color=always" --height 100%'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin

source <(mmctl completion zsh)

# vim:foldmethod=marker:foldlevel=0

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
